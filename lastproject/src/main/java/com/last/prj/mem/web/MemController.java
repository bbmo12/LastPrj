package com.last.prj.mem.web;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.last.prj.ffile.web.FfileUtil;
import com.last.prj.mem.service.LoginVO;
import com.last.prj.mem.service.MemService;
import com.last.prj.mem.service.MemVO;
import com.last.prj.mem.service.PetcareVO;
import com.last.prj.mem.service.PmemService;
import com.last.prj.mem.service.PmemVO;
import com.last.prj.mem.service.PriceVO;
import com.last.prj.mem.service.TimeVO;
import com.last.scheduler.Scheduler;

@Controller
public class MemController {

	@Autowired
	private MemService memDao;

	@Autowired
	private PmemService pmemDao;

	@Autowired
	private FfileUtil ffileutil;
	
	
	@Autowired
	ServletContext sc;

	//회원탈퇴 페이지로 이동
	@RequestMapping("mdeleteForm")
	public String mdeleteForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		return "mypage/mdeleteForm";
	}
	
	
	//일반회원 회원탈퇴
	@RequestMapping("mdelete")
	public String mdelete(HttpServletRequest request, MemVO member) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		memDao.memberDelete(m_id);
	
		session.invalidate();
		return  "redirect:home";
	}
	
	// 일반회원 정보수정
	@RequestMapping("memberUpdate")
	public String memberUpdate(MultipartFile file, MemVO member, Model model) {		
		String originalFileName = file.getOriginalFilename();

		String webPath = "/resources/upload";
		String realPath = sc.getRealPath(webPath);

		File savePath = new File(realPath);
		if (!savePath.exists())
			savePath.mkdirs();

		realPath += File.separator + originalFileName;
		File saveFile = new File(realPath);

		if (!originalFileName.isEmpty()) {
			String uuid = UUID.randomUUID().toString();
			String saveFileName = uuid + originalFileName.substring(originalFileName.lastIndexOf("."));

			try {
				file.transferTo(saveFile);
				member.setPicture(originalFileName);
				member.setPfile(saveFileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		memDao.memberUpdate(member);

		return "redirect:memberMypage";
	}

	// 내정보 수정페이지로 이동
	@RequestMapping("/memberUpdateForm")
	public String memberUpdateFrom(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		model.addAttribute("member", memDao.memberSearch(m_id));
		return "mypage/memberUpdateForm";
	}

	// 내정보페이지로 이동
	@RequestMapping("/memberMypage")
	public String memberMypage(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		model.addAttribute("member", memDao.memberSearch(m_id));
		return "mypage/memberMypage";
	}

	@RequestMapping("joinForm") // 일반회원회원가입폼이동
	public String joinForm() {
		return "member/joinForm";
	}

	@RequestMapping("pjoinForm") // 파트너회원회원가입폼 이동
	public String pjoinForm() {
		return "member/pjoinForm";
	}

	@RequestMapping("loginForm") // 일반회원로그인화면
	public String loginForm() {

		return "member/loginForm";
	}

	@RequestMapping("/login") // 일반회원로그인창
	public String loginForm(MemVO member, HttpSession session) {
		member = memDao.memberSelect(member);

		if (member != null) {
			session.setAttribute("member", member);
			session.setAttribute("mId", member.getM_id());
			session.setAttribute("password", member.getPassword());
			
			LoginVO login = new LoginVO();
			login.setId(member.getM_id());
			session.setAttribute("loginInfo", login);
			
		} else {
			return "member/loginForm";
		}

		return "redirect:home";
	}

	@RequestMapping("/logout") // 로그아웃
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home";
	}

	@RequestMapping("/plogin") // 파트너회원 로그인
	public String plogin(PmemVO pmember, HttpSession session) {
		pmember = pmemDao.pmemberSelect(pmember);

		if (pmember != null) {
			session.setAttribute("pmember", pmember);
			session.setAttribute("pId", pmember.getP_id());
			session.setAttribute("password", pmember.getPassword());
			LoginVO login = new LoginVO();
			login.setId(pmember.getP_id());
			session.setAttribute("loginInfo", login);
		} else {
			return "member/loginForm";
		}

		return "redirect:home";
	}

	@RequestMapping("/memberIdSearchForm") // 일반회원 아이디찾기 폼으로 이동
	public String memberIdSearchForm() {
		return "member/memIdSearchForm";
	}

	@RequestMapping("/pmemberIdSearch") // 파트너회원 아이디 찾기
	@ResponseBody
	public String pmemberIdSearch(String name, String tel) {
		return pmemDao.pmemberIdSearch(name, tel);
	}

	@RequestMapping("/memberIdSearch") // 일반회원 아이디 찾기
	@ResponseBody
	public String memberIdSearch(@RequestParam("name") String name, @RequestParam("tel") String tel) {
		return memDao.memberIdSearch(name, tel);
	}

	@RequestMapping("/mjoin") // 일반회원 회원가입
	public String mjoin(@RequestParam("file") MultipartFile file, MemVO member, Model model) {
		String originalFileName = file.getOriginalFilename();

		String webPath = "/resources/upload";
		String realPath = sc.getRealPath(webPath);

		File savePath = new File(realPath);
		if (!savePath.exists())
			savePath.mkdirs();

		realPath += File.separator + originalFileName;
		File saveFile = new File(realPath);	  
	  if(!originalFileName.isEmpty()) {
		  String uuid = UUID.randomUUID().toString();
		  String saveFileName = uuid + originalFileName.substring(originalFileName.lastIndexOf("."));
	  
	  try {
		  file.transferTo(saveFile);
	    member.setPicture(originalFileName);
	    member.setPfile(saveFileName);
	  
	  } catch(Exception e) {
		  e.printStackTrace();
	  	}
	  }
	  
	  memDao.memberInsert(member);	 
	  
	  return "home/home";
	  }
  
	 @RequestMapping("/pjoin_1") // 파트너회원 회원가입 1차
	public String pjoin_1(@RequestParam("file") MultipartFile file, PmemVO pmember, Model model) {
		String originalFileName = file.getOriginalFilename();

		String webPath = "/resources/upload";
		String realPath = sc.getRealPath(webPath);

		File savePath = new File(realPath);
		if (!savePath.exists())
			savePath.mkdirs();

		realPath += File.separator + originalFileName;
		File saveFile = new File(realPath);

		if (!originalFileName.isEmpty()) {
			String uuid = UUID.randomUUID().toString();
			String saveFileName = uuid + originalFileName.substring(originalFileName.lastIndexOf("."));

			try {
				file.transferTo(saveFile);
				pmember.setPicture(originalFileName);
				pmember.setPfile(saveFileName);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		pmemDao.pmemberInsert1(pmember);
		model.addAttribute("p_id", pmemDao.pmemberSelect(pmember));
		return "member/pjoinForm2";
	}

	  @RequestMapping("/pjoin_2") //파트너회원 회원가입 2차
	  public String pjoin_2(PmemVO pmember, Model model) {
		  
		  
		  pmemDao.pmemberInsert2(pmember);
		  model.addAttribute("p_id", pmemDao.pmemberSelect(pmember));
		  return "member/pjoinForm3";
	  }
	  
	  @RequestMapping("/pjoin_3") //파트너회원 회원가입 3차
	  public String pjoin_3(String p_id, Model model, List<MultipartFile> multiFileList1, List<MultipartFile> multiFileList2, HttpServletRequest request, TimeVO time, PriceVO price, PetcareVO petcare) {
		 System.out.println("여기 파트너회원가입 3차");
		 System.out.println("p_id3:"+p_id);
		  
		 
		  
		 // FfileUtil ffileutil = new FfileUtil(); //나중에 autowired?? 넣어서해보기
		  
		  
		  int p_license = ffileutil.multiFileUpload(multiFileList1, request);
		  System.out.println("p_license = " + p_license);
		  
		  int p_image = ffileutil.multiFileUpload(multiFileList2, request);
		  System.out.println("p_image = " + p_image);
		 
		  pmemDao.pmemberInsert3(p_id, p_license, p_image); //파일다중업로드
		  
		  System.out.println("여기 펫케어");
		  for(int i=0; i<petcare.getPetcareVOList().size() ; i++) {
			  memDao.petcareinsert(petcare);
		  }
		  
		  System.out.println("여기 가격");
		  for(int i=0 ; i<price.getPriceVOList().size(); i++) {
			  memDao.servicepriceinsert(price);
		  }
		  
		  System.out.println("여기 시간");
		  for(int i=0; i<time.getTimeListVO().size() ; i++) {
			  memDao.otimeinsert(time);
		  }
		 
		  
		  return "member/joinResult";
	  }

	  //아이디 중복체크
	@PostMapping("ajaxIsIdCheck")
	@ResponseBody
	public boolean ajaxIsIdCheck(String m_id) {
		return memDao.isIdCheck(m_id);
	}
	
	@PostMapping("pajaxIsIdCheck")
	@ResponseBody
	public boolean pajaxIsIdCheck(String p_id) {
		return pmemDao.isIdCheck(p_id);
	}
	
	@RequestMapping("/join") // 회원가입폼 이동
	public String login() {
		return "member/join";
	}

	@RequestMapping("/jusoPopup")
	public String test() {
		return "member/jusoPopup";
	}


	
	
	
	
	// 유저정보조회
	   public HashMap<String, Object> getUserInfo(String access_Token) {

	      // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	      HashMap<String, Object> userInfo = new HashMap<String, Object>();
	      String reqURL = "https://kapi.kakao.com/v2/user/me";
	      try {
	         URL url = new URL(reqURL);

	         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	         conn.setRequestMethod("GET");

	         // 요청에 필요한 Header에 포함될 내용
	         conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	         int responseCode = conn.getResponseCode();
	         System.out.println("responseCode : " + responseCode);

	         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	         String line = "";
	         String result = "";

	         while ((line = br.readLine()) != null) {
	            result += line;
	         }
	         System.out.println("response body : " + result);

	         @SuppressWarnings("deprecation")
	         JsonParser parser = new JsonParser();
	         JsonElement element = parser.parse(result);

	         JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	         JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

	         String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	         String email = kakao_account.getAsJsonObject().get("email").getAsString();

	         userInfo.put("accessToken", access_Token);
	         userInfo.put("nickname", nickname);
	         userInfo.put("email", email);

	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	      return userInfo;
	   }
	
	
	
	
	
	
	
	   @RequestMapping("/geturi.do")
	   @ResponseBody
	   public String getKakaoAuthUrl(HttpServletRequest request) throws Exception {
	      String reqUrl = "https://kauth.kakao.com/oauth/authorize" + "?client_id=47ef13464842c3a22235787a9d64e6fc"
	            + "&redirect_uri=http://localhost/prj/dologin" + "&response_type=code";
	      return reqUrl;
	   }
	
	// 카카오 연동정보 조회
	   @RequestMapping(value = "/dologin", produces = "application/json; charset=utf8")
	   public String oauthKakao(@RequestParam(value = "code", required = false) String code, HttpSession session)
	         throws Exception {
	      System.out.println("#########" + code);
	      String access_Token = getAccessToken(code);
	      System.out.println("###access_Token#### : " + access_Token);

	      HashMap<String, Object> userInfo = getUserInfo(access_Token);
	      System.out.println("###access_Token#### : " + access_Token);
	      System.out.println("###userInfo#### : " + userInfo.get("email"));
	      System.out.println("###nickname#### : " + userInfo.get("nickname"));
	      System.out.println(userInfo);

			
			  if (memDao.idCheck(userInfo.get("email").toString())) {
			  session.setAttribute("memberinfo", memDao.memberOne(userInfo.get("email").toString()));
			  memDao.memberOne(userInfo.get("email").toString());
			 System.out.println("여기-------------------------------------------");
			 System.out.println(memDao.memberOne(userInfo.get("email").toString()));
	         return "redirect:home"; // 본인 원하는 경로 설정
				 }
			  else { session.setAttribute("userInfo", userInfo);
				 return "member/joinForm"; // 본인 원하는 경로 설정
				 }
				 }
				 
				
	   
	   
	// 토큰발급
	   public String getAccessToken(String authorize_code) {
	      String access_Token = "";
	      String refresh_Token = "";
	      String reqURL = "https://kauth.kakao.com/oauth/token";

	      try {
	         URL url = new URL(reqURL);

	         HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	         // URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
	         conn.setRequestMethod("POST");
	         conn.setDoOutput(true);

	         // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	         BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	         StringBuilder sb = new StringBuilder();
	         sb.append("grant_type=authorization_code");
	         sb.append("&client_id=47ef13464842c3a22235787a9d64e6fc"); // 본인이 발급받은 key
	         sb.append("&redirect_uri=http://localhost/prj/dologin"); // 본인이 설정해 놓은 경로
	         sb.append("&code=" + authorize_code);
	         bw.write(sb.toString());
	         bw.flush();

	         // 결과 코드가 200이라면 성공
	         int responseCode = conn.getResponseCode();
	         System.out.println("responseCode : " + responseCode);

	         // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	         String line = "";
	         String result = "";

	         while ((line = br.readLine()) != null) {
	            result += line;
	         }
	         System.out.println("response body : " + result);

	         // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	         JSONParser parser = new JSONParser();
	         JSONObject obj = (JSONObject) parser.parse(result);

	         access_Token = (String) obj.get("access_token");

	         refresh_Token = (String) obj.get("refresh_token");

	         System.out.println("access_token : " + access_Token);
	         System.out.println("refresh_token : " + refresh_Token);

	         br.close();
	         bw.close();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	      return access_Token;
	   }

	  
}