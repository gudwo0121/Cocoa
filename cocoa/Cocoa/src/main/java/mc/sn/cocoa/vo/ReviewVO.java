package mc.sn.cocoa.vo;

import org.springframework.stereotype.Component;

@Component("reviewVO")
public class ReviewVO {
	private int reviewNO;
	private String writer;
	private String target;
	private String rate;
	private String review;

	public ReviewVO() {

	}

	public ReviewVO(int reviewNO, String writer, String target, String rate, String review) {
		super();
		this.reviewNO = reviewNO;
		this.writer = writer;
		this.target = target;
		this.rate = rate;
		this.review = review;
	}

	public int getReviewNO() {
		return reviewNO;
	}

	public void setReviewNO(int reviewNO) {
		this.reviewNO = reviewNO;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

}