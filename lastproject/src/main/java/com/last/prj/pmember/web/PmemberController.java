package com.last.prj.pmember.web;

import java.io.File;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.last.prj.counsel.service.CounselService;
import com.last.prj.counsel.service.CounselVO;
import com.last.prj.ffile.web.FfileUtil;
import com.last.prj.mem.service.MemVO;
import com.last.prj.mem.service.PmemService;
import com.last.prj.mem.service.PriceVO;
import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;
import com.last.prj.pmember.service.PmemberMapper;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.pmember.service.PmemberVO;
import com.last.prj.pmember.service.ReviewService;
import com.last.prj.pmember.service.ReviewVO;
import com.last.prj.pmember.service.TimeVO;
import com.last.prj.reserv.service.ReservationService;
import com.last.prj.reserv.service.ReservationVO;
import com.last.prj.security.CustomUser;

@Controller
public class PmemberController {
	@Autowired
	private PmemberService pMemberDao;
	@Autowired
	private PmemberMapper mapper;
	@Autowired
	private PmemService pmemDao;
	@Autowired
	private ReviewService reviewDao;
	@Autowired
	private ReservationService reservationDao;
	
	@Autowired
	private CounselService counselDao;
	
	@Autowired
	private ServletContext sc;
	@Autowired
	private FfileUtil ffileutil;


	@RequestMapping("/pmemberList")
	public String pmemberList(@RequestParam("code") int code, Model model, Criteria cri) {
		cri.setAmount(12);
		PagingVO paging = new PagingVO(cri, mapper.memberPage(cri));
		
		model.addAttribute("page", paging);// 페이징 수
		model.addAttribute("pageList", mapper.memberPageList(cri));// 페이징 리스트
		return "pmember/memberList";
	}

	// 상세페이지
	@RequestMapping("/pmemberDetail")
	public String pmemberDetail(@RequestParam("id") String p_id, Model model, PriceVO price) {	
		// 파트너 정보
		model.addAttribute("pmemdetail", pMemberDao.getPmemberinfo(p_id)); // pmember
		model.addAttribute("time", pMemberDao.getTime(p_id));// otime
		model.addAttribute("pimage", pMemberDao.getImage(p_id));
		model.addAttribute("plicense", pMemberDao.getLicense(p_id));
		model.addAttribute("price", pmemDao.getPrice(p_id));
		// 후기
		model.addAttribute("counsel", pMemberDao.getCounselReview(p_id));
		model.addAttribute("service", pMemberDao.getServiceReview(p_id));

		return "pmember/memberDetail";
	}

	// 파트너 마이페이지
	@RequestMapping("pmemberMyPage")
	public String mypage(Model model, Principal principal) {
		String p_id = "0";
		if(principal != null) {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(userDetails.getRole() =="파트너회원") {
				p_id = userDetails.getPmember().getP_id();
			}
		}
		model.addAttribute("pmember", pMemberDao.getPmemberinfo(p_id)); //pmember
		model.addAttribute("time", pMemberDao.getTime(p_id));//otime
		model.addAttribute("pimage", pMemberDao.getImage(p_id));
		model.addAttribute("plicense", pMemberDao.getLicense(p_id));
		model.addAttribute("price", pmemDao.getPrice(p_id));
		return "pmember/pmemberMypage";
	}

	// 파트너정보 수정페이지로 이동
	@RequestMapping("pmemberUpdateForm")
	public String pmemberUpdateFrom(Model model, Principal principal) {
		String p_id = "";
		if(principal != null) {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(userDetails.getRole() =="파트너회원") {
				p_id = userDetails.getPmember().getP_id();
			}
		}
		model.addAttribute("pmember", pMemberDao.getPmemberinfo(p_id)); //pmember
		model.addAttribute("time", pMemberDao.getTime(p_id));//otime
		model.addAttribute("pimage", pMemberDao.getImage(p_id));
		model.addAttribute("plicense", pMemberDao.getLicense(p_id));
		model.addAttribute("price", pmemDao.getPrice(p_id));
		return "pmember/pmemberUpdateForm";
	}
	
	//마이페이지수정  
	@PostMapping("pmemberUpdate")

