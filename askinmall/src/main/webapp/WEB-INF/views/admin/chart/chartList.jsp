<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>     
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Starter</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
<%@include file="/WEB-INF/views/admin/include/plugin1.jsp" %>  



</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
 <%@include file="/WEB-INF/views/admin/include/header.jsp" %>
 
  <!-- Left side column. contains the logo and sidebar -->
 <%@include file="/WEB-INF/views/admin/include/nav.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Page Header
        <small>Optional description</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">

      <!--------------------------
        | Your Page Content Here |
        -------------------------->
        
     <div class="row">
        	<div class="col-md-12">
        	
        	<div class="box">

            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tbody><tr><!-- width: 합이 100% 맞춰지게 조절 -->
                <!-- th와 td의 개수가 같아야한다 -->
                  <th style="width: 2%">
                  	차트 보기
                  	<select>
                  		<option>카테고리별 통계</option>
                  		<option>날짜별 통계</option>
                  	</select>                  	
                  	
                  </th>
                </tr>
                <tr>
                	<td>
                		<div id="firstCategorySalesChart"></div> <!-- 차트 출력 위치 -->
                		<div id="monthlySalesChart"></div>
                		<h4>판매 순위별 상품 목록</h4>
                		<div id="bestSellingChart"></div>
                	</td>
                </tr>              
              </tbody></table>
            </div>
			<!-- /.box-body -->
          </div>
        	
        	
        	</div>
        
        </div>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="pull-right-container">
                    <span class="label label-danger pull-right">70%</span>
                  </span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->
<%@include file="/WEB-INF/views/admin/include/plugin2.jsp" %>

<!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});
      google.charts.load('current', {packages: ['table']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);
      google.charts.setOnLoadCallback(drawChart2);
      google.charts.setOnLoadCallback(bestSellingChart);
 
      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        let categorySalesData = $.ajax({
          url: '/admin/chart/firstCategorySales',
          type: 'get',
          dataType: 'json',
          async: false
        }).responseText;

        console.log("categorySalesData" + categorySalesData);
		
        // Create the data table.
        var data = new google.visualization.DataTable(categorySalesData);

        // Set chart options
        var options = {'title':'1차 카테고리별 주문금액',
                       'width':800,
                       'height':350};

        // Instantiate and draw our chart, passing in some options.
        // 다른 차트를 사용하고 싶을 경우 아래 코드에서 google.visualization.BarChart 부분을 변경해주면 된다
        var chart = new google.visualization.BarChart(document.getElementById('firstCategorySalesChart')); // firstCategoryChart: chart가 출력되는 위치
        chart.draw(data, options);
      }
      
      
      
      function bestSellingChart() {

          let bestSellingProdData = $.ajax({
            url: '/admin/chart/bestSellingProd',
            type: 'get',
            dataType: 'json',
            async: false
          }).responseText;

          console.log("bestSellingProdData" + bestSellingProdData);
  		
          // Create the data table.
          var data = new google.visualization.DataTable(bestSellingProdData);

          // Set chart options
          var options = {'title':'최다주문 상품', showRowNumber: true, width: '700', height: '100%', page: 'enable', pageSize: '10'};

          // Instantiate and draw our chart, passing in some options.
          // 다른 차트를 사용하고 싶을 경우 아래 코드에서 google.visualization.BarChart 부분을 변경해주면 된다
          var chart = new google.visualization.Table(document.getElementById('bestSellingChart')); // firstCategoryChart: chart가 출력되는 위치
          chart.draw(data, options);
        }
      
      
      
      function drawChart2() {

          let monthlySalesData = $.ajax({
            url: '/admin/chart/monthlySales',
            type: 'get',
            dataType: 'json',
            async: false
          }).responseText;

          console.log("monthlySalesData" + monthlySalesData);
  		
          // Create the data table.
          var data = new google.visualization.DataTable(monthlySalesData);

          // Set chart options
          var options = {'title':'월별 주문 건수',
                         'width':800,
                         'height':350};

          // Instantiate and draw our chart, passing in some options.
          // 다른 차트를 사용하고 싶을 경우 아래 코드에서 google.visualization.BarChart 부분을 변경해주면 된다
          var chart = new google.visualization.ColumnChart(document.getElementById('monthlySalesChart')); // firstCategoryChart: chart가 출력되는 위치
          chart.draw(data, options);
        }
      
    </script>

</body>
</html>