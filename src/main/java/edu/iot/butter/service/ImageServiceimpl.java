package edu.iot.butter.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.tika.Tika;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.iot.butter.dao.ImageDao;
import edu.iot.butter.model.Image;
import edu.iot.butter.model.Pagination;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;

@Service
public class ImageServiceimpl implements ImageService {

	@Autowired
	ImageDao dao;

	@Override
	public Pagination getPagination(int page) throws Exception {
		int total = dao.getCount();
		Pagination pagination = new Pagination(page, total, 9);
		return pagination;
	}

	@Override
	public List<Image> getList(Pagination pagination) throws Exception {
		return dao.selectList(pagination);
	}

	@Override
	public Image getImage(int id) throws Exception {
		return dao.selectOne(id);
	}

	@Override
	public boolean upload(Image image, List<MultipartFile> fileList) throws Exception {
		for (MultipartFile file : fileList) {
			if (!file.isEmpty()) {
				
				saveImage(image, file);
				dao.insert(image);
			}
		}
		return true;
	}

	public void saveImage(Image image, MultipartFile file) throws Exception {

		String fileName = file.getOriginalFilename();
		String newName = saveImage(fileName, file); // 실제로 이미지 저장.
		String thumbName = saveThumb(newName); // thumb파일

		Tika tika = new Tika();
		String mimeType = tika.detect(fileName);

		// Tika tika = new Tika();
		// String mimeType = tika.detect(fileName);

		image.setFileName(fileName);
		image.setMimeType(mimeType);
		image.setFileSize(file.getSize());
		image.setNewName(newName);
		image.setThumbName(thumbName);
	}

	private String saveImage(String fname, MultipartFile file) throws Exception {
		long fileNo = System.currentTimeMillis(); // 파일 구분하기 위한 millis를 붙여준다.
		String newName = fileNo + "_" + fname;
		String path = IMAGE_DIR + "/" + newName; // 만약에 절대경로로 path를 지정하면 데이터베이스에있는것 다 고쳐줘야 하는데 상수만 바꾸면 다 바꿀 수 있게끔하기 위해서
													// newName으로 저장한다.

		file.transferTo(new File(path));
		return newName; // 새로 만든 파일명 리턴.

	}

	private String saveThumb(String fname) throws Exception {
		String thumbName = "thumbnail-" + fname;

		// Thumbnail파일생성
		Thumbnails
		.of(new File(IMAGE_DIR + "/" + fname))
		.crop(Positions.CENTER) // 이미지 crop
		.size(200, 200)
		.toFile(new File(THUMB_DIR + "/" + thumbName));

		return thumbName;
	}
}
