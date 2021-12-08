package mc.sn.cocoa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import mc.sn.cocoa.dao.RequestDAO;

@Service("requestService")
@Transactional(propagation = Propagation.REQUIRED)
public class RequestServiceImpl implements RequestService {
	@Autowired
	private RequestDAO requestDAO;
	
	// Map 타입의 파라메타를 받아 메소드를 실행
	// DAO의 insertRequest에서 리턴받은 reqNO 값을 리턴
	@Override
	public int sendRequest(Map reqMap) {
		return requestDAO.insertRequest(reqMap);
	}
	
	// 받은 요청 리스트 가져오기
	@Override
	public List listReqGot(String res) {
		List reqGotList = null;
		reqGotList = requestDAO.selectAllReqGot(res);
		return reqGotList;
	}
	
	//보낸요청 가져오기
	@Override
	public List listReqSent(String req) {
		List reqSentList = null;
		reqSentList = requestDAO.selectAllReqSent(req);
		return reqSentList;
	}
}
