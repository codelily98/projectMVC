package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardUpdateService implements CommandProcess {
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int seq = Integer.parseInt(request.getParameter("seq"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setSeq(seq);
        boardDTO.setSubject(subject);
        boardDTO.setContent(content);
		
        System.out.println("Subject: " + subject);
        System.out.println("Content: " + content);
        System.out.println("Seq: " + seq);

        
		BoardDAO boardDAO = BoardDAO.getInstance();
		
		int result = boardDAO.boardUpdate(boardDTO);
		
		request.setAttribute("result", result);
		
		return "/board/boardUpdate.jsp";
	}
}
