package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
	private static FileDao dao;
	private FileDao() {}
	public static FileDao getInstance() {
		if(dao==null) {
			dao=new FileDao();
		}
		return dao;
	}
	//파일 정보를 DB 에서 삭제하는 메소드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean isSuccess = false;
		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM board_data "
					+ "WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			//sql 문 수행하기
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
	
	//다운로드할 파일의 정보를 리턴해주는 메소드
	public FileDto getData(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 파일 정보를 저장할 FileDto 
		FileDto dto=null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT writer,title,orgFileName,"
					+ "saveFileName,fileSize,regdate "
					+ " FROM board_data "
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			//sql 문 수행하고 결과셋 받아오기 
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto=new FileDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
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
	
	
	//파일 정보를 저장하는 메소드 insert()
	public boolean insert(FileDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean isSuccess = false;
		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO board_data "
					+ " (num,writer,title,orgFileName,saveFileName,fileSize,regdate)"
					+ " VALUES(board_data_seq.NEXTVAL,?,?,?,?,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getOrgFileName());
			pstmt.setString(4, dto.getSaveFileName());
			// fileSize 는 long type 이므로 .setLong()
			pstmt.setLong(5, dto.getFileSize());
			//sql 문 수행하기
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
	//파일 목록을 리턴해주는 메소드 getList()
	public List<FileDto> getList(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//파일 목록을 저장할 객체 생성
		List<FileDto> list=new ArrayList<>();
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT num,writer,title,orgFileName,saveFileName,fileSize,regdate "
					+ " FROM board_data "
					+ " ORDER BY num DESC";
			pstmt = conn.prepareStatement(sql);
			//sql 문 수행하고 결과셋 받아오기 
			rs = pstmt.executeQuery();
			while (rs.next()) {
				FileDto dto=new FileDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto);
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
}




















