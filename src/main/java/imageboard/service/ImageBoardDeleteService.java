package imageboard.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.dao.ImageBoardDAO;

public class ImageBoardDeleteService implements CommandProcess {
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String[] check = request.getParameterValues("selectedValues");
		
		System.out.println("선택된 값 : " + check);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		ImageBoardDAO imageboardDAO = ImageBoardDAO.getInstance();
		
		for(int i = 0; i < check.length; i++) {
			map.put("seq", Integer.valueOf(check[i]));
			System.out.println("map 값 : " + map);
			imageboardDAO.imageboardDelete(map);
		}		
		
		return "none";
	}
}
