package com.last.prj.mem.web;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Principal;
import java.util.ArrayList;
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
import org.springframework.context.annotation.ImportResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCrypt;
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
import com.last.prj.pet.service.PetService;
import com.last.prj.security.CustomUser;
import com.last.prj.security.CustomUserDetailService;

@Controller
public class MemController {

	@Autowired
	private MemService memDao;

	@Autowired
	private PmemService pmemDao;

	@Autowired
	private FfileUtil ffileutil;

	@Autowired
	private PetService petDAO;
	
	@Autowired
	ServletContext sc;

	@Autowired
	CustomUserDetailService cusd;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private String uploadPath;
	
	// ???????????? ???????????? ??????
	@RequestMapping("mdeleteForm")
	public String mdeleteForm(Principal principal, Model model) {
		String m_id = "0";
		if (principal != null) {

			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			if (userDetails.getRole() == "????????????") {
				System.out.println("====??????????????? mid : " + userDetails.getMember().getM_id());
				System.out.println("====??????????????? mname : " + userDetails.getMember().getName());
				m_id  =userDetails.getMember().getM_id();
			}
			model.addAttribute("member", memDao.memberSearch(m_id));
		}
		return "mypage/mdeleteForm";
	}

	// ???????????? ????????????

	@RequestMapping("mdelete")
	public String mdelete( Principal principal, MemVO member,HttpSession session,RedirectAttributes redirectAttr) {
		String m_id = "0";
		if(principal != null) {
			
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			if(userDetails.getRole() == "????????????") {
				System.out.println("====??????????????? mid : " + userDetails.getMember().getM_id());
				System.out.println("====??????????????? mname : " + userDetails.getMember().getName());
				m_id  =userDetails.getMember().getM_id();
				
			}else if(userDetails.getRole() == "???????????????") {
				System.out.println("====??????????????? pid : " + userDetails.getPmember().getP_id());
				System.out.println("====??????????????? pname : " + userDetails.getPmember().getName());
			}else if(userDetails.getRole() =="?????????") {
				
			}
		}
		
		memDao.memberDelete(m_id); //???????????? ??????, end date ?????? ??? ??? ??????
		redirectAttr.addFlashAttribute("delete","?????????????????????????????????.");

		return "redirect:logout";
	}

