<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Task Management System! | Login</title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
</head>

<body class="login">
<div>
    <a class="hiddenanchor" id="signup"></a>
    <a class="hiddenanchor" id="signin"></a>

    <div class="login_wrapper">
        <div class="animate form login_form">
            <section class="login_content">
                <form action="login" method="post">
                    <h1>Login Form</h1>
                    <div id="errors" style="color: red">
                        ${errors}
                    </div>
                    <div>
                        <input name="userName" type="text" class="form-control" placeholder="Username" required="" value="${userName}" />
                    </div>
                    <div>
                        <input name="password" type="password" class="form-control" placeholder="Password" required="" value="${password}"/>
                    </div>
                    <div>
                        <div style="text-align: left">
                            <input  name="rememberMe" type="checkbox" value="rememberMe"> Remember me
                        </div>
                        <br>
                        <input style="margin-left: 140px" class="btn btn-default submit" type="submit" value="Login">
                        
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">
                       

                        <div class="clearfix"></div>
                        <br />

                        <div>
                            <h1><i class="fa fa-paw"></i> WAP Project</h1>
                            <p>�2019 All Rights Reserved. Privacy and Terms</p>
                        </div>
                    </div>
                </form>
            </section>
        </div>

        <div id="register" class="animate form registration_form">
            <section class="login_content">
                <form action="createUser" method="post">
                    <h1>Create Account</h1>
                    <div>
                        <input name="userName" type="text" class="form-control" placeholder="Username" required="" />
                    </div>
                    <div>
                        <input name="email" type="email" class="form-control" placeholder="Email" required="" />
                    </div>
                    <div>
                        <input name="password" type="password" class="form-control" placeholder="Password" required="" />
                    </div>
                    <div>
                        <select name="role">
                            <option value="">-- Select Role --</option>
                            <option value="manager">Manager</option>
                            <option value="developer">Developer</option>
                        </select>
                    </div>
                    <div>
                        <br>
                        <input style="margin-left: 128px" class="btn btn-default submit" value="Create User" type="submit">
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">
                        <p class="change_link">Already a member ?
                            <a href="#signin" class="to_register"> Log in </a>
                        </p>

                        <div class="clearfix"></div>
                        <br />

                        <div>
                            <h1><i class="fa fa-paw"></i> WAP Project!</h1>
                            <p>©2016 All Rights Reserved. Privacy and Terms</p>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </div>
</div>
</body>
</html>
