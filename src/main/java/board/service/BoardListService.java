package board.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.control.CommandProcess;
import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class BoardListService implements CommandProcess {
    @Override
    public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        int pg = Integer.parseInt(request.getParameter("pg"));

        // 1페이지당 5개씩
        int endNum = pg * 5;
        int startNum = endNum - 4;

        // DB
        BoardDAO boardDAO = BoardDAO.getInstance();
        List<BoardDTO> list = boardDAO.boardList(startNum, endNum);

        // 페이징 처리
        int totalA = boardDAO.getTotalA();

        BoardPaging boardPaging = new BoardPaging();
        boardPaging.setCurrentPage(pg);
        boardPaging.setPageBlock(3);
        boardPaging.setPageSize(5);
        boardPaging.setTotalA(totalA);
        boardPaging.makePagingHTML();

        // JSP로 데이터 전달
        request.setAttribute("list", list);
        request.setAttribute("currentPage", pg); // 현재 페이지를 JSP에 전달
        request.setAttribute("pagingHTML", boardPaging.getPagingHTML().toString()); // String으로 변환하여 전달

        return "/board/boardList.jsp";
    }
}
