package edu.sbu.matchmaster;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "UserAuthFilter", urlPatterns = {"/user*"})
public class UserAuthFilter implements Filter{
    public void destroy(){
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException{
        HttpServletRequest request = (HttpServletRequest) req;
        UserBean userBean = (UserBean) request.getSession().getAttribute("user");
        if(userBean == null){
            ((HttpServletResponse)resp).sendRedirect("/login");
        }else{
            switch(userBean.getType()){

                case CUST:
                    chain.doFilter(req, resp);
                    break;
                case EMP:
                    ((HttpServletResponse)resp).sendRedirect(request.getContextPath()+"/empdash");
                    break;
                case MNG:
                    ((HttpServletResponse)resp).sendRedirect(request.getContextPath()+"/managereports");
                    break;
            }
        }
    }

    public void init(FilterConfig config) throws ServletException{

    }

}
