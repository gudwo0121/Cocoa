package mc.sn.cocoa.dao;

import java.util.List;
import java.util.Map;

public interface RequestDAO {

	public int insertRequest(Map reqMap);

	public List selectAllReqGot(String res);

	public List selectAllReqSent(String req);
}