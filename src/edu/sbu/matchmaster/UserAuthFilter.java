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
        switch(userBean.getType()){

            case CUST:
                req.getRequestDispatcher()
                break;
            case EMP:
                break;
            case MNG:
                break;
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException{

    }

}
