package board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardViewService implements CommandProcess {
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		if(request.getParameter("seq") == null) {
			return "./boardList.do?pg=1";
		} else {
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			BoardDAO boardDAO = BoardDAO.getInstance();		
			
			List<BoardDTO> list = boardDAO.boardView(seq);
			
			System.out.println("나는 Service View list : " + list);
			
			request.setAttribute("list", list);
			
			return "/board/boardView.jsp";
		}
	}
}
