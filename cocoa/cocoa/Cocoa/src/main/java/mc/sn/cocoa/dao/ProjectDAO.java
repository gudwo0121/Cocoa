package mc.sn.cocoa.dao;

import java.util.List;
import java.util.Map;

import mc.sn.cocoa.vo.ProjectVO;

public interface ProjectDAO {

	public int insertNewProject(Map projectMap);

	public List selectAllProjectList();

	public ProjectVO selectProjectById(ProjectVO projectVO);

	public void deleteProject(int projectNO);

	public void updateProject(Map projectMap);
}