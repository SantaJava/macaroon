package edu.iot.butter.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileUtil {
	
	public static void copy(String path, HttpServletResponse response) {
		// path : 파일 경로.

		try (InputStream in = new BufferedInputStream(new FileInputStream(path));
				OutputStream out = new BufferedOutputStream(response.getOutputStream());) {
			int data;
			while ((data = in.read()) != -1) {
				out.write(data);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
