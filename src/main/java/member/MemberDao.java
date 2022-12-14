package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDao {
	private static MemberDao memberDao;
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	private String db_Id = "root";
	private String db_Pwd = "!@#alstp9753";
	
	private String db_Host = "localhost:3306";
	private String db_Name = "jspclass";
	private String db_serverTimezone = "serverTimezone=Asia/Seoul";
	private String db_URL = String.format("jdbc:mysql://%s/%s?%s", db_Host, db_Name, db_serverTimezone);
	private String db_Class = "com.mysql.cj.jdbc.Driver";
	
	private String tb_Name = "Member";
	
	public MemberDao() {
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
	
	public static MemberDao getInstance() {
		if(memberDao == null) {
			memberDao = new MemberDao();
		}
		return memberDao;
	}
	
	public boolean isExistID(Member member) {
		String query = String.format("Select Count(*) From %s Where userID = ?", tb_Name);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserID());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getInt(1) > 0) {
					return true; // 같은 이름과 ID가 존재
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			if(pstmt != null) {
				pstmt = null;
			}
		}return false;
	}
	
	public boolean insertMember(Member member) {
		String query = String.format("Insert into %s (userID, userName, userPassword) values (?, ?, ?)", tb_Name);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserID());
			pstmt.setString(2, member.getUserName());
			pstmt.setString(3, member.getUserPassword());
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
	
	public Member getMemberinfo(String userID) {
		Member member = new Member();
		String Query = String.format("Select * From %s Where userID = ?", tb_Name);
		try {
			pstmt = conn.prepareStatement(Query);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member.setUserID(rs.getString("userID"));
				member.setUserName(rs.getString("userName"));
				member.setUserPassword(rs.getString("userPassword"));
			}

		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) {
				pstmt = null;
			}
		}return member;
	}
	
	public List<Member> getMemberList() {
		Member member;
		List<Member> memberList = new ArrayList<Member>();
		String Query = String.format("Select * From %s Order by idx DESC", tb_Name);
		try {
			pstmt = conn.prepareStatement(Query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				member = new Member();
				member.setIdx(rs.getInt("idx"));
				member.setUserID(rs.getString("userID"));
				member.setUserName(rs.getString("userName"));
				member.setUserPassword(rs.getString("userPassword"));
				memberList.add(member);
			}

		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) {
				pstmt = null;
			}
		}return memberList;
	}
	
}
