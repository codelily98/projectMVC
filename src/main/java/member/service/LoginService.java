package member.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class LoginService implements CommandProcess {

	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response)
			throws Throwable {
		//데이터
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		//DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(id);
		memberDTO.setPwd(pwd);			
		List<MemberDTO> list = memberDAO.login(memberDTO);
		
		if(list.isEmpty())
			return "/member/loginFail.jsp";
		else {
			HttpSession session = request.getSession(); //세션 생성
			
			session.setAttribute("memName", list.get(0).getName());
			session.setAttribute("memId", id);
			session.setAttribute("memPwd", pwd);
			session.setAttribute("memEmail", list.get(0).getEmail1()+"@"+list.get(0).getEmail2());
			
			session.setAttribute("memDTO", list.get(0));
			
			return "none";
		}
	}
}