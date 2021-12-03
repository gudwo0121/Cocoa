package mc.sn.cocoa.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mc.sn.cocoa.service.MemberService;
import mc.sn.cocoa.vo.MemberVO;

@Controller("memberController")
public class MemberControllerImpl implements MemberController {
	// 프로필 이미지 저장 경로
	private static final String profile_IMAGE_REPO = "C:\\cocoa\\profile_image";
	@Autowired
	private MemberService memberService;

	// 회원가입 화면으로 이동
	@Override
	@RequestMapping(value = "/view_join", method = RequestMethod.GET)
	public ModelAndView view_join(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String url = "/joinForm";
		mav.setViewName(url);
		return mav;
	}

	// 로그인 화면으로 이동
	@Override
	@RequestMapping(value = "/view_login", method = RequestMethod.GET)
	public ModelAndView view_login(@RequestParam(value = "result", required = false) String result,
			HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String url = "/loginForm";
		mav.addObject("result", result);
		mav.setViewName(url);
		return mav;
	}

	// 회원가입
	@Override
	@ResponseBody
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public int join(@ModelAttribute("member") MemberVO memberVO, HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = memberService.joinMember(memberVO);
		return result;
	}
	
	
	@RequestMapping(value = "/view_profileInfo", method = RequestMethod.GET)
	public ModelAndView view_proFileInfo(@RequestParam("profileId") String id,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		System.out.println(id);
		MemberVO memberVO = memberService.searchMember(id);
		System.out.println(memberVO.getName());
		mav.addObject("profileId", memberVO);
		String url = "/profileInfo";
		mav.setViewName(url);
		return mav;
	}

	// 로그인
	@Override
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = memberService.login(member);
		if (memberVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			mav.setViewName("redirect:/");
		} else {
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("redirect:/view_login");
		}
		return mav;
	}

	// 로그아웃
	@Override
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}

	// 아이디 체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception {
		int result = 0;
		result = memberService.idChk(vo);
		return result;
	}
	
	// 파일 업로드
		private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {

			String proImg = null;
			Iterator<String> fileNames = multipartRequest.getFileNames();

			while (fileNames.hasNext()) {

				String fileName = fileNames.next();
				MultipartFile mFile = multipartRequest.getFile(fileName);
				proImg = mFile.getOriginalFilename();

				File file = new File(profile_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);

				if (mFile.getSize() != 0) {
					if (!file.exists()) {
						if (file.getParentFile().mkdirs()) {
							file.createNewFile();
						}
					}
					mFile.transferTo(new File(profile_IMAGE_REPO + "\\" + "temp" + "\\" + proImg));
				}
			}
			return proImg;
		}
		
	// 프로필 이미지 가져오기
	@RequestMapping("/downProfileImg")
	protected void download(@RequestParam("id") String id, @RequestParam("proImg") String proImg,
			HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath = profile_IMAGE_REPO + "\\" + id + "\\" + proImg;
		File image = new File(filePath);

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + proImg);
		FileInputStream in = new FileInputStream(image);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer);
			if (count == -1)
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	//마이페이지 이동
	@Override
	@RequestMapping(value = "/view_myPageProfile", method = RequestMethod.GET)
	public ModelAndView view_myPageProfile(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String url = "/myPageProfile";
		mav.setViewName(url);
		return mav;
	}
}