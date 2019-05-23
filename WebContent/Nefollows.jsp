<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网络跟踪</title>
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
	$(function() {
		init();
	});
	
	function print(){
		$("#tt").datagrid("toExcel","测试导出.xls");
	}
	function init() {
		$("#tt").datagrid({
			url : 'NefollowsAll',
			method : 'post',
			pagination : true,
			singleSelect : true,
			toolbar : '#sousuo',
			queryParams : {
				nStudentName : $("#nStudentName").val(),
				nFollowTime : $("#nFollowTime").datebox('getValue'),
				nNextFollowTime : $("#nNextFollowTime").datebox('getValue'),
				nContent : $("#nContent").val(),
				nUserId1 : $("#nUserId").val(),
				nFollowType : $("#nFollowType").val(),
				nCreateTime : $("#nCreateTime").val(),
				nFollowState : $("#nFollowState").val(),
			}
		});
	}
	/*  查看所有*/
	function loginName(value, row, index) {
		return row.user.loginName;
	}
	/*按钮  */
	function formatterCaozuo(value, row, index) {
		return "<a href='javascript:void(0)' onclick='bianji("
				+ index
				+ ")'>编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:void(0)' onclick='chakan("
				+ index + ")'>查看</a>"
	}
	/*查看*/
	function chakan(index) {
      var data = $("#tt").datagrid('getData');
      var row = data.rows[index];
	$("#chakanNefollowform").form('load',row);
	$("#chakanNedollow").dialog("open");
	}
	/* 修改*/
	function bianji(index) {
		var data = $("#tt").datagrid('getData');
		var row = data.rows[index];
		$("#updateNefollowform").form('load', row);
		$("#updateNedollow").dialog("open");
	}
	/* 修改*/
	function saveupdateNefollow() {
		var nStudentName = $("#nStudentName1").val();
		var nFollowTime = $("#nFollowTime1").datebox('getValue');
		var nNextFollowTime = $("#nNextFollowTime1").datebox('getValue');
		var nContent = $("#nContent1").val();
		var nUserId = $("#nUserId1").val();
		var nFollowType = $("#nFollowType1").combobox('getValue');
		var nCreateTime = $("#nCreateTime1").datebox('getValue');
		var nFollowState = $("#nFollowState1").combobox('getValue');
		var nId = $("#nId").val();
		$.post("updateNefollows", {
			nStudentName : nStudentName,
			nFollowTime : nFollowTime,
			nNextFollowTime : nNextFollowTime,
			nContent : nContent,
			nUserId : nUserId,
			nFollowType : nFollowType,
			nCreateTime : nCreateTime,
			nFollowState : nFollowState,
			nId : nId
		}, function(res) {
			if (res > 0) {
				alert("成功");
				$("#updateNedollow").dialog("close");
				$("#tt").datagrid("load");
			} else {
				alert("失败");
				$("#updateNedollow").dialog("close");
				$("#tt").datagrid("load");
			}
		}, "json")
	}
	
	function shezhi() {
		$("#win").window("open");
	}
	
	function test(row) {//接受文本框this自身的所有的值
		var checked = $('p input:checkbox:checked');//获取p标签所有选中的复选框
		checked.each(function(i) {//依次存储到localStorage里面
			localStorage.setItem(i, this.value);
			localStorage.setItem('length', i);
		});
		console.log(localStorage.getItem('length'));//控制台输出
		if (row.checked == true) {
			$('#tt').datagrid('showColumn', row.value);//显示
		} else {
			$('#tt').datagrid('hideColumn', row.value);//隐藏
		}
	}

	$(function() {
		//取得本地存储的被选中checkbox的个数，循环将checkbox选中
		var length = localStorage.getItem('length');//获取localStorage数据
		for (var i = 0; i <= length; i++) {
			var a = localStorage.getItem(i);
			$("p input:checkbox[value=" + a + "]").attr("checked", "checked");//选中状态
		}
		var checked = $('p input:checkbox:not(:checked)');//获取所有未选中的复选框
		checked.each(function() {//遍历

			$('#tt').datagrid('hideColumn', this.value);//将没选中的列隐藏起来
		});
	});
