package reply;

public class Reply {
	private int replyIdx;
	private String userID, replyTxt, boardID;
	public int getReplyIdx() {
		return replyIdx;
	}
	public void setReplyIdx(int replyIdx) {
		this.replyIdx = replyIdx;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getReplyTxt() {
		return replyTxt;
	}
	public void setReplyTxt(String replyTxt) {
		this.replyTxt = replyTxt;
	}
	public String getBoardID() {
		return boardID;
	}
	public void setBoardID(String boardID) {
		this.boardID = boardID;
	}
}
