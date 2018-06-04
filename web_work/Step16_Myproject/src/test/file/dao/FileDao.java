package test.file.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import test.file.dto.FileDto;
import test.mybatis.SqlMapConfig;

public class FileDao {
	private static FileDao dao;
	private static SqlSessionFactory factory;

	private FileDao() {
		// TODO Auto-generated constructor stub
	}

	public static FileDao getInstance() {
		if (dao == null) {
			dao = new FileDao();
			factory = SqlMapConfig.getSqlSession();
		}
		return dao;
	}

	// 전체 글의 갯수를 리턴하는 메소드
	public int getCount(FileDto dto) {
		SqlSession session = null;
		int count = 0;
		try {
			session = factory.openSession();
			/*
			 * 검색 조건에 맞는 row 의 갯수만 셀수 있도록 parameter 를 fileDto 를 전달한다. parameterType :
			 * fileDto
			 */
			count = session.selectOne("file.getCount", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return count;
	}

	// 글정보를 수정하는 메소드
	public boolean update(FileDto dto) {
		SqlSession session = null;
		int num = 0;
		try {
			session = factory.openSession(true);

			num = session.update("file.update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
			
		}
		if (num == 0) {
			return false;
		} else {
			return true;
		}
	}

	// 글정보를 삭제하는 메소드
	public void delete(int num) {
		SqlSession session = null;
		try {
			session = factory.openSession(true);
			session.delete("file.delete", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	// 글정보를 리턴해주는 메소드
	public FileDto getData(int num) {
		SqlSession session = null;
		FileDto resultDto = null;
		try {
			session = factory.openSession();
			/*
			 * Mapper namespace : file sql id : getData parameterType : fileDto resultType :
			 * fileDto
			 */
			resultDto = session.selectOne("file.getData", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return resultDto;
	}

	// 조회수를 1 증가 시키는 메소드
	public void increaseViewCount(int num) {
		SqlSession session = null;
		try {
			session = factory.openSession(true);
			session.update("file.increaseViewCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	// 글목록을 리턴해주는 메소드
	/*
	 * 인자로 전달된 fileDto 에는 startRowNum 과 endRowNum 이 들어 있다. 이값을 이용해서 SELECT 한다.
	 */
	public List<FileDto> getList(FileDto dto) {
		SqlSession session = null;
		List<FileDto> list = null;
		try {
			session = factory.openSession();
			/*
			 * Mapper 의 namespace : file sql id : getList parameterType : fileDto resultType
			 * : fileDto
			 */
			list = session.selectList("file.getList", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	// 글정보를 저장하는 메소드
	public void insert(FileDto dto) {
		SqlSession session = null;
		try {
			session = factory.openSession(true);
			session.insert("file.insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
}
