package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardUpdateService implements CommandProcess {
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int seq = Integer.parseInt(request.getParameter("seq"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq", Integer.valueOf(seq));
		map.put("subject", subject);
		map.put("content", content);
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		
		boardDAO.boardUpdate(map);
		
		return "none";
	}
}
