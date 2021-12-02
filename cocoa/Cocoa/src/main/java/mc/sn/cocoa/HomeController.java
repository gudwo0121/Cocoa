package mc.sn.cocoa;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mc.sn.cocoa.service.CoachService;
<<<<<<< HEAD
=======
import mc.sn.cocoa.service.ProjectService;
>>>>>>> upstream/master

@Controller
public class HomeController {
	@Autowired
<<<<<<< HEAD
=======
	private ProjectService projectService;
	@Autowired
>>>>>>> upstream/master
	private CoachService coachService;

	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
<<<<<<< HEAD
	public ModelAndView home() throws Exception{
		ModelAndView mav = new ModelAndView();
		//홈 화면으로 연결
		String url = "/home";
		mav.setViewName(url);
		
		//coachList 호출
		List coachesList = coachService.listCoaches();
		
		//조회한 글 정보를 바인딩한 후 JSP로 전달
		mav.addObject("coachesList", coachesList);
=======
	public ModelAndView home(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		// 서비스에서 listProjects() 메소드 실행하여 리턴 값을 List타입의 projectList에 저장
		List projectList = projectService.listProjects();
		// 서비스에서 listCoaches() 메소드 실행하여 리턴 값을 List타입의 coachesList에 저장
		List coachesList = coachService.listCoaches();

		// mav에 "projectList" 키값으로 projectList 밸류 값을 저장
		mav.addObject("projectList", projectList);
		// mav에 "coachesList" 키값으로 coachesList 밸류 값을 저장
		mav.addObject("coachesList", coachesList);

		String url = "/home";
		mav.setViewName(url);
>>>>>>> upstream/master

		return mav;
	}
	
	
}