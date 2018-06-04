package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
	private static FileDao dao;

	private FileDao() {
		// TODO Auto-generated constructor stub
	}

	public static FileDao getInstance() {
		if (dao == null) {
			dao = new FileDao();
		}
		return dao;
	}

	// 파일 정보를 저장하는 메소드 insert()
	public boolean insert(FileDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean isSuccess = false;

		try {
			conn = new DbcpBean().getConn();
			String sql = "insert into board_data values(board_guest_seq.NEXTVAL+1,?,?,?,?,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getOrgFilename());
			pstmt.setString(4, dto.getSaveFilename());
			pstmt.setLong(5, dto.getFilesize());
			// sql 문 수행하고 결과셋 받아오기
			int flag = pstmt.executeUpdate();
			if (flag > 0) {
				isSuccess = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return isSuccess;
	}

	// 파일 목록을 리턴해주는 메소드 getList()
	public List<FileDto> getList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<FileDto> list = new ArrayList<>();

		try {
			conn = new DbcpBean().getConn();
			String sql = "Select * from board_data order by num desc";
			pstmt = conn.prepareStatement(sql);
			// sql 문 수행하고 결과셋 받아오기
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int num = rs.getInt("num");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String orgFilename = rs.getString("orgFilename");
				String saveFilename = rs.getString("saveFilename");
				long filesize = rs.getLong("filesize");
				String regdate = rs.getString("regdte");
				list.add(new FileDto(num, writer, title, orgFilename, saveFilename, filesize, regdate));
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
		return list;
	}
	public boolean delete(int num) {
		Connection conn = new DbcpBean().getConn();
		PreparedStatement pstmt = null;
		boolean isSuccess = false;
		String sql = "Delete from board_data where num=?";
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
	//다운로드할 파일의 정보를 리턴해주는 메소드
	public FileDto getData(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FileDto dto = new FileDto();
		try {
			conn = new DbcpBean().getConn();
			String sql = "Select * from board_data where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			//sql 문 수행하고 결과셋 받아오기 
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFilename(rs.getString("orgFilename"));
				dto.setSaveFilename(rs.getString("saveFilename"));
				dto.setFilesize(rs.getLong("filesize"));
				dto.setRegdate(rs.getString("regdate"));
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
	public boolean update(FileDto dto) {
		Connection conn = new DbcpBean().getConn();
		PreparedStatement pstmt = null;
		boolean isSuccess = false;
		String sql = "UPDATE board_data set orgFilename=?, saveFilename=?, filesize=? where num =?";		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getOrgFilename());
			pstmt.setString(2, dto.getSaveFilename());
			pstmt.setLong(3, dto.getFilesize());
			pstmt.setInt(4, dto.getNum());
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
