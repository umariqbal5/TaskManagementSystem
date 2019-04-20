<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>Tasks </title>

  <!-- Bootstrap -->
  <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <!-- NProgress -->
  <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
  <!-- iCheck -->
  <link href="vendors/iCheck/skins/flat/green.css" rel="stylesheet">
  <!-- bootstrap-daterangepicker -->
  <link href="vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
  <!-- bootstrap-datetimepicker -->
  <link href="vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" rel="stylesheet">
  <!-- Select2 -->
  <link href="vendors/select2/dist/css/select2.min.css" rel="stylesheet">
  <!-- Datatables -->
  <link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
  <link href="vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
  <link href="vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
  <link href="vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
  <link href="vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

  <!-- Custom Theme Style -->
  <link href="build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
<div class="container body">
  <div class="main_container">
    <div class="col-md-3 left_col">
      <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
          <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>WAP Project</span></a>
        </div>

        <div class="clearfix"></div>

        <!-- menu profile quick info -->
        <div class="profile clearfix">
          <div class="profile_pic">
            <img src="images/img2.jpg" alt="..." class="img-circle profile_img">
          </div>
          <div class="profile_info">
            <span>Welcome,</span>
            <h2>Admin</h2>
          </div>
        </div>
        <!-- /menu profile quick info -->

        <br />

        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
          <div class="menu_section">
            <h3>General</h3>
            <ul class="nav side-menu">
              <li><a><i class="fa fa-home"></i> Tasks</a></li>
              <li><a><i class="fa fa-user"></i> Users</a></li>
              </li>
              <!-- <li><a><i class="fa fa-edit"></i> Forms <span class="fa fa-chevron-down"></span></a> -->
              <!-- <ul class="nav child_menu"> -->
              <!-- <li><a href="form.html">General Form</a></li> -->
              <!-- <li><a href="form_advanced.html">Advanced Components</a></li> -->
              <!-- <li><a href="form_validation.html">Form Validation</a></li> -->
              <!-- <li><a href="form_wizards.html">Form Wizard</a></li> -->
              <!-- <li><a href="form_upload.html">Form Upload</a></li> -->
              <!-- <li><a href="form_buttons.html">Form Buttons</a></li> -->
              <!-- </ul> -->
              <!-- </li> -->
              <!-- <li><a><i class="fa fa-desktop"></i> UI Elements <span class="fa fa-chevron-down"></span></a> -->
              <!-- <ul class="nav child_menu"> -->
              <!-- <li><a href="general_elements.html">General Elements</a></li> -->
              <!-- <li><a href="media_gallery.html">Media Gallery</a></li> -->
              <!-- <li><a href="typography.html">Typography</a></li> -->
              <!-- <li><a href="icons.html">Icons</a></li> -->
              <!-- <li><a href="glyphicons.html">Glyphicons</a></li> -->
              <!-- <li><a href="widgets.html">Widgets</a></li> -->
              <!-- <li><a href="invoice.html">Invoice</a></li> -->
              <!-- <li><a href="inbox.html">Inbox</a></li> -->
              <!-- <li><a href="calendar.html">Calendar</a></li> -->
              <!-- </ul> -->
              <!-- </li> -->
              <!-- <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a> -->
              <!-- <ul class="nav child_menu"> -->
              <!-- <li><a href="tables.html">Tables</a></li> -->
              <!-- <li><a href="tables_dynamic.html">Table Dynamic</a></li> -->
              <!-- </ul> -->
              <!-- </li> -->
              <!-- <li><a><i class="fa fa-bar-chart-o"></i> Data Presentation <span class="fa fa-chevron-down"></span></a> -->
              <!-- <ul class="nav child_menu"> -->
              <!-- <li><a href="chartjs.html">Chart JS</a></li> -->
              <!-- <li><a href="chartjs2.html">Chart JS2</a></li> -->
              <!-- <li><a href="morisjs.html">Moris JS</a></li> -->
              <!-- <li><a href="echarts.html">ECharts</a></li> -->
              <!-- <li><a href="other_charts.html">Other Charts</a></li> -->
              <!-- </ul> -->
              <!-- </li> -->
              <!-- <li><a><i class="fa fa-clone"></i>Layouts <span class="fa fa-chevron-down"></span></a> -->
              <!-- <ul class="nav child_menu"> -->
              <!-- <li><a href="fixed_sidebar.html">Fixed Sidebar</a></li> -->
              <!-- <li><a href="fixed_footer.html">Fixed Footer</a></li> -->
              <!-- </ul> -->
              <!-- </li> -->
            </ul>
          </div>
          <!-- <div class="menu_section"> -->
          <!-- <h3>Live On</h3> -->
          <!-- <ul class="nav side-menu"> -->
          <!-- <li><a><i class="fa fa-bug"></i> Additional Pages <span class="fa fa-chevron-down"></span></a> -->
          <!-- <ul class="nav child_menu"> -->
          <!-- <li><a href="e_commerce.html">E-commerce</a></li> -->
          <!-- <li><a href="projects.html">Projects</a></li> -->
          <!-- <li><a href="project_detail.html">Project Detail</a></li> -->
          <!-- <li><a href="contacts.html">Contacts</a></li> -->
          <!-- <li><a href="profile.html">Profile</a></li> -->
          <!-- </ul> -->
          <!-- </li> -->
          <!-- <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a> -->
          <!-- <ul class="nav child_menu"> -->
          <!-- <li><a href="page_403.html">403 Error</a></li> -->
          <!-- <li><a href="page_404.html">404 Error</a></li> -->
          <!-- <li><a href="page_500.html">500 Error</a></li> -->
          <!-- <li><a href="plain_page.html">Plain Page</a></li> -->
          <!-- <li><a href="login.jsp">Login Page</a></li> -->
          <!-- <li><a href="pricing_tables.html">Pricing Tables</a></li> -->
          <!-- </ul> -->
          <!-- </li> -->
          <!-- <li><a><i class="fa fa-sitemap"></i> Multilevel Menu <span class="fa fa-chevron-down"></span></a> -->
          <!-- <ul class="nav child_menu"> -->
          <!-- <li><a href="#level1_1">Level One</a> -->
          <!-- <li><a>Level One<span class="fa fa-chevron-down"></span></a> -->
          <!-- <ul class="nav child_menu"> -->
          <!-- <li class="sub_menu"><a href="level2.html">Level Two</a> -->
          <!-- </li> -->
          <!-- <li><a href="#level2_1">Level Two</a> -->
          <!-- </li> -->
          <!-- <li><a href="#level2_2">Level Two</a> -->
          <!-- </li> -->
          <!-- </ul> -->
          <!-- </li> -->
          <!-- <li><a href="#level1_2">Level One</a> -->
          <!-- </li> -->
          <!-- </ul> -->
          <!-- </li>                   -->
          <!-- <li><a href="javascript:void(0)"><i class="fa fa-laptop"></i> Landing Page <span class="label label-success pull-right">Coming Soon</span></a></li> -->
          <!-- </ul> -->
          <!-- </div> -->

        </div>
        <!-- /sidebar menu -->

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
      </div>
    </div>

    <!-- top navigation -->
    <div class="top_nav">
      <div class="nav_menu">
        <nav>
          <div class="nav toggle">
            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
          </div>

          <ul class="nav navbar-nav navbar-right">
            <li class="">
              <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                <img src="images/img2.jpg" alt="">Admin
                <span class=" fa fa-angle-down"></span>
              </a>
              <ul class="dropdown-menu dropdown-usermenu pull-right">
                <li><a href="login.jsp"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
              </ul>
            </li>
          </ul>
        </nav>
      </div>
    </div>
    <!-- /top navigation -->

    <!-- page content -->
    <div class="right_col" role="main">
      <div class="">
        <div class="page-title">
          <div class="title_left">
          </div>
          <div class="clearfix"></div>

          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>Task</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form class="form-horizontal form-label-left" novalidate>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Name <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="Task Name" required="required" type="text">
                      </div>
                    </div>

                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">Category <span class="required">*</span></label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <select class="form-control">
                          <option>Choose option</option>
                          <option value="personal">Personal</option>
                          <option value="work">Work</option>
                        </select>
                      </div>
                    </div>

                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">Priority <span class="required">*</span></label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <select class="form-control">
                          <option>Choose option</option>
                          <option value="5">5</option>
                          <option value="4">4</option>
                          <option value="3">3</option>
                          <option value="2">2</option>
                          <option value="41">1</option>
                          <option value="0">0</option>
                        </select>
                      </div>
                    </div>

                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">Assign to</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <select class="form-control">
                          <option>Select User</option>
                          <option value="personal">User1</option>
                          <option value="work">User2</option>
                        </select>
                      </div>
                    </div>

                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">Assign to Team</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <select class="form-control">
                          <option>Select Team</option>
                          <option value="personal">Team 2</option>
                          <option value="work">Team 3</option>
                        </select>
                      </div>
                    </div>

                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Required By <span class="required"> *</span>
                      </label>
                      <div class='col-md-6 col-sm-6 col-xs-12 input-group date' id='myDatepicker'>
                        <input type='text' class="form-control" data-inputmask="'mask': '99/99/9999'"/>
                        <span class="input-group-addon">
								   <span class="glyphicon glyphicon-calendar"></span>
								</span>
                      </div>
                    </div>

                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                        <button type="submit" class="btn btn-primary">Clear</button>
                        <button id="send" type="submit" class="btn btn-success">Save</button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>Tasks</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive " cellspacing="0" width="100%">
                    <thead>
                    <tr>
                      <th>Name</th>
                      <th>Due</th>
                      <th>Category</th>
                      <th>Status</th>
                      <th>Priority</th>
                      <th>User</th>
                      <th>Team</th>
                      <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                      <td>Tiger</td>
                      <td>2011/04/25</td>
                      <td>Personal</td>
                      <td>
                        <button type="button" class="btn btn-success btn-xs">Success</button>
                      </td>
                      <td>High</td>
                      <td>Umar</td>
                      <td></td>
                      <td>
                        <!-- <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a> -->
                        <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                        <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                      </td>
                    </tr>
                    <tr>
                      <td>Garrett</td>
                      <td>2011/07/25</td>
                      <td>Work</td>
                      <td>
                        <button type="button" class="btn btn-success btn-xs">Success</button>
                      </td>
                      <td>High</td>
                      <td>Umar</td>
                      <td></td>
                      <td>
                        <!-- <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a> -->
                        <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                        <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                      </td>
                    </tr>
                    <tr>
                      <td>Ashton</td>
                      <td>2009/01/12</td>
                      <td>Personal</td>
                      <td>
                        <button type="button" class="btn btn-success btn-xs">Success</button>
                      </td>
                      <td>High</td>
                      <td>Umar</td>
                      <td></td>
                      <td>
                        <!-- <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a> -->
                        <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                        <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                      </td>
                    </tr>
                    <tr>
                      <td>Cedric</td>
                      <td>2012/03/29</td>
                      <td>Personal</td>
                      <td>
                        <button type="button" class="btn btn-success btn-xs">Success</button>
                      </td>
                      <td>High</td>
                      <td>Umar</td>
                      <td></td>
                      <td>
                        <!-- <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a> -->
                        <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                        <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                      </td>
                    </tr>
                    <tr>
                      <td>Airi</td>
                      <td>2008/11/28</td>
                      <td>Personal</td>
                      <td>
                        <button type="button" class="btn btn-success btn-xs">Success</button>
                      </td>
                      <td>Low</td>
                      <td></td>
                      <td>Backend Developers</td>
                      <td>
                        <!-- <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a> -->
                        <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                        <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                      </td>
                    </tr>

                    </tbody>
                  </table>


                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- /page content -->

      <!-- footer content -->
      <jsp:include page="WEB-INF/footer.jsp"></jsp:include>
      <!-- /footer content -->
    </div>
  </div>
