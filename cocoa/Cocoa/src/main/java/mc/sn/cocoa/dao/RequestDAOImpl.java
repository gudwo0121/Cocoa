package mc.sn.cocoa.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}