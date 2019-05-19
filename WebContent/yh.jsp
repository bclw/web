<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户界面</title>
</head>
 <script type="text/javascript" src="js/global.js"></script>
<script type="text/javascript">
$(function(){
	init();
	$('#lockd').combo({    
	    multiple:true   
	});  
})
function init(){
	var lockd=$("#lockd").combobox('getValue');
	$("#dg").datagrid({
		url:"selectUsers",
		method:'post',
		singleSelect:true,
		pagination:true,
		 fitColumns:true, 
		toolbar:'#usertb',
		queryParams:{
			named:$("#named").val(),
			lockd:lockd,
			startTime:$("#startTime").datebox('getValue'),
			endTime:$("#endTime").datebox('getValue'),
			
		} 
	})
}


function formatterCasozuo(value,row,index){
	return "<a href='javascript:void(0)' onclick='updateUser("+index+")'>修改</a>   <a href='javascript:void(0)' onclick='delUser("+index+")'>删除</a>  <a href='javascript:void(0)' onclick='resetPs("+index+")'>重置密码</a>"

}

function formatterSuoding(value,row,index){
	return " <a href='javascript:void(0)' onclick='suoding("+index+")'>锁定用户</a>   <a href='javascript:void(0)' onclick='jiesuo("+index+")'>解锁用户</a> "
}




function formatterSuoDing(value,row,index){
		return value == 0 ? "已锁定" : "未锁定";
	
}



function suoding(index){
	var data=$("#dg").datagrid("getData");
	var row=data.rows[index];
	$.messager.confirm("提示","确认锁定么？",function(r){
		if(r){
			$.post("suodingUser",{
				uId : row.uId
			},function(res){
				if(res>0){
					$("#dg").datagrid("reload");
					$.messager.alert("提示","已锁定");
					
				}else{
					//删除失败
					$.messager.alert("提示","锁定失败");
				}
			},"json")
			
		}
	})
	
}



function jiesuo(index){
	var data=$("#dg").datagrid("getData");
	var row=data.rows[index];
	$.messager.confirm("提示","确认解锁么？",function(r){
		if(r){
			$.post("jiesuoUser",{
				uId : row.uId
			},function(res){
				if(res>0){
					$("#dg").datagrid("reload");
					$.messager.alert("提示","已解锁");
					
				}else{
					//删除失败
					$.messager.alert("提示","解锁失败");
				}
			},"json")
			
		}
	})
}



//重置密码
function resetPs(index){
	var data=$("#dg").datagrid("getData");
	var row=data.rows[index];
	
	$.messager.confirm("提示","确认重置密码么？",function(r){
		if(r){
			$.post("resetPsd",{
				uId : row.uId
			},function(res){
				if(res>0){
					$("#dg").datagrid("reload");
					$.messager.alert("提示","重置成功");
					
				}else{
					//删除失败
					$.messager.alert("提示","重置失败");
				}
			},"json")
			
		}
	})
	
}





//添加
function insert(){
	$("#insertdialog").dialog("open")
}
function saveInsert(){
	$.post("insertUser",{
		loginName:$("#loginName").val(),
		password:$("#password").val(),
		mTel:$("#mTel").val(),
		eMail:$("#eMail").val(),
	},function(res){
		if(res>0){
			//添加成功
			$("#dg").datagrid("reload");
			$("#insertdialog").dialog("close")
			$.messager.alert("提示","添加成功");
		}else{
			//添加失败
			
			$.messager.alert("提示","添加失败");
		}
		
	},"json")
}


function closeInfo(){
	$("#insertdialog").dialog("close");
	$("#updatedialog").dialog("close");
}


function delUser(index){
	var data=$("#dg").datagrid("getData");
	var row=data.rows[index];
	
	$.messager.confirm("提示","确认删除么？",function(r){
		if(r){
			$.post("deleteUser",{
				uId : row.uId
			},function(res){
				if(res>0){
					//删除成功
					$("#dg").datagrid("reload");
					$.messager.alert("提示","删除成功");
					
				}else{
					//删除失败
					$.messager.alert("提示","删除失败");
				}
			},"json")
			
		}
	})
	
}




