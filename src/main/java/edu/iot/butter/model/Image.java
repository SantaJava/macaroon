package edu.iot.butter.model;

import java.util.Date;
import java.util.List;

public class Image {
	private int imageId;
	private String title;
	private String description;
	private String fileName;
	private String thumbName;
	private long fileSize;
	private String mimeType;
	private Date regDate;
	private String newName; //name at Server (we need this incase of duplicate.)
	
	

	public Image() {
		super();
	}

	public Image(String title, String description, String fileName, String newName, String thumbName, int size, String mimeType,
			Date regDate) {
		super();
		this.title = title;
		this.description = description;
		this.fileName = fileName;
		this.newName = newName;
		this.thumbName = thumbName;
		this.fileSize = size;
		this.mimeType = mimeType;
		this.regDate = regDate;
	}
	
	
	
	
	public String getNewName() {
		return newName;
	}

	public void setNewName(String newName) {
		this.newName = newName;
	}

	public int getImageId() {
		return imageId;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setImageId(int imageId) {
		this.imageId = imageId;
	}

	public void setFileSize(long l) {
		this.fileSize = l;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getThumbName() {
		return thumbName;
	}

	public void setThumbName(String thumbName) {
		this.thumbName = thumbName;
	}

	public long getSize() {
		return fileSize;
	}

	public void setSize(int size) {
		this.fileSize = size;
	}

	public String getMimeType() {
		return mimeType;
	}

	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Image [title=" + title + ", description=" + description + ", fileName=" + fileName + ", newName="+ newName+", thumbName="
				+ thumbName + ", file_size=" + fileSize + ", mimeType=" + mimeType + ", regDate=" + regDate + "]";
	}	
}