	// ???????????? ????????????
	@RequestMapping("memberUpdate")
	public String memberUpdate(MultipartFile file, RedirectAttributes redirectAttr, MemVO member, Model model) {
		String originalFileName = file.getOriginalFilename();

		//String webPath = "/resources/upload";
		//String realPath = sc.getRealPath(webPath);
		File savePath = new File(uploadPath);

		if (!savePath.exists())
			savePath.mkdirs();


		if (!originalFileName.isEmpty()) {
			String uuid = UUID.randomUUID().toString();
			String saveFileName = uuid + originalFileName.substring(originalFileName.lastIndexOf("."));
			
			String newPath = uploadPath + File.separator + saveFileName;
			File saveFile = new File(newPath);

			try {
				file.transferTo(saveFile);
				member.setPicture(originalFileName);
				member.setPfile(saveFileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// ???????????? ?????????
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
		String inputPwd = member.getPassword();
		String pwd = encoder.encode(inputPwd);
		member.setPassword(pwd);
		
		
		memDao.memberUpdate(member);
		redirectAttr.addFlashAttribute("memberupdate","?????????????????????????????????.");
		return "redirect:mainMypage";
	}

	
	@RequestMapping("/mconfirmPass")
	public String mconfirmPass(Principal principal,Model model) {
		String m_id = "0";
		if(principal!= null) {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(userDetails.getRole() == "????????????") {
				m_id  =userDetails.getMember().getM_id();
				}
			}
			model.addAttribute("member",memDao.getmemberinfo(m_id));
			return "mypage/mconfirmPass";
	}
	
	@RequestMapping("mconfirmPasscheck")
	@ResponseBody
	public int confirmPasscheck(Principal principal, Model model, MemVO member) {
		String m_id = "0";
		if(principal != null) {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			if(userDetails.getRole() == "????????????") {
				m_id  =userDetails.getMember().getM_id();
				}
			}
		String memberPw = memDao.passCheck(member.getM_id());
		if(member == null || !BCrypt.checkpw(member.getPassword(), memberPw)) {
			return 0;
		} else
		return 1;
	}
	
	
	
	// ????????? ?????????????????? ??????
	@RequestMapping("/memberUpdateForm")
	public String memberUpdateFrom(Model model, Principal principal) {
		String m_id = "0";
		if(principal != null) {
			
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			if(userDetails.getRole() == "????????????") {
				System.out.println("====??????????????? mid : " + userDetails.getMember().getM_id());
				System.out.println("====??????????????? mname : " + userDetails.getMember().getName());
				m_id  =userDetails.getMember().getM_id();
			}else if(userDetails.getRole() == "???????????????") {
				System.out.println("====??????????????? pid : " + userDetails.getPmember().getP_id());
				System.out.println("====??????????????? pname : " + userDetails.getPmember().getName());
			}else if(userDetails.getRole() =="?????????") {
				
			}
			
		}
		model.addAttribute("member", memDao.memberSearch(m_id));
		return "mypage/memberUpdateForm";
	}

	// ????????????????????? ??????
	@RequestMapping("/memberMypage")
	public String memberMypage(Model model, Principal principal) {
		String m_id = "0";
		if(principal != null) {
			
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			if(userDetails.getRole() == "????????????") {
				System.out.println("====??????????????? mid : " + userDetails.getMember().getM_id());
				System.out.println("====??????????????? mname : " + userDetails.getMember().getName());
				m_id  =userDetails.getMember().getM_id();
			}else if(userDetails.getRole() == "???????????????") {
				System.out.println("====??????????????? pid : " + userDetails.getPmember().getP_id());
				System.out.println("====??????????????? pname : " + userDetails.getPmember().getName());
			}else if(userDetails.getRole() =="?????????") {
				
			}
		}
		model.addAttribute("pets", petDAO.petmemberList(m_id));
		model.addAttribute("member", memDao.memberSearch(m_id));
		return "mypage/memberMypage";
	}

	
	
	@RequestMapping("joinForm") // ?????????????????????????????????
	public String joinForm() {
		return "member/joinForm";
	}

	@RequestMapping("pjoinForm") // ?????????????????????????????? ??????
	public String pjoinForm() {
		return "member/pjoinForm";
	}

	@RequestMapping("loginForm") // ???????????????????????????
	public String loginForm() {

		return "member/loginForm";
	}

	
	@RequestMapping("/logout") // ????????????
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home";
	}

	
	@RequestMapping("/memberIdSearchForm") // ???????????? ??????????????? ????????? ??????
	public String memberIdSearchForm() {
		return "member/memIdSearchForm";
	}

	@RequestMapping("/pmemberIdSearch") // ??????????????? ????????? ??????
	@ResponseBody
	public String pmemberIdSearch(String name, String tel) {
		return pmemDao.pmemberIdSearch(name, tel);
	}

	@RequestMapping("/memberIdSearch") // ???????????? ????????? ??????
	@ResponseBody
	public String memberIdSearch(@RequestParam("name") String name, @RequestParam("tel") String tel) {
		System.out.println("????????????????" + memDao.memberIdSearch(name, tel));
		return memDao.memberIdSearch(name, tel);
	}
	
	@RequestMapping("/pwdSearchForm") // ???????????? ??????????????? ????????? ??????
	public String pwdSearchForm() {
		
		return "member/pwdSearchForm";
	}
	
	// ????????? ??????, ??????????????????
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
	        	 
	        	// ???????????? ?????????
	     		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
	     		String new_pw = encoder.encode(pw);
	     		
	        	 mem.setPassword(new_pw);
	        	 memDao.memberPwdUpdate(mem);
	        	 
	         } else if(type == 'P') {
	        	 pmem.setP_id(email);
	        	 
	        	// ???????????? ?????????
		     	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
		     	String new_pw = encoder.encode(pw);
	        	 
	        	 pmem.setPassword(new_pw);
	        	 pmemDao.pmemberPwdUpdate(pmem);
	         }
	        
	         
	         String setFrom = "nuriyy433@gmail.com";
	         String toMail = email;
	         String title = "[BanBanBan] ?????????????????? ??????";
	         String content = email + "?????? ?????????????????????" + pw + "?????????.";

	         try {
	        	MimeMessage message = mailSender.createMimeMessage();
	 			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	 			helper.setFrom(setFrom);
	 			helper.setTo(toMail);
	 			helper.setSubject(title);
	 			helper.setText(content,true);
	 			mailSender.send(message);

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
	
	 //????????? path??????
	@RequestMapping("/mjoin") // ???????????? ????????????
	public String mjoin(@RequestParam("file") MultipartFile file, MemVO member, Model model,RedirectAttributes redirectAttr) {
		String originalFileName = file.getOriginalFilename();
		//String webPath = "/resources/upload";
		//String realPath = sc.getRealPath(webPath);
		
		File savePath = new File(uploadPath);
		if (!savePath.exists())
			savePath.mkdirs();
		if (!originalFileName.isEmpty()) {
			String uuid = UUID.randomUUID().toString();
			String saveFileName = uuid + originalFileName.substring(originalFileName.lastIndexOf("."));
			
			
			  String newPath = uploadPath + File.separator + saveFileName;
			   File saveFile = new File(newPath);
			
			
			try {
				file.transferTo(saveFile);
				member.setPicture(originalFileName);
				member.setPfile(saveFileName);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// ???????????? ?????????
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
		String inputPwd = member.getPassword();
		String pwd = encoder.encode(inputPwd);
		member.setPassword(pwd);

		memDao.memberInsert(member);
		redirectAttr.addFlashAttribute("insert","??????????????????");
		return "redirect:home";
	}
	
	
	/*
	@RequestMapping("/mjoin") // ???????????? ????????????
	public String mjoin(@RequestParam("file") MultipartFile file, MemVO member, Model model,RedirectAttributes redirectAttr) {
		String originalFileName = file.getOriginalFilename();
		String webPath = "/resources/upload";
		String realPath = sc.getRealPath(webPath);
		File savePath = new File(realPath);
		
		//System.out.println("======realPath : "+ realPath);
		//System.out.println("======savePath : "+ savePath);
		if (!savePath.exists())
			savePath.mkdirs();
		
		if (!originalFileName.isEmpty()) {
			String uuid = UUID.randomUUID().toString();
			String saveFileName = uuid + originalFileName.substring(originalFileName.lastIndexOf("."));
			realPath += File.separator + saveFileName;
			File saveFile = new File(realPath);
			
			//System.out.println("======saveFileName : "+ saveFileName);
			//System.out.println("======saveFile : "+ saveFile);
			//System.out.println("======realPath2 : "+ realPath);
			
			try {
				file.transferTo(saveFile);
				member.setPicture(originalFileName);
				member.setPfile(saveFileName);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// ???????????? ?????????
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
		String inputPwd = member.getPassword();
		String pwd = encoder.encode(inputPwd);
		member.setPassword(pwd);

		memDao.memberInsert(member);
		redirectAttr.addFlashAttribute("insert","??????????????????");
		return "redirect:home";
	}
	*/
	
	@RequestMapping("/pjoin_1") // ??????????????? ???????????? 1???
	public String pjoin_1(@RequestParam("file") MultipartFile file, PmemVO pmember, Model model) {
		String originalFileName = file.getOriginalFilename();
		//String webPath = "/resources/upload";
		//String realPath = sc.getRealPath(webPath);
		File savePath = new File(uploadPath);
		if (!savePath.exists())
			savePath.mkdirs();

		if (!originalFileName.isEmpty()) {
			String uuid = UUID.randomUUID().toString();
			String saveFileName = uuid + originalFileName.substring(originalFileName.lastIndexOf("."));
			
			String newPath = uploadPath + File.separator + saveFileName;
			File saveFile = new File(newPath);
			
			try {
				file.transferTo(saveFile);
				pmember.setPicture(originalFileName);
				pmember.setPfile(saveFileName);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// ???????????? ?????????
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
		String inputPwd = pmember.getPassword();
		String pwd = encoder.encode(inputPwd);
		pmember.setPassword(pwd);

		pmemDao.pmemberInsert1(pmember);
		model.addAttribute("p_id", pmemDao.pmemberSelect(pmember));
		return "member/pjoinForm2";
	}
	
	@RequestMapping("/pjoin_2") // ??????????????? ???????????? 2???
	public String pjoin_2(PmemVO pmember, Model model) {

		pmemDao.pmemberInsert2(pmember);
		model.addAttribute("p_id", pmemDao.pmemberSelect(pmember));
		return "member/pjoinForm3";
	}

	@RequestMapping("/pjoin_3") // ??????????????? ???????????? 3???
	public String pjoin_3(String p_id, Model model, List<MultipartFile> multiFileList1,
			List<MultipartFile> multiFileList2, HttpServletRequest request, TimeVO time, @RequestParam List<Integer> code, RedirectAttributes redirectAttr) {
		//System.out.println("?????? ????????????????????? 3???");
		//System.out.println("p_id3:" + p_id);
		System.out.println("code !!!!!"+code);
		//System.out.println(time);
		
		PetcareVO petcare = new PetcareVO();
		petcare.setP_id(p_id);
		for(Integer i : code) {
			System.out.println(i);
			petcare.setCode(i);
			memDao.petcareinsert(petcare);
		}
		
		/*
		List<String> str = new ArrayList<>();
		for(Integer integer: code) {
			str.add(String.valueOf(integer));
		}
		
		String join = String.join(",", str);
		System.out.println(join);
		
		String[] strArr = join.split(",");
		System.out.println(strArr);
*/
		// FfileUtil ffileutil = new FfileUtil(); //????????? autowired?? ??????????????????
		int p_license = ffileutil.multiFileUpload(multiFileList1, request);
		System.out.println("p_license = " + p_license);
		int p_image = ffileutil.multiFileUpload(multiFileList2, request);
		System.out.println("p_image = " + p_image);
		pmemDao.pmemberInsert3(p_id, p_license, p_image); // ?????????????????????
		redirectAttr.addFlashAttribute("insert","??????????????????");
		/*
		 * System.out.println("?????? ??????"); for(int i=0; i<time.getTimeListVO().size () ;
		 * i++) { memDao.otimeinsert(time); }
		 */

		return "redirect:home";
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

	// ????????? ????????????
	@PostMapping("ajaxIsIdCheck")
	@ResponseBody
	public boolean ajaxIsIdCheck(String id) {
		return memDao.isIdCheck(id);
	}

	@PostMapping("pajaxIsIdCheck")
	@ResponseBody
	public boolean pajaxIsIdCheck(String p_id) {
		return pmemDao.isIdCheck(p_id);
	}

	@RequestMapping("/join") // ??????????????? ??????
	public String login() {
		return "member/join";
	}

	@RequestMapping("/jusoPopup")
	public String test() {
		return "member/jusoPopup";
	}

	

	@RequestMapping("/geturi.do")
	@ResponseBody
	public String getKakaoAuthUrl(HttpServletRequest request)  throws Exception {

		String reqUrl = "https://kauth.kakao.com/oauth/authorize" + "?client_id=47ef13464842c3a22235787a9d64e6fc"
				+ "&redirect_uri=http://3.229.152.163:8080/dologin" + "&response_type=code";
		/*+ "&redirect_uri=http://3.229.152.163:8080/dologin" + "&response_type=code";*/
		
		return reqUrl;
	}

	// ????????? ???????????? ??????
	@RequestMapping(value = "/dologin", produces = "application/json; charset=utf8")
	public String oauthKakao(@RequestParam(value = "code", required = false) String code, HttpSession session, HttpServletRequest request,  Model model,MemVO member)
			throws Exception {
					
				
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
			String m_id = userInfo.get("email").toString();
			
			System.out.println("===========================??????======================================================");
			System.out.println(m_id); 
			UserDetails kakaovo = (UserDetails)cusd.loadUserByUsername(m_id);
			Authentication authentication = new UsernamePasswordAuthenticationToken(kakaovo, kakaovo.getPassword(), kakaovo.getAuthorities());
			SecurityContext securityContext = SecurityContextHolder.getContext();
			securityContext.setAuthentication(authentication);
			session = request.getSession(true);
            session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
			/*
			 * model.addAttribute("memberinfo",memDao.memberOne(userInfo.get("email").
			 * toString())); memDao.memberOne(userInfo.get("email").toString());
			 * System.out.println("??????-------------------------------------------");
			 * System.out.println(memDao.memberOne(userInfo.get("email").toString()));
			 */
			
			return "home/home"; // ?????? ????????? ?????? ??????
			
			
			
		} else {
			model.addAttribute("userInfo",userInfo);
			String m_id= userInfo.get("email").toString();
			String name = userInfo.get("nickname").toString();
			member.setM_id(m_id);
			member.setName(name);
			member.setPassword("1234");
			/* member.setPassword(password); */
			memDao.memberInsert(member);
			return "home/home"; // ?????? ????????? ?????? ??????
		}
	}

	// ????????????
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// URL????????? ???????????? ?????? ??? ??? ??????, POST ?????? PUT ????????? ????????? setDoOutput??? true??? ???????????????.
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST ????????? ????????? ???????????? ???????????? ???????????? ?????? ??????
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");

			sb.append("&client_id=47ef13464842c3a22235787a9d64e6fc"); // ????????? ???????????? key
			sb.append("&redirect_uri=http://3.229.152.163:8080/dologin"); // ????????? ????????? ?????? ??????
			/*
			 * sb.append("&redirect_uri=http://3.229.152.163:8080/dologin"); // ????????? ????????? ??????
			 * ??????

			 */
			sb.append("&code=" + authorize_code);

			bw.write(sb.toString());
			bw.flush();

			// ?????? ????????? 200????????? ??????
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// ????????? ?????? ?????? JSON????????? Response ????????? ????????????
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson ?????????????????? ????????? ???????????? JSON?????? ?????? ??????
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
	// ??????????????????
	public HashMap<String, Object> getUserInfo(String access_Token) {

		// ???????????? ????????????????????? ?????? ????????? ?????? ??? ????????? HashMap???????????? ??????
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			// ????????? ????????? Header??? ????????? ??????
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

}
