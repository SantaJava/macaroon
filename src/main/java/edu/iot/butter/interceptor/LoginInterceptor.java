package edu.iot.butter.interceptor;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;



@Component
public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	ServletContext context;


	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("USER") == null) {
			saveUrl(request, response);
			response.sendRedirect(context.getContextPath() + "/login");
			return false;
		}
		return super.preHandle(request, response, handler);
	}

	public void saveUrl(HttpServletRequest request, HttpServletResponse response) {
		String url = request.getRequestURI().substring(context.getContextPath().length());
		String query = request.getQueryString();
		if (query != null) {
			url = url + "?" + query;
		}
		FlashMap flashMap = new FlashMap();
		flashMap.put("url", url);
		FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
		flashMapManager.saveOutputFlashMap(flashMap, request, response);
	}

}
