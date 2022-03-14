package com.last.prj.mem.web;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
import com.last.prj.security.CustomUser;

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

	// 회원탈퇴 페이지로 이동
	@RequestMapping("mdeleteForm")
	public String mdeleteForm(Principal principal) {
		if (principal != null) {

			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			if (userDetails.getRole() == "일반회원") {
				System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
				System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());

			} else if (userDetails.getRole() == "파트너회원") {
				System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
				System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
			} else if (userDetails.getRole() == "관리자") {

			}

		}
		return "mypage/mdeleteForm";
	}

	// 일반회원 회원탈퇴
	// 이부
	@RequestMapping("mdelete")
	public String mdelete( Principal principal, MemVO member,HttpSession session) {
		String m_id = "0";
		if(principal != null) {
			
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			if(userDetails.getRole() == "일반회원") {
				System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
				System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
				m_id  =userDetails.getMember().getM_id();
				
			}else if(userDetails.getRole() == "파트너회원") {
				System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
				System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
			}else if(userDetails.getRole() =="관리자") {
				
			}
		}
		memDao.memberDelete(m_id); //업데이트 이름, end date 빼고 다 널 시킴
		

		session.invalidate();
		return "redirect:home";
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
		
		// 비밀번호 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
		String inputPwd = member.getPassword();
		String pwd = encoder.encode(inputPwd);
		member.setPassword(pwd);
		
		
		memDao.memberUpdate(member);
		return "redirect:memberMypage";
	}

	// 내정보 수정페이지로 이동
	@RequestMapping("/memberUpdateForm")
	public String memberUpdateFrom(Model model, Principal principal) {
		String m_id = "0";
		if(principal != null) {
			
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			if(userDetails.getRole() == "일반회원") {
				System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
				System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
				m_id  =userDetails.getMember().getM_id();
			}else if(userDetails.getRole() == "파트너회원") {
				System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
				System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
			}else if(userDetails.getRole() =="관리자") {
				
			}
			
		}
		model.addAttribute("member", memDao.memberSearch(m_id));
		return "mypage/memberUpdateForm";
	}

	// 내정보페이지로 이동
	@RequestMapping("/memberMypage")
	public String memberMypage(Model model, Principal principal) {
		String m_id = "0";
		if(principal != null) {
			
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			if(userDetails.getRole() == "일반회원") {
				System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
				System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
				m_id  =userDetails.getMember().getM_id();
			}else if(userDetails.getRole() == "파트너회원") {
				System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
				System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
			}else if(userDetails.getRole() =="관리자") {
				
			}
		}
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

	/*
	 * @RequestMapping("/login") // 일반회원로그인창 public String loginForm(MemVO member,
	 * HttpSession session) { member = memDao.memberSelect(member);
	 * 
	 * if (member != null) { session.setAttribute("member", member);
	 * session.setAttribute("mId", member.getM_id());
	 * session.setAttribute("password", member.getPassword());
	 * 
	 * LoginVO login = new LoginVO(); login.setId(member.getM_id());
	 * session.setAttribute("loginInfo", login); } else { return "member/loginForm";
	 * } return "redirect:home"; }
	 */
	@RequestMapping("/logout") // 로그아웃
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home";
	}

	/*
	 * @RequestMapping("/plogin") // 파트너회원 로그인 public String plogin(PmemVO pmember,
	 * HttpSession session) { pmember = pmemDao.pmemberSelect(pmember);
	 * 
	 * if (pmember != null) { session.setAttribute("pmember", pmember);
	 * session.setAttribute("pId", pmember.getP_id());
	 * session.setAttribute("password", pmember.getPassword()); LoginVO login = new
	 * LoginVO(); login.setId(pmember.getP_id()); session.setAttribute("loginInfo",
	 * login); } else { return "member/loginForm"; }
	 * 
	 * return "redirect:home"; }
	 */
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
	
	@RequestMapping("/pwdSearchForm") // 일반회원 아이디찾기 폼으로 이동
	public String pwdSearchForm() {
		return "member/pwdSearchForm";
	}
	
	// 이메일 인증, 비밀번호찾기
	@RequestMapping("/searchPassword")
	   public String searchPassword(@RequestParam("id") String uid, Model model, RedirectAttributes re) {
	      LoginVO login = memDao.searchPwd(uid);
	      MemVO mem = new MemVO();
	      PmemVO pmem = new PmemVO();
	      
	      if (login != null) {
	         String email = login.getId();
	         String pw = "";
	         for (int i = 0; i < 6; i++) {
	            pw += (char) ((Math.random() * 26) + 97);
	         }
	        
	         char type = login.getUser_type();
	         
	         if(type == 'M') {
	        	 mem.setM_id(email);
	        	 
	        	// 비밀번호 암호화
	     		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
	     		String new_pw = encoder.encode(pw);
	     		
	        	 mem.setPassword(new_pw);
	        	 memDao.memberPwdUpdate(mem);
	        	 
	         } else if(type == 'P') {
	        	 pmem.setP_id(email);
	        	 
	        	// 비밀번호 암호화
		     	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
		     	String new_pw = encoder.encode(pw);
	        	 
	        	 pmem.setPassword(new_pw);
	        	 pmemDao.pmemberPwdUpdate(pmem);
	         }
	        
	         try {
	            // int index = username.indexOf("@");
	            // int indexPw = password.indexOf(",");
	            String id = "nuriyy433";// id
	            String pwd = "";// 비번 입력해야됨
	            String host = "smtp.gmail.com";
	            // 네이버 이메일 주소중 @ naver.com앞주소만 기재합니다.
	            // 네이버 이메일 비밀번호를 기재합니다.
	            int port = 465;
	            // 메일 내용
	            // 메일을 발송할 이메일 주소를 기재해 줍니다.
	            Properties props = System.getProperties();
	            props.put("mail.smtp.host", host);
	            props.put("mail.smtp.port", port);
	            props.put("mail.smtp.auth", "true");
	            props.put("mail.smtp.ssl.enable", "true");
	            props.put("mail.smtp.ssl.trust", host);
	            props.put("mail.debug", "true");
	            /*
	             * System.out.println(password); System.out.println(username.substring(0,
	             * index));
	             */
	           Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {

	               // String un=username.substring(0, index);
	               // String pw=password.substring(0,indexPw);
	               protected PasswordAuthentication getPasswordAuthentication() {
	                  return new PasswordAuthentication(id, pwd);
	               }
	            });
	            session.setDebug(true);
	            // for debug
	            Message mimeMessage = new MimeMessage(session);
	            mimeMessage.setFrom(new InternetAddress(id + "@gmail.com"));// 보내는사람 주소
	            mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email));// 받는사람 주소
	            mimeMessage.setSubject("[BanBanBan] 임시비밀번호 발급");
	            mimeMessage.setText(email + "님의 임시비밀번호는" + pw + "입니다");
	            Transport.send(mimeMessage);

	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	         
	         re.addFlashAttribute("resultMsg1", "result1");
	         return "redirect:/loginForm";
	      } else {
	    	  re.addFlashAttribute("resultMsg2", "result2");
	         return "redirect:/pwdSearchForm";
	      }

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
		// 비밀번호 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
		String inputPwd = member.getPassword();
		String pwd = encoder.encode(inputPwd);
		member.setPassword(pwd);

		memDao.memberInsert(member);
		return "redirect:home";
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
		// 비밀번호 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
		String inputPwd = pmember.getPassword();
		String pwd = encoder.encode(inputPwd);
		pmember.setPassword(pwd);

		pmemDao.pmemberInsert1(pmember);
		model.addAttribute("p_id", pmemDao.pmemberSelect(pmember));
		return "member/pjoinForm2";
	}

	@RequestMapping("/pjoin_2") // 파트너회원 회원가입 2차
	public String pjoin_2(PmemVO pmember, Model model) {

		pmemDao.pmemberInsert2(pmember);
		model.addAttribute("p_id", pmemDao.pmemberSelect(pmember));
		return "member/pjoinForm3";
	}

	@RequestMapping("/pjoin_3") // 파트너회원 회원가입 3차
	public String pjoin_3(String p_id, Model model, List<MultipartFile> multiFileList1,
			List<MultipartFile> multiFileList2, HttpServletRequest request, TimeVO time, PetcareVO petcare) {
		System.out.println("여기 파트너회원가입 3차");
		System.out.println("p_id3:" + p_id);
		System.out.println(petcare);
		System.out.println(time);

		// FfileUtil ffileutil = new FfileUtil(); //나중에 autowired?? 넣어서해보기
		int p_license = ffileutil.multiFileUpload(multiFileList1, request);
		System.out.println("p_license = " + p_license);
		int p_image = ffileutil.multiFileUpload(multiFileList2, request);
		System.out.println("p_image = " + p_image);
		pmemDao.pmemberInsert3(p_id, p_license, p_image); // 파일다중업로드
		memDao.petcareinsert(petcare);

		/*
		 * System.out.println("여기 시간"); for(int i=0; i<time.getTimeListVO().size () ;
		 * i++) { memDao.otimeinsert(time); }
		 */

		return "member/joinResult";
	}

	@RequestMapping("addService")
	@ResponseBody
	public int addService(PriceVO price) {
		memDao.servicepriceinsert(price);
		return 1;
	}

	@PostMapping("addO_Time")
	@ResponseBody
	public int addO_Time(TimeVO vo) {
		memDao.otimeinsert(vo);
		return 1;
	}

	// 아이디 중복체크
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
	public String oauthKakao(@RequestParam(value = "code", required = false) String code, Principal principal, Model model)
			throws Exception {
		// 세션 가져오기
				// 로그인 전에도 실행되는 부분이라 null체크
				String id = "";
				if(principal != null) {
					
					CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
					
					if(userDetails.getRole() == "일반회원") {
						//System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
						//System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
						id = userDetails.getMember().getM_id();

					}
				}
				
		System.out.println("#########" + code);
		String access_Token = getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);

		HashMap<String, Object> userInfo = getUserInfo(access_Token);
		System.out.println("------------------------------------------------------------");
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###userInfo#### : " + userInfo.get("email"));
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println(userInfo);

		if (memDao.idCheck(userInfo.get("email").toString())) {

			model.addAttribute("memberinfo",memDao.memberOne(userInfo.get("email").toString()));
			memDao.memberOne(userInfo.get("email").toString());
			System.out.println("여기-------------------------------------------");
			System.out.println(memDao.memberOne(userInfo.get("email").toString()));
			return "redirect:home"; // 본인 원하는 경로 설정
			
			
			
			
			
		} else {
			model.addAttribute("userInfo",userInfo);
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
