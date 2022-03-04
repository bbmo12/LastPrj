package com.last.prj.qna.web;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.last.prj.mem.service.MemService;
import com.last.prj.pet.service.PetService;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.qna.service.Criteria;
import com.last.prj.qna.service.PagingVO;
import com.last.prj.qna.service.QnaMapper;
import com.last.prj.qna.service.QnaService;
import com.last.prj.qna.service.QnaVO;
import com.last.prj.qtag.service.QnaTagService;
import com.last.prj.qtag.service.QnaTagVO;
import com.last.prj.qtag.service.QtagService;
import com.last.prj.qtag.service.QtagVO;
import com.last.prj.report.service.ReportService;
import com.last.prj.report.service.ReportVO;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaDAO;

	@Autowired
	private QnaMapper mapper;

	@Autowired
	private QtagService qtagDAO;

	@Autowired
	private QnaTagService qtDAO;

	@Autowired
	private ReportService reportDao;

	@Autowired
	private MemService memDao;

	@Autowired
	private PetService petDAO;

	@Autowired
	private PmemberService pMemberDao;
	
	@Autowired
	ServletContext sc;

	// 질문글 리스트, 페이징
	@RequestMapping("/qnaMain")
	public String QnaMain(Criteria cri, Model model) {

		model.addAttribute("page", new PagingVO(cri, mapper.getTotal(cri)));
		model.addAttribute("qnaList", mapper.qnaList(cri));
		model.addAttribute("tagList", qtagDAO.tagList());
		model.addAttribute("best", mapper.qnaBest());

		return "qna/qnaMain";

	}

	// 태그 클릭 시 동일 태그 글 검색
	@GetMapping(value = "/tagSearch")
	public String tagSearch(@RequestParam("t_name") String t_name, Criteria cri, Model model) {

		model.addAttribute("page", new PagingVO(cri, mapper.getTotal(cri)));
		model.addAttribute("tagSearch", mapper.tagSearch(t_name));
		model.addAttribute("tagList", qtagDAO.tagList());

		return "qna/tagSearch";
	}

	// 신고 모달 팝업 처리
	@RequestMapping(value = "/newQnaReport", method = RequestMethod.POST)
	public String newQnaReport(HttpServletRequest request, ReportVO report) throws Exception {

		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		String p_id = (String) session.getAttribute("pId");

		reportDao.newQnaReport(report);

		return "qna/qnaDetail";
	}

	// 질문글 상세 조회 + 조회수 증가 + 작성 회원 정보 조회 + 반려동물 정보 조회 + 파트너 회원 정보 + 댓글 갯수
	@RequestMapping(value = "/qnaDetail")
	public String qnaDetail(@RequestParam("q_no") int q_no, @RequestParam("writer") String writer,
			@RequestParam("pet_no") int pet_no, Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		String p_id = (String) session.getAttribute("pId");

		qnaDAO.postCnt(q_no);
		model.addAttribute("qnaDetail", qnaDAO.qnaDetail(q_no));
		model.addAttribute("ansDetail", qnaDAO.ansDetail(q_no));
		model.addAttribute("best", mapper.qnaBest());
		model.addAttribute("writerInfo", memDao.memberOne(writer));
		model.addAttribute("petInfo", petDAO.petOne(pet_no));
		model.addAttribute("cnt", mapper.replyCnt(q_no));

		return "qna/qnaDetail";
	}

	// 로그인 여부 체크 + 질문 폼으로 이동 + m_id별 펫정보 받아감.
	@RequestMapping(value = "/qnaForm")
	public String qnaForm(@RequestParam("m_id") String m_id, HttpSession session, HttpServletResponse write,
			Model model) throws Exception {

		String mId = (String) session.getAttribute("mId");

		if (mId == null) {
			write.setContentType("text/html; charset=UTF-8");
			PrintWriter out_writer = write.getWriter();
			out_writer.println("<script>alert('먼저 로그인하세요.');</script>");
			out_writer.flush();

			return "member/loginForm";
		} else {
			model.addAttribute("petList", petDAO.petmemberList(m_id));
			return "qna/qnaForm";
		}
	}

	// 질문글 작성
	@PostMapping("/qForm")
	public String qForm(HttpServletRequest request, HttpSession session, QnaVO qna, QtagVO qtag, QnaTagVO qnatag)
			throws Exception {

		String mId = (String) session.getAttribute("mId");
		qna.setWriter(mId);
		
		qtagDAO.newTag(qtag);
		qnaDAO.newQna(qna);
		qtDAO.newQtag(qnatag);
		
		return "redirect:/qnaMain";
	}

	// 질문 수정 폼으로 이동 + 기존 글 내용 + 멤버별 펫 정보 받아감.
	@RequestMapping(value = "/qModiForm")
	public String qModiForm(@RequestParam("q_no") int q_no, @RequestParam("m_id") String m_id, HttpSession session, Model model) throws Exception {

		String mId = (String) session.getAttribute("mId");
		
		model.addAttribute("petList", petDAO.petmemberList(m_id));
		model.addAttribute("qnaDetail", qnaDAO.qnaDetail(q_no));	
		return "qna/qModiForm";
	}

	// 질문 게시글 수정 + 태그 삭제 후 재등록
	@RequestMapping(value = "/qModify")
	public String qModify(HttpServletRequest request, QnaVO qna) throws Exception {

		return "qna/qnaDetail";
	}

	// 질문 삭제(1)
	@RequestMapping(value = "/qDeleteOne", method = RequestMethod.POST)
	public String qDeleteOne(@RequestParam("q_no") int q_no, Model model) throws Exception {
		
		qnaDAO.qDeleteOne(q_no);
		qtDAO.delTags(q_no);
		
		return "qna/qnaDetail";
	}

	// 질문 삭제(2)
	@RequestMapping(value = "/qDeleteTwo", method = RequestMethod.POST)
	public String qDeleteTwo(@RequestParam("q_no") int q_no, Model model) throws Exception {

		qnaDAO.qDeleteTwo(q_no);
		qtDAO.delTags(q_no);

		return "qna/qnaMain";
	}

	// 답변글 작성 모달 처리
	@RequestMapping(value = "/newAns", method = RequestMethod.POST)
	public String newAns(HttpServletRequest request, QnaVO qna) throws Exception {

		qnaDAO.newAns(qna);

		return "qna/qnaDetail";
	}

	// 답변글 수정 모달 처리
	@RequestMapping(value = "/ansUpdate", method = RequestMethod.POST)
	public String ansUpdate(HttpServletRequest request, QnaVO qna) throws Exception {

		qnaDAO.ansUpdate(qna);

		return "qna/qnaDetail";
	}

	// 답변글 삭제 ajax
	@RequestMapping(value = "/ansDelete", method = RequestMethod.GET)
	public String ansDelete(@RequestParam("q_no") int q_no, Model model) throws Exception {

		qnaDAO.ansDelete(q_no);
		return "qna/qnaDetail";
	}
	
	//이미지 업로드
	 @RequestMapping(value="/imageUpload", method = RequestMethod.POST)
	    public void imageUpload(HttpServletRequest request,
	    		HttpServletResponse response, MultipartHttpServletRequest multiFile
	    		, @RequestParam MultipartFile upload) throws Exception{
	    	// 랜덤 문자 생성
	    	UUID uid = UUID.randomUUID();
	    	
	    	OutputStream out = null;
	    	PrintWriter printWriter = null;
	    	
	    	//인코딩
	    	response.setCharacterEncoding("utf-8");
	    	response.setContentType("text/html;charset=utf-8");
	    	try{
	    		//파일 이름 가져오기
	    		String fileName = upload.getOriginalFilename();
	    		byte[] bytes = upload.getBytes();
	    		
	    		//이미지 경로 생성
	    		String path = "resources/upload/";	// 이미지 경로 설정(폴더 자동 생성)
	    		String realPath = sc.getRealPath(path);
	    		
	    		String ckUploadPath = realPath + uid + "_" + fileName;
	    		File folder = new File(realPath);
	    		System.out.println("path:"+path);	// 이미지 저장경로 console에 확인
	    		//해당 디렉토리 확인
	    		if(!folder.exists()){
	    			try{
	    				folder.mkdirs(); // 폴더 생성
	    		}catch(Exception e){
	    			e.getStackTrace();
	    		}
	    	}
	    	
	    	out = new FileOutputStream(new File(ckUploadPath));
	    	out.write(bytes);
	    	out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
	    	
	    	String callback = request.getParameter("CKEditorFuncNum");
	    	printWriter = response.getWriter();
	    	String fileUrl = "ckImgSubmit?uid=" + uid + "&fileName=" + fileName; // 작성화면
	    	
	    	// 업로드시 메시지 출력
	    	printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
	    	printWriter.flush();
	    	
	    	}catch(IOException e){
	    		e.printStackTrace();
	    	} finally {
	    		try {
	    		if(out != null) { out.close(); }
	    		if(printWriter != null) { printWriter.close(); }
	    	} catch(IOException e) { e.printStackTrace(); }
	    	}
	    	return;
	    }
	 
	 // 서버로 전송된 이미지 뿌려주기
	    @RequestMapping(value="/ckImgSubmit")
	    public void ckSubmit(@RequestParam(value="uid") String uid
	    		, @RequestParam(value="fileName") String fileName
	    		, HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException{
	    	
	    	//서버에 저장된 이미지 경로
	    	String path = "resources/upload/";	// 이미지 경로 설정(폴더 자동 생성)
    		String realPath = sc.getRealPath(path);
	    	System.out.println("path:"+realPath);
	    	String sDirPath = realPath + uid + "_" + fileName;
	    	
	    	File imgFile = new File(sDirPath);
	    	
	    	//사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
	    	if(imgFile.isFile()){
	    		byte[] buf = new byte[1024];
	    		int readByte = 0;
	    		int length = 0;
	    		byte[] imgBuf = null;
	    		
	    		FileInputStream fileInputStream = null;
	    		ByteArrayOutputStream outputStream = null;
	    		ServletOutputStream out = null;
	    		
	    		try{
	    			fileInputStream = new FileInputStream(imgFile);
	    			outputStream = new ByteArrayOutputStream();
	    			out = response.getOutputStream();
	    			
	    			while((readByte = fileInputStream.read(buf)) != -1){
	    				outputStream.write(buf, 0, readByte); 
	    			}
	    			
	    			imgBuf = outputStream.toByteArray();
	    			length = imgBuf.length;
	    			out.write(imgBuf, 0, length);
	    			out.flush();
	    			
	    		}catch(IOException e){
	    			e.printStackTrace();
	    		}finally {
	    			outputStream.close();
	    			fileInputStream.close();
	    			out.close();
	    			}
	    		}
	    }
}
