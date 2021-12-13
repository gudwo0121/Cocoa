package mc.sn.cocoa;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mc.sn.cocoa.service.CoachService;
import mc.sn.cocoa.service.ProjectService;
import mc.sn.cocoa.vo.CoachVO;
import mc.sn.cocoa.vo.ProjectVO;

@Controller
public class HomeController {

	@Autowired
	private CoachService coachService;
	@Autowired
	private ProjectService projectService;

	// 프로젝트, 코치 글 전체 조회
	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView home() throws Exception {
		ModelAndView mav = new ModelAndView();

		// 서비스에서 listProjects() 메소드 실행하여 리턴 값을 List타입의 projectList에 저장
		List projectList = projectService.listProjects1();

		// mav에 "projectList" 키값으로 projectList 밸류 값을 저장
		mav.addObject("projectList", projectList);

		String url = "/home";
		mav.setViewName(url);

		return mav;
	}

	// 프로젝트 글 1계층 조회
	@RequestMapping(value = "/view_project1", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView view_project1(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		// 서비스에서 listProjects() 메소드 실행하여 리턴 값을 List타입의 projectList에 저장
		List projectList = projectService.listProjects1();

		// mav에 "projectList" 키값으로 projectList 밸류 값을 저장
		mav.addObject("projectList", projectList);

		String url = "/home";
		mav.setViewName(url);

		return mav;
	}

	// 프로젝트 글 2계층 조회
	@RequestMapping(value = "/view_project2", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView view_project2(@RequestParam("pfield") String pField, HttpServletRequest request,
			HttpServletResponse response, ProjectVO projectVO) throws Exception {
		ModelAndView mav = new ModelAndView();
		projectVO.setpField(pField);

		// 서비스에서 listProjects() 메소드 실행하여 리턴 값을 List타입의 projectList에 저장
		List projectList = projectService.listProjects2(projectVO);

		// mav에 "projectList" 키값으로 projectList 밸류 값을 저장
		mav.addObject("projectList", projectList);

		String url = "/home";
		mav.setViewName(url);

		return mav;
	}

	// 프로젝트 글 3계층 조회
	@RequestMapping(value = "/view_project3", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView view_project3(@RequestParam("pfield") String pField, @RequestParam("level") String level,
			HttpServletRequest request, HttpServletResponse response, ProjectVO projectVO) throws Exception {
		ModelAndView mav = new ModelAndView();

		projectVO.setpField(pField);
		projectVO.setLevel(level);

		// 서비스에서 listProjects() 메소드 실행하여 리턴 값을 List타입의 projectList에 저장
		List projectList = projectService.listProjects3(projectVO);

		// mav에 "projectList" 키값으로 projectList 밸류 값을 저장
		mav.addObject("projectList", projectList);

		String url = "/home";
		mav.setViewName(url);

		return mav;
	}
}