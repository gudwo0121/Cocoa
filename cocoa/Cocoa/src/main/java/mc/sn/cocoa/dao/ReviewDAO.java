package mc.sn.cocoa.dao;

import java.util.List;

import mc.sn.cocoa.vo.ReviewVO;

public interface ReviewDAO {
	public int insertReview(ReviewVO reviewVO);
	
	public List selectByTarget(String target);
}
