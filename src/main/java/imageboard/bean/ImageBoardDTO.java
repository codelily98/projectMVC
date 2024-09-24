package imageboard.bean;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ImageBoardDTO {
	private int seq;
	private String imageid;
	private String imagename;
	private int imageprice;
	private int imageqty;
	private String imagecontent;
	private String image1;
	private Date logtime;	
}
