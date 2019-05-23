<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图</title>

</head>


<body>
<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/icon.css"/>
<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/default/easyui.css"/>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/datagrid-export.js"></script>
<script type="text/javascript" src="echarts.min.js"></script>
<script type="text/javascript">
var my_ec;
$(function(){
	alert(1)
	var ecConfig = echarts.config;
	//路径配置
	ecConfig.config({  
        paths:{   
            "echarts" : "/Web/WebContent/echarts",  //proj是我项目的名称
        }  
    });  
	ecConfig(  
		       [  
		           "echarts",
		           "echarts/chart/pie",
		           "echarts/chart/bar",
		           ],
		           function(ec){
		    	   my_ec = ec;//将echarts对象赋值给自定义的变量
		    	   postChart();
		    	}
		       );
});
function postChart(){
	var myChart = my_ec.init(document.getElementById('echarts_post')); 
	var option = {	    
		title : {	      
			text: '学员职务统计',	 
		},	    
		tooltip : {	       
			trigger: 'axis'	    
		},	   
		legend: {	       
				data:["学员人数"],	        
				y : "bottom",	   
		},
	 calculable : true,
	  xAxis : [{
		        	  type : 'category',
			            data : ["科员","副科级","正科级","副处级","处级"],
		        }],
		        yAxis : [{
		     	        	 type : 'value'
		     	        }],
		     	series : [{
		     	    	     name:"学员人数",
		     	    	     type:'bar',
		     	    	     data:[13,9,5,4,2],
		     	    	        }],}
				myChart.setOption(option); 
			}



</script>
</body>
</html>