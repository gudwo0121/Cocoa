package mc.sn.cocoa.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface RequestController {

	public ModelAndView view_reqWriteForm(@RequestParam("coachId") String res, @RequestParam("reqId") String req,
			HttpServletRequest request, HttpServletResponse response);

	public ResponseEntity sendRequest(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	public ModelAndView view_sendReq(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView view_receiveReq(HttpServletRequest request, HttpServletResponse response) throws Exception;
}