</div>
  <!-- jQuery -->
  <script src="../vendors/jquery/dist/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
  <!-- FastClick -->
  <script src="../vendors/fastclick/lib/fastclick.js"></script>
  <!-- NProgress -->
  <script src="../vendors/nprogress/nprogress.js"></script>
  <!-- iCheck -->
  <script src="../vendors/iCheck/icheck.min.js"></script>
  <!-- Datatables -->
  <script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
  <script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
  <script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
  <script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
  <script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
  <script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
  <script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
  <script src="../vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
  <script src="../vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
  <script src="../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
  <script src="../vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
  <script src="../vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
  <script src="../vendors/jszip/dist/jszip.min.js"></script>
  <script src="../vendors/pdfmake/build/pdfmake.min.js"></script>
  <script src="../vendors/pdfmake/build/vfs_fonts.js"></script>
  <!-- bootstrap-daterangepicker -->
  <script src="../vendors/moment/min/moment.min.js"></script>
  <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
  <!-- bootstrap-datetimepicker -->
  <script src="../vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
  <!-- jquery.inputmask -->
  <script src="../vendors/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
  <!-- Custom Theme Scripts -->
  <script src="../build/js/custom.min.js"></script>
  <!-- Initialize datetimepicker -->
  <script>
      $('#myDatepicker').datetimepicker({format: 'MM/DD/YYYY'});
  </script>
</body>
</html>