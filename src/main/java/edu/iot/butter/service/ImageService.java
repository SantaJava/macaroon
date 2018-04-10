package edu.iot.butter.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.iot.butter.model.Image;
import edu.iot.butter.model.Pagination;


public interface ImageService {
	public final static String IMAGE_DIR = "c:/temp/images";
	public final static String THUMB_DIR = "c:/temp/images/thumb";

	Pagination getPagination(int page) throws Exception;

	List<Image> getList(Pagination pagination) throws Exception;

	Image getImage(int id) throws Exception;
	
	boolean upload(Image image, List<MultipartFile> fileList)throws Exception;
	
}
