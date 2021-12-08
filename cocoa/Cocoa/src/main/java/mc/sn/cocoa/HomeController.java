package mc.sn.cocoa;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mc.sn.cocoa.service.CoachService;
import mc.sn.cocoa.service.ProjectService;
import mc.sn.cocoa.vo.Criteria;
import mc.sn.cocoa.vo.PageMaker;

@Controller
public class HomeController {
	@Autowired
	private ProjectService projectService;
	@Autowired
	private CoachService coachService;

	// 홈화면 이동하면서 프로젝트 카탈로그 리스트 가져오기
	@RequestMapping(value = "/index", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView home(HttpServletRequest request, HttpServletResponse response, Criteria cri) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		//쪽 번호 생성 메서드 객체 생성
		PageMaker pageMaker = new PageMaker();
		
		//쪽 번호와 한 페이지에 게시할 글의 수 세팅
		pageMaker.setCri(cri);
		
		// 총 게시글의 수
		pageMaker.setTotalCount(coachService.countCoach());

		// 서비스에서 listProjects() 메소드 실행하여 리턴 값을 List타입의 projectList에 저장
		List projectList = projectService.listProjects();
		
		// 서비스에서 listCoaches() 메소드 실행하여 리턴 값을 List타입의 coachesList에 저장
		List coachesList = coachService.listCoaches(cri);

		// mav에 "projectList" 키값으로 projectList 밸류 값을 저장
		mav.addObject("projectList", projectList);
		// mav에 "coachesList" 키값으로 coachesList 밸류 값을 저장
		mav.addObject("coachesList", coachesList);
		
		mav.addObject("pageMaker", pageMaker);

		String url = "/home";
		mav.setViewName(url);

		return mav;
	}

	@RequestMapping(value = "/test", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView test(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String url = "/myPageSent";
		mav.setViewName(url);
		return mav;
	}
}