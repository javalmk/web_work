package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	private static MemberDao dao;

	public static MemberDao getInstance() {
		if (dao == null) {
			dao = new MemberDao();
		}
		return dao;
	}

	public List<MemberDto> getList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MemberDto> li = new ArrayList<>();
		try {
			conn = new DbcpBean().getConn();
			String sql = "Select * from member";
			pstmt = conn.prepareStatement(sql);
			//sql 문 수행하고 결과셋 받아오기 
			rs = pstmt.executeQuery();
			while (rs.next()) {
			li.add(new MemberDto(rs.getInt("num"),rs.getString("name"), rs.getString("addr")));
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
		return li;
		
	}
	public boolean delete(int num) {
		Connection conn = new DbcpBean().getConn();
		PreparedStatement pstmt = null;
		boolean isSuccess = false;
		String sql = "Delete from member where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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
	public boolean insert(MemberDto dto) {
		Connection conn = new DbcpBean().getConn();
		PreparedStatement pstmt = null;
		boolean isSuccess = false;
		String sql = "Insert into member values(MEMBER_SEQ.NEXTVAL,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
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
	public MemberDto getdata(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//자주 하는 실수 dto를 null로 줬으면 밑에 new MemberDto 해줄것 그냥 add하지 말것
		MemberDto dto = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "select * from member where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			//sql 문 수행하고 결과셋 받아오기 
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String name = rs.getString("name");
				String addr = rs.getString("addr");
				dto = new MemberDto(num, name, addr);
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
	public boolean update(MemberDto dto) {
		Connection conn = new DbcpBean().getConn();
		PreparedStatement pstmt = null;
		boolean isSuccess = false;
		String sql = "Update member set name=?, addr=? where num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
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
}
