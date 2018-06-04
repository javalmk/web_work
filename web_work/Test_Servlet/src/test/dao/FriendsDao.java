package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.dto.FriendsDto;
import test.util.DBConnect;

public class FriendsDao {
	private static FriendsDao dao;

	private FriendsDao() {
	}

	public static FriendsDao getInstance() {
		if (dao == null) {
			dao = new FriendsDao();
		}
		return dao;
	}
// 회원리스트 받아오기
	public List<FriendsDto> getList() {
		Connection conn = new DBConnect().getConn();
		PreparedStatement pstmt = null;
		List<FriendsDto> list = new ArrayList<>();
		ResultSet rs = null;
		String sql = "SELECT * FROM friends";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int num = rs.getInt("num");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String regdate = rs.getString("regdate");
				list.add(new FriendsDto(num, name, phone, regdate));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (conn == null)
					conn.close();
				if (rs == null)
					rs.close();
				if (pstmt == null)
					pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
//	회원정보 삽입하기
	public void insert(FriendsDto dto) {
		Connection conn = new DBConnect().getConn();
		PreparedStatement pstmt = null;
		String sql = "Insert into Friends values(friends_seq.NEXTVAL,?,?,to_char(SYSDATE,'YY\"년\"MM\"월\"DD\"일\"'))";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPhone());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
				try {
					if(conn==null)conn.close();
					if(pstmt==null)pstmt.close();
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
	}
	public void Delete(int num) {
		Connection conn = new DBConnect().getConn();
		PreparedStatement pstmt = null;
		String sql = "Delete from friends where num =?";
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
				try {
					if(conn==null)conn.close();
					if(pstmt==null)pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
	}
// 회원 한명의 정보를 얻어옴	
	public FriendsDto getData(int num){
		Connection conn = new DBConnect().getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FriendsDto dto = null;
		String sql = "Select * from Friends WHERE num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			String name = rs.getString("name");
			String phone = rs.getString("phone");
			String regdate = rs.getString("regdate");
			dto= new FriendsDto(num, name, phone,regdate);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	public void update(FriendsDto dto) {
		Connection conn = new DBConnect().getConn();
		PreparedStatement pstmt = null;
		String sql = "Update Friends set name=?,phone=? where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPhone());
			pstmt.setInt(3, dto.getNum());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
				try {
					if(conn==null)conn.close();
					if(pstmt==null)pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
	}
}
