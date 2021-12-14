package mc.sn.cocoa.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mc.sn.cocoa.vo.ReviewVO;

@Repository("reviewDAO")
public class ReviewDAOImpl implements ReviewDAO{
	@Autowired
	private SqlSession sqlSession;
	
	// 리뷰 넘버링
	private int selectNewReviewNO() {
		return sqlSession.selectOne("mapper.review.selectNewReviewNO");
	}
	
	@Override
	public int insertReview(ReviewVO reviewVO) {
		int reviewNO = selectNewReviewNO();
		reviewVO.setReviewNO(reviewNO);
		return sqlSession.insert("mapper.review.insertReview", reviewVO);
	}
	
	@Override
	public List selectByTarget(String target) {
		List<ReviewVO> reviewList = null;
		System.out.println(target);
		reviewList = sqlSession.selectList("mapper.review.selectByTarget", target);
		System.out.println(reviewList);
		return reviewList;
	}
}
