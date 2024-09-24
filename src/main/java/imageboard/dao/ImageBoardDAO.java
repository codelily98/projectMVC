package imageboard.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;
import imageboard.bean.ImageBoardDTO;

public class ImageBoardDAO {
	private static ImageBoardDAO imageboardDAO = new ImageBoardDAO();
	private SqlSessionFactory sessionFactory;  

	
	public static ImageBoardDAO getInstance() {
		return imageboardDAO;
	}
	
	public ImageBoardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml"); // - 문자 단위
			sessionFactory = new SqlSessionFactoryBuilder().build(reader);		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int imageboardWrite(ImageBoardDTO imageboardDTO) {
		int result = 0;
		
		SqlSession sqlSession = sessionFactory.openSession();
		result = sqlSession.insert("imageboardSQL.imageboardWrite", imageboardDTO);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}

	public List<ImageBoardDTO> imageboardList(int startNum, int endNum) {
		List<ImageBoardDTO> list = new ArrayList<ImageBoardDTO>();
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession sqlSession = sessionFactory.openSession();
		list = sqlSession.selectList("imageboardSQL.imageboardList", map); 
		sqlSession.close();
		return list;
	}

	public int getTotalA() {
		int totalA = 0;
		
		SqlSession sqlSession = sessionFactory.openSession();
		totalA = sqlSession.selectOne("imageboardSQL.getTotalA");
		System.out.println("나는 TotalA : " + totalA);
		sqlSession.close();
		
		return totalA;
	}
	
	public int imageboardDelete(Map<String, Integer> map) {
		int result = 0;
		
		SqlSession sqlSession = sessionFactory.openSession();
		sqlSession.delete("imageboardSQL.imageboardDelete", map);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}
}
