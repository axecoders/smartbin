<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Smart Bin Home</title>

    <!-- Bootstrap Core CSS -->
    <link href="./bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="./bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="./dist/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="./bower_components/morrisjs/morris.css " rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="./bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="http://maps.google.com/maps/api/js" type="text/javascript"></script>

<style>
.route-button-view {
   background-color: #f5f5f5;
   border:solid thin;
   border-radius:3px;
   border-color:#337AB7;
   width:100px;
}

.button, .button.disabled:hover {
    margin-bottom: 20px;
    text-decoration: none;
    border:1px solid #25729a;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    font-family:arial, helvetica, sans-serif;
    padding: 2px 2px 2px 2px;
    text-shadow: -1px -1px 0 rgba(0,0,0,0.3);
    text-align: center;
    color: #FFFFFF;
    background-color: #3093c7;
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #3093c7), color-stop(100%, #1c5a85));
    background-image: -webkit-linear-gradient(top, #3093c7, #1c5a85);
    background-image: -moz-linear-gradient(top, #3093c7, #1c5a85);
    background-image: -ms-linear-gradient(top, #3093c7, #1c5a85);
    background-image: -o-linear-gradient(top, #3093c7, #1c5a85);
    background-image: linear-gradient(top, #3093c7, #1c5a85);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#3093c7, endColorstr=#1c5a85);
}

.button:hover{
    border:1px solid #1c5675;
    background-color: #26759e;
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#26759e), color-stop(100%, #133d5b));
    background-image: -webkit-linear-gradient(top, #26759e, #133d5b);
    background-image: -moz-linear-gradient(top, #26759e, #133d5b);
    background-image: -ms-linear-gradient(top, #26759e, #133d5b);
    background-image: -o-linear-gradient(top, #26759e, #133d5b);
    background-image: linear-gradient(top, #26759e, #133d5b);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#26759e, endColorstr=#133d5b);
}
</style>
</head>

<body onLoad="insertText()">

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Welcome ${username} to Smart Bin Dashboard</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-tasks fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                     <#list myroutes as route>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Route ${route["routeid"]}</strong>
                                        <span class="pull-right text-muted">40% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                       </#list>
                     </ul>
                    <!-- /.dropdown-tasks -->
                </li>
                <!-- /.dropdown -->

                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="dashboard"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-history fa-fw"></i> Route History</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-truck fa-fw"></i> Truck Details</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-warning fa-fw"></i> Routes Escalated</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-search fa-fw"></i> Monitor Routes </a>
                        </li>

                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header">Dashboard</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-truck fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${totalinprogressroutes}</div>
                                    <div>Routes in Progress!</div>
                                </div>
                            </div>
                        </div>
                         <!--<a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>-->
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-road fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><label id="totroutelabel"/></div>
                                    <div>Total Routes!</div>
                                </div>
                            </div>
                        </div>
                         <!--<a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>-->
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                        <i class="fa fa-check-square fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${totalcompletedroutes}</div>
                                    <div>Routes Completed!</div>
                                </div>
                            </div>
                        </div>
                         <!--<a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>-->
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-warning fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${totalescalatedroutes}</div>
                                    <div>Routes Escalated!</div>
                                </div>
                            </div>
                        </div>
                       <!-- <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>-->
                    </div>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        </div>
                        <!-- /.panel-heading -->
                        <iframe name="innerHtmlFrame" height="600px" width="620px" src="http://localhost:8082/ShowRoute.html" frameborder="0"></iframe>
                        <script>
                        var hostname = location.hostname;
                        var loc = "${names}";
                        function insertText(){
                            document.getElementById("totroutelabel").innerHTML = "${totallimitedroutes}";
                            var ifr = document.getElementsByName('innerHtmlFrame')[0];
                            ifr.src = "http://"+hostname+":8082/ShowRoute.html?route="+loc;
                        }

                        function getRoute(id){
                            var routeid = document.getElementById("route_"+id).value;
                            var ifr = document.getElementsByName('innerHtmlFrame')[0];
                            ifr.src = "http://"+hostname+":8082/ShowRoute.html?route="+routeid;
                        }
                        </script>
                        <script src="./js/smartbin-common.js"></script>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                  </div>
                <!-- /.col-lg-8 -->
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-list fa-fw"></i> Route List
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="list-group">
                            <table width="286px">
                            <#list myroutes as route>
                            <tr>
                                <td colspan="2">
                                <div style="color:red;display:block" id="truck2_${route["routeid"]}">
                                </div>
                                </td>
                            </tr>
                            <tr>
                            <td align="center" style="padding: 5px;vertical-align:top;">
                            <input id="route_${route["routeid"]}" type="hidden" value='${route["route"]}'/>
                                <span class="pull-left text-muted">
                                <a href="#" onClick="getRoute(${route["routeid"]});">
                                    <div class="route-button-view">
                                        View Route ${route["routeid"]}
                                    </div>
                                </a>
                                </td >

                                <#if route["truckid"]=="">
                                <td style="padding: 5px;vertical-align:top;>
                                <div style="display:block" id="truck_${route["routeid"]}">
                                <select style="border-color: #337AB7;" id="select_${route["routeid"]}">
                                <option value="Select">Select</option>
                                    <#list trucklist as truck>
                                        <option value="${truck["truckid"]}">${truck["truckid"]}</option>
                                    </#list>
                                </select>
                                <input id="assign_${route["routeid"]}" class="button" type="submit" value="Assign" onClick="assignRoute(${route["routeid"]});"/>
                                  </div>
                                 <input id="totalroute" type="hidden" value='${route?size}'/>
                             </span>
                             <#else>
                              <td style="padding: 5px;vertical-align:top;>
                                  <div style="display:block" id="truck_${route["routeid"]}">
                                    <select style="border-color: #337AB7;background-color:#dddddd;" disabled id="select_${route["routeid"]}" onchange="selectedTruckDetails(this.value);">
                                        <option value="Select">Select</option>
                                        <#list trucklist as truck>
                                            <option value="${truck["truckid"]}">${truck["truckid"]}</option>
                                        </#list>
                                    </select>
                                    <input disabled id="assign_${route["routeid"]}" class="button" type="submit" value="Assign" onClick="assignRoute(${route["routeid"]});"/>
                                  </div>
                                  <input id="totalroute" type="hidden" value='${route?size}'/>
                                  </span>
                               </td>
                             </#if>

                              </tr>
                                 <#if route["truckid"]!="">
                                 <tr>
                                     <td colspan="2" align="center">
                                      <div id="unassign_${route["routeid"]}" style="display:block">
                                        Route ${route["routeid"]} assigned to ${route["truckid"]}
                                        <input id="unassign" class="button" type="submit" value="Un-assign" onClick="UnAssignRoute(${route["routeid"]},'${route["truckid"]}');"/>
                                       </div>
                                  </td>
                                 </tr>
                                  <#else>
                                  <tr>
                                  <td colspan="2">
                                      <div style="display:block" id="truckl_${route["routeid"]}">
                                      </div>
                                   </td>
                                   </tr>
                                  </#if>
                            </#list>
                            </table>
                            </div>
                            <!-- /.list-group -->

                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->

                    <!-- /.panel -->

                    <!-- /.panel .chat-panel -->
                </div>
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="./bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="./bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="./bower_components/raphael/raphael-min.js"></script>
    <script src="./bower_components/morrisjs/morris.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="./dist/js/sb-admin-2.js"></script>

</body>

</html>
