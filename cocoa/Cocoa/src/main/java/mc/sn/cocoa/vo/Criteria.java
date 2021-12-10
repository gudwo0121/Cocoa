package mc.sn.cocoa.vo;

public class Criteria {

	private int page; // 현재 페이지 번호
	private int perPageNum; // 한 페이지에 게시할 글의 수
	private String lang = "C";
	private String level = "하수";

	// 특정 페이지의 게시글 시작 번호, 게시글 시작 행 번호
	public int getPageStart() {
		// 현재 페이지의 게시글 시작 번호 = (현재 페이지 번호 - 1) * 페이지 당 게시할 글의 수
		return (this.page - 1) * perPageNum;
	}

	public Criteria() {
		this.page = 1;
		this.perPageNum = 8;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		// 페이지가 음수가 되면 1페이지를 나타냄
		if (page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int pageCount) {
		// 한 페이지에 게시할 글의 수가 변하지 않게 설정
		int cnt = this.perPageNum;
		if (pageCount != cnt) {
			this.perPageNum = cnt;
		} else {
			this.perPageNum = pageCount;
		}
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}
	
	
	
}