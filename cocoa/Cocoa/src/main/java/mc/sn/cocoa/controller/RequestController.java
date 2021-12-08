package mc.sn.cocoa.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface RequestController {
	public ModelAndView view_reqWriteForm(@RequestParam("coachId") String res, HttpServletRequest request, HttpServletResponse response);

	public ResponseEntity sendRequest(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;
	
}