    public String pmemberUpdate(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttr , PmemberVO pmember,TimeVO time, PriceVO price,
    		Model model, Principal principal, List<MultipartFile> multiFileList1,  List<MultipartFile> multiFileList2, HttpServletRequest request) {

		String p_id = "0";
		if(principal != null) {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(userDetails.getRole() =="파트너회원") {
				p_id = userDetails.getPmember().getP_id();
			}
		}
		
		System.out.println("=== file1: " + multiFileList1);
		System.out.println("=== file2: " + multiFileList2);
		
		System.out.println("으아아아악@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+time.toString());

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
		
		if(multiFileList1.isEmpty() && multiFileList1.size() > 0) {
			int f_part1 = ffileutil.multiFileUpload(multiFileList1, request);
			pmember.setP_license(f_part1);
		}
		
		if(multiFileList2.isEmpty() && multiFileList2.size() > 0) {
			int f_part2 = ffileutil.multiFileUpload(multiFileList2, request);
			pmember.setP_image(f_part2);
		}
		
		pMemberDao.pmemberUpdate(pmember);
		pMemberDao.deleteTimeId(time);//시간삭제
		
		//시간 추가
		for(int i=0; i < time.getTimeVOList().size(); i++) {
			if(time.getTimeVOList().get(i).getO_no() != 0){
				pMemberDao.pmemberTime(time.getTimeVOList().get(i));
			}
		}
		pmemDao.deleteServiceId(price);//서비스 삭제
		//서비스 추가
		for(int i=0; i < price.getPriceVOList().size(); i++) {
			if(price.getPriceVOList().get(i).getPrice_no() !=0) {
				pmemDao.insertService(price.getPriceVOList().get(i));
			}	
		}
		redirectAttr.addFlashAttribute("update","수정실패");

		return "redirect:/pmemberMyPage";
	}

	//서비스삭제 
	@RequestMapping("deleteService")
	@ResponseBody
	public int deleteService(PriceVO price) {
		return pmemDao.deleteService(price);
	}
	//시간삭제 
	@RequestMapping("deleteTime")
	@ResponseBody
	public List<TimeVO> deleteTime(TimeVO time) {
		UserDetails userdetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		time.setP_id(userdetails.getUsername());
		pMemberDao.deleteTime(time);
		return pMemberDao.getTime(userdetails.getUsername());
	}
	
	@RequestMapping("pmemberBest")//베스트순위출력
	public String pmemberBest(PmemberVO pmember, Model model) {
		model.addAttribute("pmember", pMemberDao.bestLike(pmember));
		return "pmember/memberMain";
	}
	
	//일반회원 후기작성
	@RequestMapping("serviceReviewInsert")
	public String serviceReview(HttpServletRequest request, ReservationVO vo, ReviewVO review, List<MultipartFile> multiFileList1) {
		System.out.println("=== file: " + multiFileList1);
		System.out.println("=== review : "+review);
		System.out.println("=== vo : "+vo);
		//System.out.println("====review : "+content + rating + r_no);
		//System.out.println("====multiFileList1 : "+ multiFileList1);
		int f_part = ffileutil.multiFileUpload(multiFileList1, request);
		System.out.println("f_part = " + f_part);
		review.setF_part(f_part);
		reviewDao.servicereview(review);
		reservationDao.updatecode(vo);
		
		return "redirect:/reservationSelect";
	}
	//회원탈퇴 페이지로 이동
	@RequestMapping("pmdeleteForm")
	public String mdeleteForm(HttpServletRequest request,Principal principal,Model model) {
		if(principal != null) {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(userDetails.getRole() == "파트너회원") {
				String p_id = userDetails.getPmember().getP_id();
				model.addAttribute("p_id",p_id);
				model.addAttribute("pmember", pMemberDao.getPmemberinfo(p_id)); 
				return "mypage/pmemDeleteForm";
			}
		}
		return null;
	}
	
	//일반회원 회원탈퇴
	@RequestMapping("pmdelete")
	public String mdelete(HttpServletRequest request, MemVO member,Principal principal) {

		if(principal != null) {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(userDetails.getRole() == "파트너회원") {
				String p_id = userDetails.getPmember().getP_id();
				pMemberDao.pmemberNullUpdate(p_id);
				return  "redirect:home";
			}
		}
		return null;
	}
	
	//파트너회원 가입취소
	@PostMapping("joinCancel")
	@ResponseBody
	public int joinCancel(@RequestParam("p_id") String p_id) {
		pMemberDao.pmemberJoinCancel(p_id);
		return 1;
	}
	
	//후기 조회
	@RequestMapping("/reviewSearch")
	@ResponseBody
	public ReviewVO reviewSearch(ReviewVO r_no) {
		return reviewDao.reviewSearch(r_no);
	}
	
	@RequestMapping("counselReviewInsert")
	public String counselReviewInsert(ReviewVO review, CounselVO counsel) {
		
		counselDao.updateCode(counsel);
		reviewDao.counselreview(review);
		
		return "redirect:mycounsel";
	}
	
	
	
	@RequestMapping("cnoreview")
	@ResponseBody
	public ReviewVO cnoreview(int c_no) {

		return reviewDao.cnoreview(c_no);
	}
	
	
}

