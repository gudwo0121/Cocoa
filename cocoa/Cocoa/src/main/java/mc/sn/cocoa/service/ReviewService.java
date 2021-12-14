package mc.sn.cocoa.service;

import java.util.List;

import mc.sn.cocoa.vo.ReviewVO;

public interface ReviewService {
	public int addReview(ReviewVO reviewVO);
	
	public List searchReviewByTarget(String target);
}
