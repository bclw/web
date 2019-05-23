<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
 <script type="text/javascript" src="js/global.js"></script>
<script type="text/javascript">

$(function(){
	init();
})
function init(){
	$("#dg").datagrid({
		url:"aa",
		method:'post',
		singleSelect:true,
		pagination:true,
		fitColumns:true,
		toolbar:'#rolestb',
		queryParams:{
			rName:$("#rName").val(),
			
		} 
	})
}

function formatterCasozuo(value,row,index){
	return "<a href='javascript:void(0)' onclick='updateRoles("+index+")'>修改</a>   <a href='javascript:void(0)' onclick='delRoles("+index+")'>删除</a>"

}


//添加
function insert(){
	$("#insertdialog").dialog("open")
}
function saveInsert(){
	$.post("insertRoles",{
		rName:$("#rName").val(),
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


 function delRoles(index){
	var data=$("#dg").datagrid("getData");
	var row=data.rows[index];
	$.messager.confirm('确认', '您想要删除:'+row.rName+'该角色吗？',function(r){
		if(r){
			$.post("deleteRoles",{
				rId : row.rId
			},function(res){
				if(res>0){
					//删除成功
					$("#dg").datagrid("reload");
					$.messager.alert("提示","删除成功"); 
					/* $.messager.alert({
						title:'提示信息',
						msg:res.message
					}); */
					
				}else{
					//删除失败
					 $.messager.alert("提示","删除失败"); 
					/* $.messager.alert({
						title:'提示信息',
						msg:res.message
					}); */
				}
			},"json")
			
		}
	})
	
} 






//修改
function updateRoles(index) {
	var datas=$("#dg").datagrid("getData");
	var row=datas.rows[index];
	//填充表单
	$("#updatefrm").form("load",row)
	//打开弹窗
	$("#updatedialog").dialog("open");
}

function saveUpdate() {
	$.post("updateRoles",{
		rId:$("#rId1").val(),
		rName:$("#rName1").val(),
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








/* 权限设置 */
/*格式化函数*/
function formatterModules(value,row,index){
	return "<a href='javascript:void(0)' onclick='setRoleModules("+index+")'>设置</a>"
}

function setRoleModules(index){
	//获取角色信息
	var row=$("#dg").datagrid("getSelected");
	//
	var modulesRow=$("#allmodules").datagrid("getSelected");
	//获取所有的模块信息
	$("#allmodules").datagrid({
		url:"selectModules",
		method:'post',
		queryParams:{
			rId :row.rId
		}
	})
	/* } */

//获取当前选中的的角色模块的信息
 $("#mymodules").datagrid({
	url:"selectRoleModules",
	queryParams:{
		rId :row.rId
	}
}) 
//打开弹窗
$("#setModules_window").window("setTitle","设置"+row.rName+"模块信息")
$("#setModules_window").window("open");
}





/*新增角色模块*/
 function addModules(){
	//获取角色信息
	var roleRow=$("#dg").datagrid("getSelected");
	//获取模块id
	var modulesRow=$("#allmodules").datagrid("getSelected");
	
	
	if(modulesRow){
		$.post("insertRoleModules",{
			moduleId:modulesRow.mId,
			roleId:roleRow.rId
		},function(res){
			if(res>0){
				$.messager.alert("提示","模块设置成功")
				$("#mymodules").datagrid("reload");
			}else{
				$.messager.alert("提示","模块设置失败")
			}
		},"json")
	}else{
		$.messager.alert("提示","请先选择模块！！")
	}
} 


/*删除角色模块*/
	function deleteRoleModules(){
	//获取角色信息（点）
	var roleRow=$("#dg").datagrid("getSelected");
	//获取模块id
	var modulesRow=$("#mymodules").datagrid("getSelected");
	
	
	if(modulesRow){
		$.post("deleteRoleModules",{
			moduleId:modulesRow.mId,
		},function(res){
			if(res>0){
				$.messager.alert("提示","模块设置成功")
				$("#mymodules").datagrid("reload");
			}else{
				$.messager.alert("提示","模块设置失败")
			}
		},"json")
	}else{
		$.messager.alert("提示","请先选择模块！！")
	}
} 

</script>
</head>
<body>
<table name="center" class="easyui-datagrid" id="dg" title="角色列表" >
			<thead>
				<tr>
					<th data-options="field:'rId'">用户ID</th>
					<th data-options="field:'rName'">用户名</th>
					<th data-options="field:'setdao',formatter:formatterCasozuo">操作</th>
					<th data-options="field:'setrole',formatter:formatterModules">模块设置</th>
				</tr>
			</thead>
		</table>

		<div id="rolestb" style="padding:5px; height:auto">
			<form>
				<label for="name">rName:</label>   
	        	<input class="easyui-validatebox" type="text" id="named" />
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
			 <label for="name">角色名字:</label>   
	          <input class="easyui-validatebox" name="rName" type="text" id="rName" data-options="required:true" /> 
			
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
	          <input class="easyui-validatebox" name="rId" type="text" id="rId1" data-options="required:true" disabled="disabled"/> 
	          <br>
			 <label for="name">角色名:</label>   
	          <input class="easyui-validatebox" name="rName" type="text" id="rName1" data-options="required:true" /> 
	          <br>
			
		</form>
	</div>
		





<!--模块设置窗口-->
		<div id="setModules_window" class="easyui-window"  data-options="modal:true,closed:true" style="width:500px;height:550px;padding:10px;">
			<table>
				<tr>
					<td width="200px">
						展示该角色没有的模块
						<table title="未予的模块" id="allmodules" class="easyui-datagrid" data-options="rownumbers:true,singleSelect:true,method:'post',fitColumns:true">
							<thead>
								<tr>
									<th data-options="field:'mId',width:280,hidden:true">模块ID</th>
									<th data-options="field:'mName',width:100">模块名</th> 
								</tr>
							</thead>
						</table>
					</td>
					<td width="100px">
						<input type="button" value=">>" onclick="addModules()" />
						<input type="button" value="<<" onclick="deleteRoleModules()" />
					</td>
					<td width="200px" valign="top">
						展示当前角色的模块
						<table title="角色的模块" id="mymodules" class="easyui-datagrid" data-options="rownumbers:true,singleSelect:true,method:'post',fitColumns:true">
							<thead>
								<tr>
									 <th data-options="field:'mId',width:280,hidden:true" >模块ID</th>
									<th data-options="field:'mName',width:100">模块名称</th> 
								</tr>
							</thead>
						</table>
					</td>
				</tr>
			</table>
		</div>
		


</body>
</html>