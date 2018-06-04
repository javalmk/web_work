package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {

	private static UsersDao dao;
	
	private UsersDao() {};
	
	public static UsersDao getInstance() {
		if(dao==null) {
			dao=new UsersDao();
		}
		return dao;
	}
	public boolean insert(UsersDto dto) {
		Connection conn = new DbcpBean().getConn();
		PreparedStatement pstmt = null;
		boolean isSuccess = false;
		String sql = "Insert into users(id,pwd,email,phone,regdate) values(?,?,?,?,SYSDATE)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			pstmt.setInt(3, dto.getPhone());
			int flag = pstmt.executeUpdate();
			if (flag > 0) {
				isSuccess = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				//Connection 객체의 .close() 메소드 호출하면 
				//Connection 객체가 알아서 Pool 에 반납된다. 
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}

		return isSuccess;

	}
	
	//아이디 비밀번호가 유효한지 여부를 리턴하는 메소드
	public boolean isValid(UsersDto dto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//아이디와 비밀번호가 맞는 정보인지 여부 
		boolean isValid=false;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT * FROM users"
					+ " WHERE id=? AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 아이디와 비밀번호를 바인딩하고 
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			//SELECT 해서 
			rs = pstmt.executeQuery();
			while (rs.next()) {//row 가 하나라도 있으면 
				isValid=true; //유효한 정보이다. 
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		//아이디 비밀번호가 유효한 정보인지 여부를 리턴해준다.
		return isValid;
	}//isValid()
	
	public UsersDto getData(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UsersDto dto = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "Select * from users where id=?";
			pstmt = conn.prepareStatement(sql);
			//sql 문 수행하고 결과셋 받아오기 
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String pwd =rs.getString("pwd");
				String email =rs.getString("email");
				String regdate =rs.getString("regdate");
				int phone = rs.getInt("phone");
				dto = new UsersDto(id, pwd, email, phone, regdate);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return dto;
	}
	public boolean update(UsersDto dto) {
		Connection conn = new DbcpBean().getConn();
		PreparedStatement pstmt = null;
		boolean isSuccess = false;
		String sql = "update users set pwd=?, email=?, phone=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPwd());
			pstmt.setString(2, dto.getEmail());
			pstmt.setInt(3, dto.getPhone());
			pstmt.setString(4, dto.getId());
			int flag = pstmt.executeUpdate();
			if (flag > 0) {
				isSuccess = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				//Connection 객체의 .close() 메소드 호출하면 
				//Connection 객체가 알아서 Pool 에 반납된다. 
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}

		return isSuccess;

	}
	public boolean delete(String id) {
		Connection conn = new DbcpBean().getConn();
		PreparedStatement pstmt = null;
		boolean isSuccess = false;
		String sql = "Delete from users Where id =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			int flag = pstmt.executeUpdate();
			if (flag > 0) {
				isSuccess = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				//Connection 객체의 .close() 메소드 호출하면 
				//Connection 객체가 알아서 Pool 에 반납된다. 
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}

		return isSuccess;

	}
	public String findId(String email,int phone) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id ="";

		try {
			conn = new DbcpBean().getConn();
			String sql = "select id from users where email=? and phone=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, phone);
			//sql 문 수행하고 결과셋 받아오기 
			rs = pstmt.executeQuery();
			if (rs.next()) {
				id = rs.getString("id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return id;
	}
	public boolean findPwd(String id, String email,int phone) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean isValid=false;

		try {
			conn = new DbcpBean().getConn();
			String sql = "select * from users where id=? and email=? and phone=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setInt(3, phone);
			//sql 문 수행하고 결과셋 받아오기 
			rs = pstmt.executeQuery();
			if (rs.next()) {
				isValid=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return isValid;
	}
}

