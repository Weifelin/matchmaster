package edu.sbu.matchmaster;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(filterName = "UserAuthFilter", urlPatterns = {"/user/*"})
public class UserAuthFilter implements Filter{
    public void destroy(){
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException{
        HttpServletRequest request = (HttpServletRequest) req;
        UserBean userBean = (UserBean) request.getSession().getAttribute("userBean");
        if(userBean == null){
            request.getServletContext().getRequestDispatcher("/login").forward(req, resp);
        }else{
            switch(userBean.getType()){

                case CUST:
                    chain.doFilter(req, resp);
                    break;
                case EMP:
                    request.getServletContext().getRequestDispatcher("/emp/dash").forward(req, resp);
                    break;
                case MNG:
                    request.getServletContext().getRequestDispatcher("/manage/dash").forward(req, resp);
                    break;
            }
        }
    }

    public void init(FilterConfig config) throws ServletException{

    }

}
