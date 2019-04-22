<%--
  Created by IntelliJ IDEA.
  User: 987024
  Date: 4/19/2019
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<!-- menu profile quick info -->
<div class="profile clearfix">
    <div class="profile_pic">
        <img src="images/img2.jpg" alt="..." class="img-circle profile_img">
    </div>
    <div class="profile_info">
        <span>Welcome, <%=session.getAttribute("userRole") %></span>
        <h2></h2>
    </div>
</div>
<!-- /menu profile quick info -->

<br />
<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
    <div class="menu_section">
        <h3>General</h3>
        <% if(session.getAttribute("userRole").equals("admin")){ %>
        <ul class="nav side-menu">
            <li><a href="<%= request.getContextPath() %>/home.jsp"><i class="fa fa-home"></i> Tasks</a></li>
         	<li><a href="<%= request.getContextPath() %>/users.jsp"><i class="fa fa-user"></i> Users</a></li>
            <li><a href="<%= request.getContextPath() %>/teams.jsp"><i class="fa fa-user"></i> Teams</a></li>
        </ul>
        <%} %>
        <% if(session.getAttribute("userRole").equals("manager")){ %>
        <ul class="nav side-menu">
            <li><a href="<%= request.getContextPath() %>/home.jsp"><i class="fa fa-home"></i> Tasks</a></li>
            <li><a href="<%= request.getContextPath() %>/teams.jsp"><i class="fa fa-user"></i> Teams</a></li>
        </ul>
        <%} %>
        <% if(session.getAttribute("userRole").equals("developer")){ %>
        <ul class="nav side-menu">
            <li><a href="<%= request.getContextPath() %>/home.jsp"><i class="fa fa-home"></i> Tasks</a></li>
        </ul>
        <%} %>
        
    </div>
</div>

<!-- /menu footer buttons -->
<div class="sidebar-footer hidden-small">
    <!-- <a data-toggle="tooltip" data-placement="top" title="Settings"> -->
    <!-- <span class="glyphicon glyphicon-cog" aria-hidden="true"></span> -->
    <!-- </a> -->
    <!-- <a data-toggle="tooltip" data-placement="top" title="FullScreen"> -->
    <!-- <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span> -->
    <!-- </a> -->
    <!-- <a data-toggle="tooltip" data-placement="top" title="Lock"> -->
    <!-- <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span> -->
    <!-- </a> -->
    <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.jsp">
        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
    </a>
</div>
<!-- /menu footer buttons -->