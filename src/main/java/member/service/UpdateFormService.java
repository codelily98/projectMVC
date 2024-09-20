package member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class UpdateFormService implements CommandProcess{
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");

		//DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		List<MemberDTO> list = memberDAO.getMember(id);
		
		request.setAttribute("list", list);
		return "/member/updateForm.jsp";
	}
}
