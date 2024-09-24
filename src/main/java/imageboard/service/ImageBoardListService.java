package imageboard.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.bean.ImageBoardPaging;
import imageboard.bean.ImageBoardDTO;
import imageboard.dao.ImageBoardDAO;

public class ImageBoardListService implements CommandProcess {
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));

        // Oracle 1페이지당 5개씩
        /*int endNum = pg * 5;
        int startNum = endNum - 4;*/
		
		// MySQL 1페이지당 5개씩
		int endNum = 5;
		int startNum = (pg * endNum) - endNum;		

        // DB
        ImageBoardDAO imageboardDAO = ImageBoardDAO.getInstance();
        List<ImageBoardDTO> list = imageboardDAO.imageboardList(startNum, endNum);

        // 페이징 처리
        int totalA = imageboardDAO.getTotalA();

        ImageBoardPaging imageboardPaging = new ImageBoardPaging();
        imageboardPaging.setCurrentPage(pg);
        imageboardPaging.setPageBlock(3);
        imageboardPaging.setPageSize(5);
        imageboardPaging.setTotalA(totalA);
        imageboardPaging.makePagingHTML();

        // JSP로 데이터 전달
        request.setAttribute("list", list);
        request.setAttribute("currentPage", pg); // 현재 페이지를 JSP에 전달
        request.setAttribute("startNum", startNum); // 페이지의 게시물 번호
        request.setAttribute("pagingHTML", imageboardPaging.getPagingHTML().toString()); // String으로 변환하여 전달

		return "/imageboard/imageboardList.jsp";
	}
}
