package mc.sn.cocoa.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mc.sn.cocoa.service.RequestService;
import mc.sn.cocoa.service.ReviewService;
import mc.sn.cocoa.vo.Criteria;
import mc.sn.cocoa.vo.PageMaker;
import mc.sn.cocoa.vo.RequestVO;
import mc.sn.cocoa.vo.ReviewVO;

@Controller("reviewController")
public class ReviewControllerImpl implements ReviewController {
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private RequestService requestService;
	
	// 리뷰 작성 화면이동
	@Override
	@RequestMapping(value = "/view_coachRateForm", method = RequestMethod.GET)
	public ModelAndView view_reviewForm(@RequestParam("target") String target, @RequestParam("writer") String writer,
			@RequestParam("reqNO") int reqNO, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String url = "/review/coachRateForm";
		mav.addObject("reqNO", reqNO);
		mav.addObject("target", target);
		mav.addObject("writer", writer);
		mav.setViewName(url);
		// reqWriteForm.jsp를 열었을 때 res object도 같이 보내짐
		return mav;
	}

	// coachInfo에서 후기 클릭시 reviewInfo로 화면이동
	@Override
	@RequestMapping(value = "/view_reviewInfo", method = RequestMethod.GET)
	public ModelAndView view_reviewInfo(@RequestParam("target") String target, HttpServletRequest request,
			HttpServletResponse response, Criteria cri) {
		ModelAndView mav = new ModelAndView();
		cri.setTarget(target);
		List reviewList = reviewService.searchReviewByTarget(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(reviewService.countReview(target));

		String url = "/review/reviewInfo";
		mav.addObject("reviewList", reviewList);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("target", target);
		mav.setViewName(url);

		// reqWriteForm.jsp를 열었을 때 res object도 같이 보내짐
		return mav;
	}

	// 리뷰 작성
	@Override
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity reviewWrite(@ModelAttribute("review") ReviewVO reviewVO,@RequestParam("reqNO") int reqNO,
			@RequestParam("status") String status, HttpServletRequest request, HttpServletResponse response) {
		String message;
		RequestVO requestVO = new RequestVO();
		requestVO.setStatus(status);
		requestVO.setReqNO(reqNO);
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			reviewService.addReview(reviewVO);
			requestService.finishRequest(requestVO);
			// insert 성공시 메시지창 뜨고 홈화면으로 이동
			message = "<script>";
			message += " alert('리뷰 등록이 완료되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			// 예외발생시 취소 및 삭제
			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요.');');";
			message += " location.href='" + request.getContextPath() + "/'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	// 리뷰 수정
	@Override
	@RequestMapping(value = "/modReview", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modifyReview(@ModelAttribute("review") ReviewVO reviewVO, HttpServletRequest request,
			HttpServletResponse response) {
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			reviewService.modReview(reviewVO);
			// insert 성공시 메시지창 뜨고 홈화면으로 이동
			message = "<script>";
			message += " alert('리뷰 수정이 완료되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			// 예외발생시 취소 및 삭제
			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요.');');";
			message += " location.href='" + request.getContextPath() + "/'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	// 리뷰 삭제
	@Override
	@RequestMapping(value = "/removeReview", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity deleteReview(@ModelAttribute("review") ReviewVO reviewVO, HttpServletRequest request,
			HttpServletResponse response) {

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			reviewService.deleteReview(reviewVO);
			// insert 성공시 메시지창 뜨고 홈화면으로 이동
			message = "<script>";
			message += " alert('리뷰가 삭제되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			// 예외발생시 취소 및 삭제
			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요.');');";
			message += " location.href='" + request.getContextPath() + "/'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	@RequestMapping(value = "/countReivew", method = RequestMethod.GET)
	public int countReview(@RequestParam("target") String target, HttpServletRequest request,
			HttpServletResponse response) {
		int count = 0;
		
		return count;
	}
}