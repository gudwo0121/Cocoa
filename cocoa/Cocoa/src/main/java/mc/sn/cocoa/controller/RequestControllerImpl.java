package mc.sn.cocoa.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import mc.sn.cocoa.service.RequestService;

@Controller("requestController")
public class RequestControllerImpl implements RequestController {
	
	// 파일 저장 경로
		private static final String request_IMAGE_REPO = "C:\\cocoa\\request_image";
	
	@Autowired
	private RequestService requestService;
	
	// coachInfo.jsp에서 요청서 작성 선택시 실행
	// RequestParam으로 쿼리스트링으로 받아온 "coachId"를 res로 저장
	@Override
	@RequestMapping(value = "/view_reqWriteForm", method = RequestMethod.GET)
	public ModelAndView view_reqWriteForm(@RequestParam("coachId") String res, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		String url = "/reqWriteForm";
		// 위의 res를 키값 'res'로 addobject
		mav.addObject("res", res);
		mav.setViewName(url);
		// reqWriteForm.jsp를 열었을 때 res object도 같이 보내짐
		return mav;
	}
	
	// 요청글 작성
	@Override
	@RequestMapping(value = "/requestWrite", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity sendRequest(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		
		// DB에 담을 요청글 정보
		Map<String, Object> reqMap = new HashMap<String, Object>();
		
		// 받아온 정보들을 reqMap에 [key & value]로 설정
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			reqMap.put(name, value);
		}
		
		// reqWriteForm에 불러온 파일(이미지) 직접 입력
		String rImg = this.upload(multipartRequest);
		reqMap.put("rImg", rImg);

		// 성공, 실패 시 알림
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			// requestService의 sendRequest 메소드에서 요청글 넘버를 리턴받아 가져옴
			int reqNO = requestService.sendRequest(reqMap);
			// temp 폴더에 있던 다운로드 파일을 요청글 넘버로 폴더 생성하여 이동
			if (rImg != null && rImg.length() != 0) {
				File srcFile = new File(request_IMAGE_REPO + "\\" + "temp" + "\\" + rImg);
				File destDir = new File(request_IMAGE_REPO + "\\" + reqNO);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}
			// insert 성공시 메시지창 뜨고 홈화면으로 이동
			message = "<script>";
			message += " alert('요청 신청이 완료되었습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {

			// 예외발생시 취소 및 삭제
			File srcFile = new File(request_IMAGE_REPO + "\\" + "temp" + "\\" + rImg);
			srcFile.delete();

			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요.');');";
			message += " location.href='" + multipartRequest.getContextPath() + "/'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
		
	}
	
	// 파일 업로드
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {

		String rImg = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();

		while (fileNames.hasNext()) {

			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			rImg = mFile.getOriginalFilename();

			File file = new File(request_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);

			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					if (file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(request_IMAGE_REPO + "\\" + "temp" + "\\" + rImg));
			}
		}
		return rImg;
	}
}
