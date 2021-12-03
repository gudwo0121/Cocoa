package mc.sn.cocoa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import mc.sn.cocoa.dao.CoachDAO;
import mc.sn.cocoa.vo.CoachVO;

@Service("coachService")
@Transactional(propagation = Propagation.REQUIRED)
public class CoachServiceImpl implements CoachService {
	@Autowired
	private CoachDAO coachDAO;

	// 새 코칭 글 삽입
	@Override
	public int addNewCoach(Map coachMap) {
		return coachDAO.insertNewCoach(coachMap);
	}

	// 코칭 글 목록 조회 메서드 호출
	public List<CoachVO> listCoaches() throws Exception {
		List<CoachVO> coachesList = coachDAO.selectAllCoachesList();
		return coachesList;
	}

	// 코칭 글 상세 조회 창 호출
	@Override
	public CoachVO viewCoach(int coachNO) throws Exception {
		CoachVO coachVO = coachDAO.selectCoach(coachNO);
		return coachVO;
	}

	// 코칭 글 수정
	@Override
	public void modCoach(Map coachMap) throws Exception {
		coachDAO.updateCoach(coachMap);
	}

	// 코칭 글 삭제
	@Override
	public void removeCoach(int coachNO) throws Exception {
		coachDAO.deleteCoach(coachNO);
	}
	
}