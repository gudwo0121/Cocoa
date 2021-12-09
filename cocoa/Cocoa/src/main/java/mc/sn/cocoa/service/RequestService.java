package mc.sn.cocoa.service;

import java.util.List;
import java.util.Map;

import mc.sn.cocoa.vo.RequestVO;

public interface RequestService {

	public int sendRequest(Map reqMap);

	public List listReqGot(String res);

	public List listReqSent(String req);

	public RequestVO searchRequest(int reqNO);

	public void modRequest(Map requestMap);

	public void removeRequest(int reqNO);
}