<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Teams </title>


    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="vendors/iCheck/skins/flat/green.css" rel="stylesheet">
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

    <!-- PNotify -->
<%--    <link href="vendors/pnotify/dist/pnotify.css" rel="stylesheet">--%>
<%--    <link href="vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">--%>
<%--    <link href="vendors/pnotify/dist/pnotify.nonblock.css" rel="stylesheet">--%>


    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">
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
                <!-- /menu profile quick info -->
                <!-- sidebar menu -->
                <jsp:include page="WEB-INF/side-menu.jsp"/>
                <!-- /sidebar menu -->
                <!-- /menu footer buttons -->
                <!-- /menu footer buttons -->
            </div>
        </div>

        <!-- top navigation -->
        <jsp:include page="WEB-INF/header.jsp"></jsp:include>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="ajax-loader" id="ajax-loader">
                <img src="images/ajax-loader.gif" class="img-responsive" />
            </div>
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                    </div>
                    <div class="clearfix"></div>
f
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Teams</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">


                                    <form class="form-horizontal form-label-left" novalidate>
                                        <div class="item form-group">

                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="Teamid" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="Team id" placeholder="Team id" required="required"  type="hidden">
                                            </div>
                                        </div>

                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Team Name <span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="teamname"  type="text" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="TeamName" placeholder="Team Name" required="required" >

                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Team Description <span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <textarea id="teamdesc"  class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="teamdesc" placeholder="Team Description" required="required" ></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Users</label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <select rows =8 class="select2_multiple form-control" id="selectusers" multiple="multiple">
                                                    <option>Choose option</option>
                                                </select>
                                            </div>
                                        </div>



                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-md-offset-3">
                                                <button type="button" id="clear" class="btn btn-primary">Clear</button>
                                                <button id="save" type="button" class="btn btn-success">Save</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Teams</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <table id="datatable-responsive2" class="table table-striped table-bordered dt-responsive" cellspacing="0" width="100%">

                                    <thead>
                                        <tr>
                                            <th>Team ID</th>
                                            <th>Team Name</th>
                                            <th>Description</th>
                                            <th>Action</th>

                                        </tr>
                                        </thead>
                                        <tbody>


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
<script src="vendors/jquery/dist/jquery.min.js"></script>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>--%>
<!-- Bootstrap -->
<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="vendors/nprogress/nprogress.js"></script>
<!-- iCheck -->
<script src="vendors/iCheck/icheck.min.js"></script>
<!-- Datatables -->
<script src="vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
<script src="vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
<script src="vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
<script src="vendors/pdfmake/build/pdfmake.min.js"></script>
<script src="vendors/pdfmake/build/vfs_fonts.js"></script>
<!-- PNotify -->
<!-- bootstrap-daterangepicker -->
<script src="vendors/moment/min/moment.min.js"></script>
<!-- bootstrap-datetimepicker -->
<script src="vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<!-- jquery.inputmask -->
<script src="vendors/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
<!-- Custom Theme Scripts -->
<script src="build/js/custom.min.js"></script>
<!-- Initialize datetimepicker -->
<script>
    $('#myDatepicker').datetimepicker({format: 'MM/DD/YYYY'});
</script>



<script type="text/javascript" src="controller/team.js"></script>


<%--<script src="./build/js/sweetalert.min.js"></script>--%>
<%--<script src="./build/js/sweetalert.js"></script>--%>
<%--<script src="./build/js/custom.js"></script>--%>
<%--<script src="./build/js/custom.min.js"></script>--%>
<%--<!-- Include a polyfill for ES6 Promises (optional) for IE11 -->--%>
<%--<link rel="stylesheet" href="./build/css/sweetalert.min.css">--%>
<%--<link rel="stylesheet" href="./build/css/sweetalert.css">--%>
<%--<link rel="stylesheet" href="./build/css/custom.css">--%>
<%--<link rel="stylesheet" href="./build/css/custom.min.css">--%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</body>
</html>