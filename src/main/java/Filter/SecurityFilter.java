package Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = { "/tasks", "/home.jsp","/users.jsp"})
public class SecurityFilter implements Filter {

    public SecurityFilter() {
    }


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String servletPath = request.getServletPath();
        System.out.println("servletPath = " + servletPath);
        if ("/login.jsp".equals(servletPath) || "/login".equals(servletPath) || "/logout".equals(servletPath)) {
            System.out.println("allow access");
            filterChain.doFilter(request, response);
            return;
        }
        HttpSession session = request.getSession();
        String userRole = (String) session.getAttribute("userRole");
        if (userRole == null) goToAccessDenied(request, response);
        System.out.println("userRole = " + userRole);
        if ("admin".equals(userRole)) {
            filterChain.doFilter(request, response);
            return;
        }

        if ("manager".equals(userRole)) {
            if ("/home.jsp".equals(servletPath) || "/".equals(servletPath)
                    | "/team.jsp".equals(servletPath)) {
                filterChain.doFilter(request, response);
                return;
            } else {
                goToAccessDenied(request, response);
            }
        }
        if ("developer".equals(userRole)) {
            if ("/home.jsp".equals(servletPath) || "/".equals(servletPath)) {
                filterChain.doFilter(request, response);
                return;
            } else {
                goToAccessDenied(request, response);
            }
        }

        if ("guest".equals(userRole)) {
            System.out.println("Denied");
            goToAccessDenied(request, response);
        }
//        if ("/home.jsp".equals(servletPath)) {
//            if ("admin".equals(userRole)) {
//                System.out.println("allow access");
//                filterChain.doFilter(request, response);
//            } else {
//                goToAccessDenied(request, response);
//            }
//        }
        if ("/*.css".equals(servletPath)) filterChain.doFilter(request, response);
        System.out.println("filter done");
        filterChain.doFilter(request, response);

    }

    @Override
    public void destroy() {

    }

    private void goToAccessDenied(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        request.getRequestDispatcher(request.getContextPath() + "denied.jsp").forward(request, response);
    }

}
