package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.Session;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {
	private static BoardDAO boardDAO = new BoardDAO();
	private SqlSessionFactory sessionFactory;  

	
	public static BoardDAO getInstance() {
		return boardDAO;
	}
	
	public BoardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml"); // - 문자 단위
			sessionFactory = new SqlSessionFactoryBuilder().build(reader);		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void boardWrite(Map<String, String> map) {
		SqlSession sqlSession = sessionFactory.openSession();
		sqlSession.insert("boardSQL.boardWrite", map);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public List<BoardDTO> boardList(int startNum, int endNum) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession sqlSession = sessionFactory.openSession();
		list = sqlSession.selectList("boardSQL.boardList", map); 
		sqlSession.close();
		return list;
	}
	
	public int getTotalA() {
		int totalA = 0;
		
		SqlSession sqlSession = sessionFactory.openSession();
		totalA = sqlSession.selectOne("boardSQL.getTotalA");
		System.out.println("나는 TotalA : " + totalA);
		sqlSession.close();
		
		return totalA;
	}

	public List<BoardDTO> boardView(int seq) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		SqlSession sqlSession = sessionFactory.openSession();
		list = sqlSession.selectList("boardSQL.boardView", seq);
		System.out.println("나는 보드 리스트" + list);
		sqlSession.close();
		
		return list;
	}

	public int boardDelete(int seq) {
		int result = 0;
		
		SqlSession sqlSession = sessionFactory.openSession();
		result = sqlSession.delete("boardSQL.boardDelete", seq);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}

	public void boardUpdate(Map<String, Object> map) {
		SqlSession sqlSession = sessionFactory.openSession();
		sqlSession.update("boardSQL.boardUpdate", map);
		sqlSession.commit();
		sqlSession.close();		
	}
}