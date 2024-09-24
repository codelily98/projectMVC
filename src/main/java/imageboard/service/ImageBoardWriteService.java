package imageboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import imageboard.bean.ImageBoardDTO;
import imageboard.dao.ImageBoardDAO;

public class ImageBoardWriteService implements CommandProcess {
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//실제 폴더
		String realFolder = request.getServletContext().getRealPath("/storage");
		System.out.println(realFolder);
		
		//업로드
		MultipartRequest multi = new MultipartRequest(request, 
													realFolder, //이미지가 저장되는 위치
													5 * 1024 * 1024, //5MB
													"UTF-8", 
													new DefaultFileRenamePolicy()); //똑같은 이름 파일 이름 변경
		
		//데이터
		String imageid = multi.getParameter("imageid");
		String imagename = multi.getParameter("imagename");
		int imageprice = Integer.parseInt(multi.getParameter("imageprice"));
		int imageqty = Integer.parseInt(multi.getParameter("imageqty"));
		String imagecontent = multi.getParameter("imagecontent");
		String image1 = multi.getOriginalFileName("image1");
		String fileName = multi.getFilesystemName("image1");
		
		System.out.println(fileName);
		
		ImageBoardDTO imageboardDTO = new ImageBoardDTO();
		imageboardDTO.setImageid(imageid);
		imageboardDTO.setImagename(imagename);
		imageboardDTO.setImageprice(imageprice);
		imageboardDTO.setImageqty(imageqty);
		imageboardDTO.setImagecontent(imagecontent);
		imageboardDTO.setImage1(image1); //파일명만 DTO를 통해 DB에 저장
		
		ImageBoardDAO imageboardDAO = ImageBoardDAO.getInstance();
		imageboardDAO.imageboardWrite(imageboardDTO);
		
		request.setAttribute("realFolder", realFolder);
		
		return "/imageboard/imageboardWrite.jsp";
	}
}
