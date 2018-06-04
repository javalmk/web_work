package test.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.dto.EmpDto;
import test.util.DBConnect;

public class EmpDao {
	private static EmpDao dao;

	private EmpDao() {
	};

	public static EmpDao getInstance() {
		if (dao == null) {
			dao = new EmpDao();
		}
		return dao;
	}

	public List<EmpDto> getList() {
		Connection conn = new DBConnect().getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<EmpDto> list = new ArrayList<>();
		// String sql ="select e1.empno, e1.ename, e1.job, e2.ename manager,
		// e1.hiredate,"
		// + "e1.sal, e1.comm, e1.deptno, d.dname, d.loc from emp e1, emp e2,"
		// + "dept d where e1.deptno=d.deptno and e2.deptno=d.deptno and
		// e1.mgr=e2.empno";
		// String sql = "select * from emp, dept where emp.deptno=dept.deptno";
		String sql = "select e1.empno, e1.ename, e1.job, e2.ename manager, e1.hiredate, e1.sal, e1.comm, e1.deptno, d.dname, d.loc from emp e1, emp e2, dept d where e1.deptno=d.deptno and e1.mgr=e2.empno(+)";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int empno = rs.getInt("empno");
				String ename = rs.getString("ename");
				String job = rs.getString("job");
				String mgr = rs.getString("manager");
				Date hiredate = rs.getDate("hiredate");
				int sal = rs.getInt("sal");
				int comm = rs.getInt("comm");
				int deptno = rs.getInt("deptno");
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");
				list.add(new EmpDto(empno, ename, job, mgr, hiredate, sal, comm, deptno, dname, loc));
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

	// 회원 추가하기
	public boolean insert(EmpDto dto) {
		Connection conn = new DBConnect().getConn();
		PreparedStatement pstmt = null;
		boolean isSuccess = false;
		String sql = "Insert into emp values(?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getEmpno());
			pstmt.setString(2, dto.getEname());
			pstmt.setString(3, dto.getJob());
			pstmt.setInt(4, 0);
			pstmt.setDate(5, dto.getHiredate());
			pstmt.setInt(6, dto.getSal());
			pstmt.setInt(7, dto.getComm());
			pstmt.setInt(8, dto.getDeptno());
			int flag = pstmt.executeUpdate();
			if (flag > 0) {
				isSuccess = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			try {
				if (conn == null)
					conn.close();
				if (pstmt == null)
					pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return isSuccess;
	}
//	회원 삭제하기
	public boolean delete(int empno) {
		Connection conn = new DBConnect().getConn();
		PreparedStatement pstmt = null;
		boolean isSuccess = false;
		String sql = "delete from emp where empno=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, empno);

			int flag = pstmt.executeUpdate();
			if (flag > 0) {
				isSuccess = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			try {
				if (conn == null)
					conn.close();
				if (pstmt == null)
					pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return isSuccess;
	}
	//회원정보 수정
	//	업데이트
	public boolean update(EmpDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		boolean isSuccess=false; //저장 성공 여부 
		try {
			conn=new DBConnect().getConn();
			String sql="UPDATE emp SET ename=?, job=?, mgr=?, hiredate=?, sal=?, comm=?, deptno=? "
					+ "WHERE empno=?";
			
			pstmt=conn.prepareStatement(sql);
			// ? 에 추가할 회원정보 바인딩하기
			pstmt.setInt(8, dto.getEmpno());
			pstmt.setString(1, dto.getEname());
			pstmt.setString(2, dto.getJob());
			pstmt.setInt(3, Integer.parseInt(dto.getMgr()));
			pstmt.setDate(4, dto.getHiredate());
			pstmt.setInt(5, dto.getSal());
			pstmt.setInt(6, dto.getComm());
			pstmt.setInt(7, dto.getDeptno());
			
			// 추가하고 추가한 row 의 갯수 리턴 받기
			int flag=pstmt.executeUpdate();
			if(flag>0) {
				isSuccess=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		return isSuccess;		
	}
	//회원 한명의 정보를 리턴해 주는 메소드
	public EmpDto getData(int empno) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		EmpDto dto=null;
		try {
			conn=new DBConnect().getConn();
			String sql="SELECT * FROM emp "
					+ "WHERE empno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, empno);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String ename = rs.getString("ename");
				String job = rs.getString("job");
				String mgr = rs.getString("mgr");
				Date hiredate = rs.getDate("hiredate");
				int sal = rs.getInt("sal");
				int comm = rs.getInt("comm");
				int deptno = rs.getInt("deptno");
				//회원정보를 EmpDto 에 담고
				dto=new EmpDto(empno, ename, job, mgr, hiredate, sal, comm, deptno);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		//회원정보를 담고 있는 MemberDto 객체의 참조값 리턴 
		return dto;
	}
}
