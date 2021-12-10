package mc.sn.cocoa.dao;

import java.util.List;
import java.util.Map;

import mc.sn.cocoa.vo.RequestVO;

public interface RequestDAO {

	public int insertRequest(Map reqMap);

	public List selectAllReqGot(String res);

	public List selectAllReqSent(String req);

	public RequestVO selectByReqNO(int reqNO);

	public void updateRequest(Map requestMap);

	public void deleteRequest(int reqNO);
}