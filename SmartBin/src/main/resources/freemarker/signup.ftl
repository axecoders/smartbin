<!DOCTYPE html>

<html>
  <head>
    <title>Sign Up</title>
    <style type="text/css">
      .label {text-align: right}
      .error {color: red}
    </style>
 <!-- Bootstrap Core CSS -->
    <link href="./bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="./bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="./bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
          <div class="row">
              <div class="col-md-4 col-md-offset-4">
                  <div class="login-panel panel panel-default">
                      <div class="panel-heading">
  <div class="panel-body">
    Already a user? <a href="/login">Login</a><p>
    <h2>Signup</h2>
    <form method="post">
      <fieldset>
      <div class="error">
      	    ${username_error!""}
                </div>
          <div class="form-group">
            <input class="form-control" placeholder="User-Name" type="text" name="username" value="${username}" autofocus>
            </div>
          <div class="error">
          	    ${password_error!""}
                      </div>
          <div class="form-group">
            <input class="form-control" placeholder="Password" type="password" name="password" value="">
            <div>
           <div class="error">
          	    ${verify_error!""}
                      </div><br />
          <div class="form-group">
            <input class="form-control" placeholder="Verify Password" type="password" name="verify" value="">
            <div>
<br />
<input class="btn btn-lg btn-success btn-block" type="submit">
 </fieldset>

    </form>
    <div>
     </div>
                </div>
            </div>
        </div>
  </body>

</html>