</script>
<body>
	<table class="easyui-datagrid" id="tt">
		<thead>
			<tr>
				<!-- <th data-options="field:'sName',title:'学生名称' ,formatter:sName"></th> -->
				<th data-options="field:'checkbox',checkbox:true"></th>
				<th data-options="field:'nId',title:'跟踪学生编号  ' "></th>
				<th data-options="field:'nStudentName',title:'跟踪学生名称'   "></th>
				<th data-options="field:'nFollowTime',title:'跟踪时间'  "></th>
				<th data-options="field:'nNextFollowTime',title:'下次跟踪时间'      "></th>
				<th data-options="field:'nContent',title:'内容'      "></th>
				<th
					data-options="field:'loginName',title:'咨询师'   ,formatter:loginName"></th>
				<th data-options="field:'nFollowType',title:'咨询师跟踪方式'     "></th>
				<th data-options="field:'nCreateTime',title:'用户时间 '  "></th>
				<th data-options="field:'nFollowState',title:'跟踪状态 '"></th>
				<th
					data-options="field:'caozuo',title:'操作',formatter:formatterCaozuo"></th>
			</tr>
		</thead>
	</table>
	
	
	</div>
	<!-- 设置显示列 -->
	<div id="win" class="easyui-window" title="设置"
		style="width: 600px; height: 400px"
		data-options="iconCls:'icon-save',modal:true,closed:true">
		<p>
			<input type="checkbox" value="nId" onclick="test(this)" />跟踪学生编号 <input
			type="checkbox" value="nStudentName" onclick="test(this)" />跟踪学生名称
			<input type="checkbox" value="nFollowTime" onclick="test(this)" />跟踪时间
			<input type="checkbox" value="nNextFollowTime" onclick="test(this)" />跟踪学生名称
			<input type="checkbox" value="nContent" onclick="test(this)" />内容 <input
				type="checkbox" value="loginName" onclick="test(this)" />咨询师 <input
				type="checkbox" value="nFollowType" onclick="test(this)" />咨询师跟踪方式
			<input type="checkbox" value="nCreateTime" onclick="test(this)" />用户时间
			<input type="checkbox" value="nFollowState" onclick="test(this)" />跟踪状态
		</p>
	</div>
	<!--搜索-->
	<div id="sousuo">
		<!-- <!-- 11、sName  nStudentName跟踪学生名称 12、nFollowTime跟踪时间 13、下次跟踪时间 nNextFollowTime 
				14、跟踪方式 nFollowType 15、nFollowState 跟踪状态 -->
         		<form id="tb-frm" class="easyui-form">
			    <label for="name">跟踪学生名称:</label> <input class="easyui-validatebox"
				type="text" id="nStudentName" data-options="required:true" /> <label
				for="name">跟踪时间:</label> <input class="easyui-datebox" type="text"
				id="nFollowTime" data-options="required:true" /> <br> <label
				for="name">下次跟踪时间:</label> <input class="easyui-datebox" type="text"
				id="nNextFollowTime" data-options="required:true" /> <label
				for="name">跟踪方式:</label> <input class="easyui-validatebox"
				type="text" id="nFollowType" data-options="required:true" /> <label
				for="name">跟踪状态:</label> <input class="easyui-validatebox"
				type="text" id="nFollowState" data-options="required:true" /> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-search'" onclick="init()">搜索</a> <a
				id="btn" href="javascript:shezhi()" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit'">设置</a>
				
				<a
				 href="javascript:print()" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit'">导出</a>
		</form>
	</div>
	<!-- 修改的对话框 -->
	<div id="updateNedollow" class="easyui-dialog"
		data-options="modal:true,title:'修改',closed:true,fit:true,
			buttons:[{
				text:'保存',
				handler:function(){
					saveupdateNefollow();
				}
			},{
				text:'取消',
				handler:function(){
					closeupdateNefollow();
				}
			}]">
		<form class="easyui-form" id="updateNefollowform">
		<table cellpadding="5">

				<tr>
					<td><label for="sName"></label></td>
					<td><input type="hidden" id="nUserId1" name="nUserId" /></td>
					<td><input type="hidden" name="nId" id="nId" /></td>
					<td><input type="hidden" id="sId1" name="sId" /></td>
				</tr>
				<tr>
					<td><label>學生姓名:</label></td>
					<td><input class="easyui-textbox" type="text"
						id="nStudentName1" name="nStudentName" /></td>
					<td><label>跟踪时间:</label></td>
					<td><input class="easyui-datebox" type="text"
						id="nFollowTime1" name="nFollowTime" data-options="required:true" /></td>
					<td><label>下次跟踪时间:</label></td>
					<td><input class="easyui-datebox" type="text"
						id="nNextFollowTime1" name="nNextFollowTime"
						data-options="required:true" /></td>
					<td><label for="sName">内容:</label></td>
					<td><input class="easyui-textbox" type="text" id="nContent1"
						name="nContent" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="sName">跟踪方式:</label></td>
					<td><select id="nFollowType1" class="easyui-combobox"
						name="nFollowType1" style="width: 200px;">
							<option value="QQ">QQ</option>
							<option value="电话">电话</option>
							<option value="微信">微信</option>
					</select></td>


					<td><label for="sName">首访时间:</label></td>
					<td><input class="easyui-datebox" type="text"
						id="nCreateTime1" name="nCreateTime" data-options="required:true" /></td>

					<td><label for="sName">跟踪状态:</label></td>
					<td><select id="nFollowState1" class="easyui-combobox"
						name="nFollowState" style="width: 200px;">
							<option value="已跟踪">已跟踪</option>
							<option value="未跟踪">未跟踪</option>

					</select></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 查看 -->
	<div id="chakanNedollow" class="easyui-dialog"
		data-options="modal:true,title:'查看',closed:true,fit:true">
		<form class="easyui-form" id="chakanNefollowform">
			<table cellpadding="5">
				<tr>
					<td><label for="sName"></label></td>
					<td><input type="hidden" id="nUserId1" name="nUserId" /></td>
					<td><input type="hidden" name="nId" id="nId" /></td>
					<td><input type="hidden" id="sId1" name="sId" /></td>
				</tr>
				<tr>
					<td><label>學生姓名:</label></td>
					<td><input  disabled="disabled" class="easyui-textbox" type="text"
						id="nStudentName1" name="nStudentName" /></td>
					<td><label>跟踪时间:</label></td>
					<td><input disabled="disabled" class="easyui-datebox" type="text"
						id="nFollowTime1" name="nFollowTime" data-options="required:true" /></td>
					<td><label>下次跟踪时间:</label></td>
					<td><input  disabled="disabled" class="easyui-datebox" type="text"
						id="nNextFollowTime1" name="nNextFollowTime"
						data-options="required:true" /></td>
					<td><label for="sName">内容:</label></td>
					<td><input disabled="disabled" class="easyui-textbox" type="text" id="nContent1"
						name="nContent" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="sName">跟踪方式:</label></td>
					<td><input  disabled="disabled" class="easyui-datebox" type="text"
						id="nFollowType1" name="nFollowType" data-options="required:true" />
					</td>
					<td><label for="sName">首访时间:</label></td>
					<td><input  disabled="disabled" class="easyui-datebox" type="text"
						id="nCreateTime1" name="nCreateTime" data-options="required:true" />
					</td>
					<td><label for="sName">跟踪状态:</label></td>
					<td><input disabled="disabled" class="easyui-datebox" type="text"
				     id="nFollowState1" name="nFollowState" data-options="required:true" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>