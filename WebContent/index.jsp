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
<body>
  <div class="easyui-layout"  data-options="fit:true" >
		<div data-options="region:'north'" style="height: 50px">
			<h2 style="text-align: center;">
					欢迎<a href="javascript:void(0)" onclick="chakan()" ><%=session.getAttribute("name") %></a>登陆<a href="javascript:void(0)" onclick="exit()" >(退出)</a>
					&nbsp;&nbsp;&nbsp;<input  class="easyui-linkbutton" style=" height:30px;width:50px"  id="change" 
					 type="button" value="<%=session.getAttribute("ext") %>"/>
					&nbsp;&nbsp;&nbsp;  <a href="javascript:void(0)"onclick="change()" >签到</a> 
				  &nbsp;&nbsp;&nbsp;  <a href="javascript:void(0)" onclick="qiantui()" >签退</a>  
				
				</h2>
		</div>
		
		<div id="mm" class="easyui-menu" style="width: 120px;">
					<div onclick="removed()" data-options="iconCls:'icon-clear'">安全退出</div>
		</div>
		<div id="cc" class="easyui-menu" style="width: 120px;">
					<div onclick="message()" data-options="iconCls:'icon-clear'">我的信息</div>
					<div onclick="password()" data-options="iconCls:'icon-clear'">修改密码</div>
		</div>
		<div data-options="region:'west',split:true" title="导航应用" style="width: 150px;height:100%">
			<div id="menuTree">
				<ul id="tt" class="easyui-tree" fit="true" data-options="iconCls:'icon-save'" ></ul>
			</div>
		</div>
		<div id="centerTabs" data-options="region:'center',iconCls:'icon-ok'" >
			<div id="tta" class="easyui-tabs" style="height:600px"></div>
		</div>
	</div>  
	
<div id="win" class="easyui-window" title="My Window" style="width:600px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,closed:true"> 
    <input style="display: none" type="test" id="uId" name="uId"  value="<%=session.getAttribute("id") %> "  /> <br>  
   姓名： <input type="test" id="loginName" name="loginName"  value="<%=session.getAttribute("name") %> "  /> <br>
   邮箱： <input type="test"  id="eMail" name="eMail"  value="<%=session.getAttribute("em") %> "  />  <br>  
   电话： <input type="test" id="mTel" name="mTel"  value="<%=session.getAttribute("tel") %> "  /> <br> 
   签到： <input type="test"  id="uExt" name="uExt" value="<%=session.getAttribute("ext") %> "  /> <br>
   <input type="button" onclick="save()" value="保存"/>     
</div>  
	<div id="password" class="easyui-window" title="My Window" style="width:600px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,closed:true"> 
    <input style="display: none" type="test" id="uId" name="uId"  value="<%=session.getAttribute("id") %> "  /> <br>  
  请输入原密码 ： <input type="test" id="old" name="old"   "  /> <br>
  请输入新密码： <input type="test"  id="new" name="new"   "  />  <br>  
  请确认密码：     <input type="test" id="news" name="news"  "  /> <br> 
   <input type="button" onclick="submit()" value="保存"/>     
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
	function message(){
		
		$('#win').window('open'); 
	}
			function chakan() {
				$('#cc').menu('show', {
					left : 650,
					top : 60
				});
			}
			function exit() {
				$('#mm').menu('show', {
					left : 650,
					top : 60
				});
			}
			function change(){
				$.post("updateQiandao",{
					uId:$("#uId").val(),
					uExt:$("#change").val(),
				},function(res){
					if(res>0){
						window.location.reload();
						//$("#win").window("close");
						alert("签到成功！！");
						
					}else{
							alert("今天已签过到了")
					}
					
				},"json");
			
				
			}
			function qiantui(){
				alert(2)
				$.post("updateQiantui",{
					uId:$("#uId").val(),
					uExt:$("#change").val(),
				},function(res){
					if(res>0){
						window.location.reload();
						//$("#win").window("close");
						alert("签退成功！！");
						
					}else{
						
							alert("今天已签过退了")
						
						
					}
					
				},"json");
			
				
			}
			function save() {
				alert(123)
				$.post("updateMessage",{
					uId:$("#uId").val(),
					loginName:$("#loginName").val(),
					eMail:$("#eMail").val(),
					mTel:$("#mTel").val(),
					uExt:$("#uExt").val(),
				},function(res){
					if(res>0){
						window.location.reload();
						$("#win").window("close");
						alert("保存成功！！");
					}else{
						alert("保存失败");
					}
					
				},"json");
			}
			
			function password(){
				$("#password").window("open")
			}
			 function submit() {
			   var id="<%=session.getAttribute("id")%>"
			   var oldPsd=$("#old").val(); 
			   var newPsd=$("#new").val();
			   var newsPsd=$("#news").val();
			   
			   $.post("updateUserPassword", {
				   oldPsd:oldPsd,
				   newPsd : newPsd,
				   id : id
				}, function(res) {
					if (res > 0) {
						//修改成功
						$.messager.alert("提示", "修改成功");
						
				 		//清除session
						$.post("drop",{},function(res){
							if(res==true){
							}
						})
						$.post("session",{},function(res){
							if(res==true){
							}
						})
						window.location.reload();
						if(newPassword!="" && newPassword!=null &&newPassword==trueNewPassword){
						
						}else{
							$.messager.alert("提示", "两次密码不一致");
							}	
						
				}else if(res<0){
					$.messager.alert("提示", "原密码不正确");
				}else{
					$.messager.alert("提示", "修改失败");
				} 
						
				},'json');
			   }

			 function closed() {
				 $("#UpdateWin").window("close")
			}
			function removed() {
				$.messager.confirm('提示', '您想要退出该系统吗？', function(res) {
					if (res) {
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