//修改
function updateUser(index) {
	var datas=$("#dg").datagrid("getData");
	var row=datas.rows[index];
	//填充表单
	$("#updatefrm").form("load",row)
	//打开弹窗
	$("#updatedialog").dialog("open");
}

function saveUpdate() {
	$.post("updateUser",{
		uId:$("#uId1").val(),
		loginName:$("#loginName1").val(),
		mTel:$("#mTel1").val(),
		eMail:$("#eMail1").val(),
	},function(res){
		if(res>0){
			$("#dg").datagrid("reload");
			$("#updatedialog").dialog("close");
			alert("修改成功！！");
		}else{
			alert("修改失败");
		}
		
	},"json");
}








	/* 角色设置 */
	/*格式化函数*/
	function formatterRole(value,row,index){
		return "<a href='javascript:void(0)' onclick='setUserRole("+index+")'>设置</a>"
	}
     var row;
	function setUserRole(index){
		//获取用户信息
		 row=$("#dg").datagrid("getSelected");
		//获取所有的角色信息
		$("#allrole").datagrid({
			url:"selectRoles",
			method:'post',
		})
	
	//获取当前选中的的用户角色的信息
	 $("#myrole").datagrid({
		url:"selectUserRoles",
		queryParams:{
			id:row.uId
		}
	}) 
	//打开弹窗
	$("#setRole_window").window("setTitle","设置"+row.loginName+"角色信息")
	$("#setRole_window").window("open");
	}
	
	
	
	
	
	/*新增用户角色*/
	 function addUserRole(){
		//获取用户信息
		var userRow=$("#dg").datagrid("getSelected");
		//获取角色id
		var roleRow=$("#allrole").datagrid("getSelected");
		alert(roleRow.roleId)
		alert(userRow.uId)
		if(roleRow){
			$.post("inserUserRoles",{
				userId:userRow.uId,
				roleId:roleRow.rId
			},function(res){
				if(res>0){
					$("#myrole").datagrid("reload");
				}else{
					$.messager.alert("提示","角色设置失败")
				}
			},"json")
		}else{
			$.messager.alert("提示","请先选择角色！！")
		}
	} 
	
	
	/*删除用户角色*/
 	function deleteUserRole(index){
		//获取用户信息（点）
		var userRow=$("#dg").datagrid("getSelected");
		//获取角色id
		var roleRow=$("#myrole").datagrid('getSelected');
		console.log(roleRow);
		if(roleRow){
			$.post("deleteUserRoles",{
				roleId:roleRow.rId,
			},function(res){
				if(res>0){
					$.messager.alert("提示","角色设置成功")
					$("#myrole").datagrid("reload");
				}else{
					$.messager.alert("提示","角色设置失败")
				}
			},"json")
		}else{
			$.messager.alert("提示","请先选择角色！！")
		}
	} 
	
</script>

