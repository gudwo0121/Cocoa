package mc.sn.cocoa.service;

import java.util.List;

import mc.sn.cocoa.vo.Criteria;
import mc.sn.cocoa.vo.ReviewVO;

public interface ReviewService {
	
	public int addReview(ReviewVO reviewVO);

	public List searchReviewByTarget(Criteria cri);

	public void modReview(ReviewVO reviewVO);

	public void deleteReview(ReviewVO reviewVO);

	public int countReview(String target);
}