package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

public class MemberDAO {
	private static MemberDAO memberDAO = new MemberDAO();
	private SqlSessionFactory sessiongFactory;
	
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	
	public MemberDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml"); // - 문자 단위
			sessiongFactory = new SqlSessionFactoryBuilder().build(reader);		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public boolean isExistId(String id){
		boolean exist = false;
		MemberDTO memberDTO = null;
		SqlSession sqlSession = sessiongFactory.openSession();
		memberDTO = sqlSession.selectOne("memberSQL.isExistId", id);
		if(memberDTO != null ) {
			exist = true;
		}
		sqlSession.close();
		
		return exist;
	}
	
	public void write(MemberDTO memberDTO) {		
		SqlSession sqlSession = sessiongFactory.openSession();
		sqlSession.insert("memberSQL.write", memberDTO);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public List<MemberDTO> login(MemberDTO memberDTO){
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		
		SqlSession sqlSession = sessiongFactory.openSession();
		list = sqlSession.selectList("memberSQL.login", memberDTO);
		sqlSession.close();
		
		return list;
	}
	
	public List<MemberDTO> getMember(String id){
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		
		SqlSession sqlSession = sessiongFactory.openSession();
		list = sqlSession.selectList("memberSQL.getMember", id);
		sqlSession.close();
		
		return list;
	}
	
	public void update(MemberDTO memberDTO){
		SqlSession sqlSession = sessiongFactory.openSession();
		sqlSession.update("memberSQL.update", memberDTO);
		sqlSession.commit();
		sqlSession.close();
	}
}