<body>
		<table name="center" class="easyui-datagrid" id="dg" title="用户列表" >
			<thead>
				<tr>
					<th data-options="field:'uId',hidden:true">用户ID</th>
					<th data-options="field:'loginName'">用户名</th>
					<th data-options="field:'password'">密码</th>
					<th data-options="field:'eMail'">邮箱</th>
					<th data-options="field:'mTel'">手机号</th>
					<th data-options="field:'isLockOut',formatter:formatterSuoDing">是否锁定</th>
					<th data-options="field:'createTime'">创建时间</th>
					<th data-options="field:'lastLoginTime'">最后登录的时间</th>
					<th data-options="field:'setdao',formatter:formatterCasozuo">操作</th>
					<th data-options="field:'caozuo',formatter:formatterSuoding">用户操作</th>
					<th data-options="field:'setrole',formatter:formatterRole">角色设置</th>
				</tr>
			</thead>
		</table>

		<div id="usertb" style="padding:5px; height:auto">
			<form>
				<label for="name">named:</label>   
	        	<input class="easyui-validatebox" type="text" id="named" />
	        	
	        	
	        		状态：<select id="lockd" name="lockd" class="easyui-combobox" >
							<option value="">--请选择--</option>
							<option value="1">未锁定</option>
							<option value="0">已锁定</option>
					</select> 
	        	

	        	
	        	<label for="name">startTime:</label>   
	        	<input  class= "easyui-datebox" type="text" id="startTime" />
	        	<label for="name">endTime:</label>   
	        	<input  class= "easyui-datebox" type="text" id="endTime"/>   
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="init()" data-options="iconCls:'icon-search'">搜索</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="insert()" data-options="iconCls:'icon-add'">新增</a>
			</form>
		</div> 
	<!--添加的对话框  -->
	<div  id="insertdialog" class="easyui-dialog" data-options="modal:true,closed:true,buttons:[
	{
	text:'保存',
	handler:function(){
		saveInsert();
		}
	},{
	text:'取消',
	handler:function(){
		closeInfo();
		}
	}
	]">
		<form id="insertfrm" class="easyui-form">
			 <label for="name">登录名字:</label>   
	          <input class="easyui-validatebox" name="loginName" type="text" id="loginName" data-options="required:true" /> 
	          <br>
	          <label for="name">密码:</label>   
	          <input class="easyui-validatebox" name="password" type="text" id="password" data-options="required:true" /> 
	          <br>
	         <label for="name">电话:</label>   
	          <input class="easyui-validatebox" name="mTel" type="text" id="mTel" data-options="required:true" />
			<br>
			 <label for="name">邮箱:</label>   
	          <input class="easyui-validatebox" name="eMail" type="text" id="eMail" data-options="required:true" />
			<br>
			
		</form>
	</div>
	<!--修改的对话框  -->
	<div  id="updatedialog" class="easyui-dialog" data-options="modal:true,closed:true,buttons:[
	{
	text:'保存',
	handler:function(){
		saveUpdate();
		}
	},{
	text:'取消',
	handler:function(){
		closeInfo();
		}
	}
	]">
		<form id="updatefrm" class="easyui-form">
			 <label for="name">编号:</label>   
	          <input class="easyui-validatebox" name="uId" type="text" id="uId1" data-options="required:true" /> 
	          <br>
			 <label for="name">登录名字:</label>   
	          <input class="easyui-validatebox" name="loginName" type="text" id="loginName1" data-options="required:true" /> 
	          <br>
	         <label for="name">电话:</label>   
	          <input class="easyui-validatebox" name="mTel" type="text" id="mTel1" data-options="required:true" />
			<br>
			 <label for="name">邮箱:</label>   
	          <input class="easyui-validatebox" name="eMail" type="text" id="eMail1" data-options="required:true" />
			<br>
			
		</form>
	</div>
		
		<!--角色设置窗口-->
		
		<div id="setRole_window" class="easyui-window"  data-options="modal:true,closed:true" style="width:500px;height:550px;padding:10px;">
			<table>
				<tr>
					<td width="200px">
						展示所有的角色
						<table title="所有的角色" id="allrole" class="easyui-datagrid" data-options="rownumbers:true,singleSelect:true,method:'post',fitColumns:true">
							<thead>
								<tr>
									<th data-options="field:'id',width:280,hidden:true">用户ID</th>
									<th data-options="field:'rName',width:100">用户名</th> 
								</tr>
							</thead>
						</table>
					</td>
					<td width="100px">
						<input type="button" value=">>" onclick="addUserRole()" />
						<input type="button" value="<<" onclick="deleteUserRole()" />
					</td>
					<td width="200px" valign="top">
						展示当前用户的角色
						<table title="用户的角色" id="myrole" class="easyui-datagrid" data-options="rownumbers:true,singleSelect:true,method:'post',fitColumns:true">
							<thead>
								<tr>
									 <th data-options="field:'rId',width:280,hidden:true">用户ID</th>
									<th data-options="field:'rName',width:100">用户名</th> 
								  
								</tr>
							</thead>
						</table>
					</td>
				</tr>
			</table>
		</div>
		

		
</body>
</html>



</body>
</html>