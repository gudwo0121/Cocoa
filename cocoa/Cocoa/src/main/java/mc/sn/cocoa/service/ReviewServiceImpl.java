package mc.sn.cocoa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mc.sn.cocoa.dao.ReviewDAO;
import mc.sn.cocoa.vo.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public int addReview(ReviewVO reviewVO) {
		return reviewDAO.insertReview(reviewVO);
	}
	
	@Override
	public List searchReviewByTarget(String target) {
		return reviewDAO.selectByTarget(target);
	}
}
