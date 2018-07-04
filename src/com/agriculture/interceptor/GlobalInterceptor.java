package com.agriculture.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class GlobalInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        System.out.println("pre specific request interceptor: " + httpServletRequest.getRequestURI());
        List<String> allowdURIList = new ArrayList<>();
        allowdURIList.add("/user/login");
        allowdURIList.add("/user/register");
        allowdURIList.add("/user/forget-password");

        String URI = httpServletRequest.getRequestURI();
        if (allowdURIList.indexOf(URI) == -1) {//不在允许通过列表
            //检查session
            HttpSession session = httpServletRequest.getSession();
            if (session.getAttribute("user") != null) {
                //已经登录
                return true;
            } else {
                return true;
                //httpServletResponse.sendRedirect("/user/login");return false;
            }
        } else {
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
