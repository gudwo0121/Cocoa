package mc.sn.cocoa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mc.sn.cocoa.vo.RequestVO;

@Repository("requestDAO")
public class RequestDAOImpl implements RequestDAO {
	@Autowired
	private SqlSession sqlSession;

	// 요청글 넘버링
	private int selectNewProjectNO() {
		return sqlSession.selectOne("mapper.request.selectNewReqNO");
	}

	// selectNewProjectNO 메소드를 통해 얻은 reqNO를 reqMap에 put해서 sql 실행하여 insert실행
	// reqNO를 리턴
	@Override
	public int insertRequest(Map reqMap) {
		int reqNO = this.selectNewProjectNO();
		reqMap.put("reqNO", reqNO);
		sqlSession.insert("mapper.request.insertRequest", reqMap);
		return reqNO;
	}

	// 받은 요청 리스트 가져와서 리턴
	@Override
	public List selectAllReqGot(String res) {
		List<RequestVO> reqGotList = null;
		reqGotList = sqlSession.selectList("mapper.request.selectAllReqGot", res);
		return reqGotList;
	}

	// 보낸 요청 리스트 가져와서 리턴
	@Override
	public List selectAllReqSent(String req) {
		List<RequestVO> reqSentList = null;
		reqSentList = sqlSession.selectList("mapper.request.selectAllReqSent", req);
		return reqSentList;
	}

	// 보낸 & 받은 요청서 조회
	@Override
	public RequestVO selectByReqNO(int reqNO) {
		RequestVO vo = null;
		vo = sqlSession.selectOne("mapper.request.selectByReqNO", reqNO);
		return vo;
	}

	// 보낸 요청글 수정
	@Override
	public void updateRequest(Map requestMap) {
		sqlSession.update("mapper.request.updateRequest", requestMap);
	}

	// 보낸 요청글 삭제
	@Override
	public void deleteRequest(int reqNO) {
		sqlSession.delete("mapper.request.deleteRequest", reqNO);
	}
}