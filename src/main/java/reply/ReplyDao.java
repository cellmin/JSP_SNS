package reply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReplyDao {
	private static ReplyDao replyDao;
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	private String db_Id = "root";
	private String db_Pwd = "";
	
	private String db_Host = "localhost:3306";
	private String db_Name = "jspclass";
	private String db_serverTimezone = "serverTimezone=Asia/Seoul";
	private String db_URL = String.format("jdbc:mysql://%s/%s?%s", db_Host, db_Name, db_serverTimezone);
	private String db_Class = "com.mysql.cj.jdbc.Driver";
	
	private String tb_Name = "Reply";
	
	public ReplyDao() {
		try {
			Class.forName(db_Class);
			System.out.println("DB Connecting");
			
			conn = DriverManager.getConnection(db_URL, db_Id ,db_Pwd);
			System.out.println("Connecting success!");
			
		} catch (SQLException e) {
			System.out.println("Connecting false"+e);
		} catch (ClassNotFoundException e) {
			System.out.println("Cannot found JDBC driver..."+e);
		}
	}
	
	public static ReplyDao getInstance() {
		if(replyDao == null) {
			replyDao = new ReplyDao();
		}
		return replyDao;
	}
	
	public boolean insertReply(Reply reply) {
		String query = String.format("Insert into %s (userID, replyTxt, boardID) values (?, ?, ?)", tb_Name);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reply.getUserID());
			pstmt.setString(2, reply.getReplyTxt());
			pstmt.setString(3, reply.getBoardID());
			pstmt.executeUpdate();
			return true;
			
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			if(pstmt != null) {
				pstmt = null;
			}
		}
	}
	
	
	public List<Reply> getReplies(String boardID) {
		Reply reply;
		List<Reply> replyList = new ArrayList<Reply>();
		String Query = String.format("Select * From %s Where boardID = ? Order by idx DESC", tb_Name);
		try {
			pstmt = conn.prepareStatement(Query);
			pstmt.setString(1, boardID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				reply = new Reply();
				reply.setUserID(rs.getString("userID"));
				reply.setReplyTxt(rs.getString("replyTxt"));
				reply.setBoardID(rs.getString("boardID"));
				replyList.add(reply);
			}

		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) {
				pstmt = null;
			}
		}return replyList;
 	}
}
