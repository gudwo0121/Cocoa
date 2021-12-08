package mc.sn.cocoa.service;

import java.util.List;
import java.util.Map;

public interface RequestService {
	public int sendRequest(Map reqMap);
	public List listReqGot(String res);
	public List listReqSent(String req);
}
