<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
 <script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/icon.css">
<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/default/easyui.css"> 
<!-- <script src="js/global.js"></script> -->



</style>


<body>

  <div class="easyui-layout"  data-options="fit:true" >
		<div data-options="region:'north'" style="height: 100px">
			<h2 style="text-align: center;">
					欢迎登陆<a href="javascript:void(0)" onclick="exit()" >(退出)</a>
				</h2>
				
				
		</div>
		
		<div id="mm" class="easyui-menu" style="width: 120px;">
					<div onclick="removed()" data-options="iconCls:'icon-clear'">安全退出</div>
		</div>
		<div data-options="region:'west',split:true" title="导航应用" style="width: 150px;height:100%">
			<div id="menuTree">
				<ul id="tt" class="easyui-tree" fit="true" data-options="iconCls:'icon-save'" ></ul>
			</div>
		</div>
		<div id="centerTabs" data-options="region:'center',iconCls:'icon-ok'" >
			<div id="tta" class="easyui-tabs" style="height:700px"></div>
		</div>
	</div>  
	

	
	
</body>
  <script type="text/javascript">
	$(function() {
		$('#tt').tree({
			url : 'getPage',
			method : "POST",
			animate : true,
			lines : true,
			onClick : function(node) {
				var flag = $("#tta").tabs('exists',node.text);
				var isLeaf = $('#tt').tree('isLeaf', node.target); //是否是叶子节点
				if(isLeaf) { //只有叶子节点才会在选项卡中创建选项页（每个选项页对应1个功能）
					if(!flag) {
						var root = $('#tt').tree('getParent',node.target)
						if (root != null) {
						$('#tta').tabs('add', { //在选项卡中，创建1个选项页
							title: node.text, //选项卡中，选项页的标题（在同一个选项卡中，选项页需要保持一致）。
							closable: true,
							fit: true,
							content: "<iframe style='width:100%;height:100%' src='"+node.mPath+".jsp'/>" //此处做了调整，推荐使用iframe的方式实现
						});
						}
					} else {
						$("#tta").tabs('select', node.text); //直接选中title对应的选项卡
					}
				}
			}
		})
	})
			
			function exit() {
				$('#mm').menu('show', {
					left : 650,
					top : 60
				});
			}

			function removed() {
				$.messager.confirm('提示', '您想要退出该系统吗？', function(r) {
					if (r) {
						$.post("logout", {}, function(res) {
							if (res > 0) {
								$.messager.alert("提示", "已安全退出");
								window.location.href = "login.jsp";
							}
						}, "json")
					}
				});
			}
		</script> 



</body>
</html>