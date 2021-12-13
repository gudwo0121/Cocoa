package mc.sn.cocoa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import mc.sn.cocoa.dao.ProjectDAO;
import mc.sn.cocoa.vo.Criteria;
import mc.sn.cocoa.vo.ProjectVO;

@Service("projectService")
@Transactional(propagation = Propagation.REQUIRED)
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	private ProjectDAO projectDAO;

	// 새 프로젝트 글 삽입
	@Override
	public int addNewProject(Map projectMap) {
		return projectDAO.insertNewProject(projectMap);
	}

	// 프로젝트 글 조회
	@Override
	public List<ProjectVO> listProjects(Criteria cri) throws Exception {
		List projectsList = null;
		projectsList = projectDAO.selectAllProjectList(cri);
		return projectsList;
	}

	@Override
	public ProjectVO searchProject(ProjectVO projectVO) {
		ProjectVO vo = null;
		vo = projectDAO.selectProjectById(projectVO);
		return vo;
	}

	// 프로젝트 삭제
	@Override
	public void removeProject(int projectNO) {
		projectDAO.deleteProject(projectNO);
	}

	// 프로젝트 수정
	@Override
	public void modProject(Map projectMap) throws Exception {
		projectDAO.updateProject(projectMap);
	}
	
	// 코칭 글 개수
	@Override
	public int countProject(Criteria cri) throws Exception {
		return projectDAO.countProject(cri);
	}

}