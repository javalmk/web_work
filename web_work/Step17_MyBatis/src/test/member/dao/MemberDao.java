package test.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import test.member.dto.MemberDto;
import test.mybatis.SqlMapConfig;

public class MemberDao {
	private static MemberDao dao;
	//MyBatis 를 사용하기 위한 핵심 객체
	private static SqlSessionFactory factory;
	//생성자
	private MemberDao(){}
	//MemberDao 객체를 리턴해주는 static 맴버 메소드
	public static MemberDao getInstance(){
		if(dao==null){
			dao=new MemberDao();
			//SqlSessionFactory 객체를 얻어와서 맴버필드에 저장 
			factory=SqlMapConfig.getSqlSession();
		}
		return dao;
	}
	//회원 목록을 리턴해주는 메소드
	public List<MemberDto> getList(){
		//DB 관련된 작업을 할 객체
		SqlSession session=null;
		List<MemberDto> list=null;
		try {
			session=factory.openSession();
			list=session.selectList("member.getList");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}

	//회원 한명의 정보를 리턴해주는 메소드
	public MemberDto getData(int num) {
		SqlSession session=null;
		MemberDto dto=null;
		try {
			session=factory.openSession();
			dto=session.selectOne("member.getData", num);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return dto;
	}
	//회원정보를 저장하는 메소드
	public void insert(MemberDto dto) {
		SqlSession session=null;
		try {
			session=factory.openSession(true); // true : auto commit
			session.insert("member.insert", dto);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
	//회원 한명의 정보를 수정하는 메소드
	public void update(MemberDto dto) {
		SqlSession session=null;
		try {
			session=factory.openSession(); // auto commit : false
			session.update("member.update", dto);
			session.commit(); //commit
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
	//회원 한명의 정보를 삭제하는 메소드
	public void delete(int num) {
		SqlSession session=null;
		try {
			session=factory.openSession(true);
			session.delete("member.delete", num);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
}



























