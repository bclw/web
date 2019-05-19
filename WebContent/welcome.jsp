<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/icon.css">
<link rel="stylesheet"
	href="js/jquery-easyui-1.4.3/themes/default/easyui.css">
<script type="text/javascript"
	src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript"
	src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript"
	src="js/jquery-easyui-1.4.3/new_file.js"></script>
</head>
	<script type="text/javascript">
		layui.extend({
			admin: 'js/admin',
		});
		layui.use(['jquery', 'element','util', 'admin', 'carousel'], function() {
			var element = layui.element,
				$ = layui.jquery,
				carousel = layui.carousel,
				util = layui.util,
				admin = layui.admin;
			//建造实例
			carousel.render({
				elem: '.weadmin-shortcut'
				,width: '100%' //设置容器宽度				
				,arrow: 'none' //始终显示箭头	
				,trigger: 'hover'
				,autoplay:false
			});
			
			carousel.render({
				elem: '.weadmin-notice'
				,width: '100%' //设置容器宽度				
				,arrow: 'none' //始终显示箭头	
				,trigger: 'hover'
				,autoplay:true
			});
			
			$(function(){
				setTimeAgo(2018,0,1,13,14,0,'#firstTime');
				setTimeAgo(2018,2,28,16,0,0,'#lastTime');
			});
			function setTimeAgo(y, M, d, H, m, s,id){
			    var str = util.timeAgo(new Date(y, M||0, d||1, H||0, m||0, s||0));
			    $(id).html(str);
			    console.log(str);
			 };
		});
	</script>


<body>
<div class="weadmin-body">
			<blockquote class="layui-elem-quote">欢迎使用CRM管理系统</blockquote>
			<div class="layui-fluid" style="overflow: hidden;">
				<div class="layui-row layui-col-space15">
					<div class="layui-col-md8">
					<div id="main" style="height: 350px; width: 550px;">
					
					</div>
					<script type="text/javascript">
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'));

			// 指定图表的配置项和数据
			var option = {
				    title: {
				        text: '服务理念',
				        subtext: 'crm'
				    },
				    tooltip: {
				        trigger: 'item',
				        formatter: "{a} <br/>{b} : {c}%"
				    },
				    toolbox: {
				        feature: {
				        }
				    },
				    legend: {
				        data: ['服务','点击','访问','咨询','学生']
				    },
				    calculable: true,
				    series: [
				        {
				            name:'漏斗图',
				            type:'funnel',
				            left: '10%',
				            top: 60,
				            //x2: 80,
				            bottom: 60,
				            width: '80%',
				            // height: {totalHeight} - y - y2,
				            min: 0,
				            max: 100,
				            minSize: '0%',
				            maxSize: '100%',
				            sort: 'descending',
				            gap: 2,
				            label: {
				                show: true,
				                position: 'inside'
				            },
				            labelLine: {
				                length: 10,
				                lineStyle: {
				                    width: 1,
				                    type: 'solid'
				                }
				            },
				            itemStyle: {
				                borderColor: '#fff',
				                borderWidth: 1
				            },
				            emphasis: {
				                label: {
				                    fontSize: 20
				                }
				            },
				            data: [
				                {value: 60, name: '访问'},
				                {value: 40, name: '咨询'},
				                {value: 20, name: '学生'},
				                {value: 80, name: '点击'},
				                {value: 100, name: '服务'}
				            ]
				        }
				    ]
				};

			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option);
		</script>
					</div>
					<div class="layui-col-md4">
						<div class="layui-card">
						</div>
					</div>
				</div>
			</div>
			<div class="layui-col-lg12 layui-collapse" style="border: none;">
				<div class="layui-col-lg6 layui-col-md12">
					<!--统计信息展示-->
					<fieldset class="layui-elem-field" style="padding: 5px;">
						<!--<legend>信息统计</legend>-->
						<blockquote class="layui-elem-quote font16">信息统计</blockquote>
						<div class="">
							<table class="layui-table" lay-even>
								<thead>
									<tr>
										<th>统计</th>
										<th>资讯库</th>
										<th>图片库</th>
										<th>产品库</th>
										<th>用户</th>
										<th>管理员</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>总数</td>
										<td>92</td>
										<td>9</td>
										<td>0</td>
										<td>8</td>
										<td>20</td>
									</tr>
									<tr>
										<td>今日</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
									</tr>
									<tr>
										<td>昨日</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
									</tr>
									<tr>
										<td>本周</td>
										<td>2</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
									</tr>
									<tr>
										<td>本月</td>
										<td>2</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
									</tr>
								</tbody>
							</table>
							<table class="layui-table">
								<thead>
									<tr>
										<th colspan="2" scope="col">项目信息</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th width="30%">项目名</th>
										<td><span id="lbServerName">Web</span></td>
									</tr>
									<tr>
										<td>项目默认访问路径</td>
										<td>http://localhost:8080/Web/login</td>
									</tr>
									<tr>
										<td>服务器端口 </td>
										<td>8080</td>
									</tr>
									<tr>
										<td>项目创建时间 </td>
										<td id="firstTime">2019-04-28 13:14:00</td>
									</tr>
									<tr>
										<td>上次更新时间 </td>
										<td id="lastTime">1分钟</td>
									</tr>
								</tbody>
							</table>
						</div>
					</fieldset>
				</div>
				<div class="layui-col-lg6 layui-col-md12">
					<fieldset class="layui-elem-field we-changelog" style="padding: 5px;">
						<!--更新日志-->
						<blockquote class="layui-elem-quote font16">发展历程&amp;更新日志</blockquote>
						<ul class="layui-timeline" style="height: 560px; overflow-y: auto;">
							<li class="layui-timeline-item">
								<i class="layui-icon layui-timeline-axis">&#xe63f;</i>
								<div class="layui-timeline-content layui-text">
									<div class="layui-timeline-title">
										<h3>CRM项目</h3>
										<span class="layui-badge-rim">2019-05-09</span>
									</div>
									<ul>
										<li>创建数据库</li>
										<li>创建项目框架</li>
									</ul>
								</div>
							</li>
						</ul>
					</fieldset>
				</div>
			</div>
		</div>

</body>
</html>