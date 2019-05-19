<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
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
<script type="text/javascript">

	$(function() {
		init();

	});
	
	function print(){
		$("#tt").datagrid("toExcel","测试导出.xls");
	}
	function formatterCaozuo(value, row, index) {
		return "<a href='javascript:void(0)' onclick='bianji("
				+ index
				+ ")'>编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:void(0)' onclick='chakan("
				+ index
				+ ")'>查看</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:void(0)' onclick='tianjia("
				+ index + ")'>跟踪</a> "
	}

	/*添加打开弹窗insetNefolls*/
	function tianjia(index) {
		var data = $("#tt").datagrid('getData');
		var row = data.rows[index];
		$("#insetNe").form('load', row);
		$("#insetNefolls").dialog("open");
	}
	function saveNefolls() {
		var nStudentId = $("#nStudentId").val();
		var nStudentName = $("#nStudentName").val();
		var nFollowTime = $("#nFollowTime").datetimebox('getValue');
		var nNextFollowTime = $("#nNextFollowTime").datetimebox('getValue');
		var nContent = $("#nContent").val();
		var nUserId = $("#nUserId").val();
		var nFollowType = $("#nFollowType").val();
		var nCreateTime = $("#nCreateTime").datetimebox('getValue');
		var nFollowState = $("#nFollowState").val();
		$.ajax({
			type : "post",
			url : "Nefollows",
			data : {
				nStudentId : nStudentId,
				nStudentName : nStudentName,
				nFollowTime : nFollowTime,
				nNextFollowTime : nNextFollowTime,
				nContent : nContent,
				nUserId : nUserId,
				nFollowType : nFollowType,
				nCreateTime : nCreateTime,
				nFollowState : nFollowState,
			},
			success : function(res) {
				if (res) {
					alert("添加成功");
					$("#insetNefolls").dialog("close");
					$("#tt").datagrid("reload");
				} else {
					alert("添加失败");
				}
			}
		}, "json")
	}
	/*添加失败*/
	function closeNefolls() {
		$("#insetNe").dialog("close");
	}

	//显示所有
	function chakan(index) {
		var data = $("#tt").datagrid('getData');
		var row = data.rows[index];
		/*是否回访 */
		if (row.sIsValid == 1) {
			row.sIsValid = "回访";
		} else {
			row.sIsValid = "不回";
		}
		/*是否缴费  */
		if (row.sIsPay == 1) {
			row.sIsPay = "已缴费";
		} else {
			row.sIsPay = "未缴费";
		}
		/*是否有效 */
		if (row.sPhone == 1) {
			row.sPhone = "有效";
		} else {
			row.sPhone = "无效";
		}
		/* 是否上门 */
		if (row.sIsReturnVist == 1) {
			row.sIsReturnVist = "已上门";
		} else {
			row.sIsReturnVist = "未上门";
		}
		/* 是否退费（是，否） */
		if (row.sPayTime == 1) {
			row.sPayTime = "是退费";
		} else {
			row.sPayTime = "否退费";
		}
		/* 是否进班 */
		if (row.sIsInClass == 1) {
			row.sIsInClass = "是进班";
		} else {
			row.sIsInClass = "否进班";
		}

		$("#chakanA").form('load', row);
		$("#chakanAskers").dialog("open");
	}
	function init() {
		$("#tt").datagrid({
			url : 'Askers',
			method : 'post',
			pagination : true,
			toolbar : '#bar',
			queryParams : {
				askerName : $("#askerName").val(),
				sIsPay : $("#sIsPay").combobox('getValue'),
				sIsValid : $("#sIsValid1").combobox('getValue'),
				sId : $("#sId").val(),
				sName : $("#sName").val(),
				sAge : $("#sAge").val(),
				sSex : $("#sSex").val(),
				sPhone : $("#sPhone").val(),
				sStuState : $("#sStuState").val(),
				sState : $("#sState").val(),
				sMsgSource : $("#sMsgSource").val(),
				sSourceUrl : $("#sSourceUrl").val(),
				sSourceKeyWord : $("#sSourceKeyWord").val(),
				sNetPusherId : $("#sNetPusherId").val(),
				sStuConcern : $("#sStuConcern").val(),
				sContent : $("#sContent").val(),
				sQQ : $("#sQQ").val(),
				sWeiXin : $("#sWeiXin").val(),
				sIsBaoBei : $("#sIsBaoBei").val(),
				askerName : $("#askerName").val(),
				sCreateUserId : $("#sCreateUserId").val(),
			}
		});
	}
	/*  查看所有*/
	function askerName(value, row, index) {
		return row.askers.askerName;
	}
	/*  搜索*/
	function sIsPay(value, row, index) {
		if (row.sIsPay == 1) {
			return "已缴费";
		} else {
			return "未缴费";
		}
	}

	function sSex(value, row, index) {
		if (row.sSex == 1) {
			return "男";
		} else {
			return "女";
		}
	}

	function sIsValid(value, row, index) {
		if (row.sIsValid == 0) {
			return "无效";
		} else {
			return "有效";
		}
	}

	function sIsBaoBei(value, row, index) {
		if (row.sIsBaoBei == 0) {
			return "不报备";
		} else {
			return "报备";
		}
	}

	/*查看  */

	/* 修改*/
	function bianji(index) {
		var data = $("#tt").datagrid('getData');
		var row = data.rows[index];
		$("#frm").form('load', row);
		$("#updateAskers").dialog("open");
	}
	/* 修改*/
	function saveEdit() {
		var sId = $("#sId1").val();
		var sName = $("#sName1").val();
		var sLearnForward = $("#sLearnForward1").val();
		var sRecord = $("#sRecord1").val();
		var sStuState = $("#sStuState1").val();
		var sPhone = $("#sPhone").val();
		var sIsValid = $("#sIsValid1").val();
		var sLostValid = $("#sLostValid1").val();
		var sIsReturnVist = $("#sIsReturnVist1").val();
		var sFirstVisitTime = $("#sFirstVisitTime1").val();
		var sIsHome = $("#sIsHome1").val();
		var sHomeTime = $("#sHomeTime1").val();
		var sIsPay = $("sIsPay1").val();
		var sMoney = $("sMoney1").val();
		var sIsReturnMoney = $("sIsReturnMoney1").val();
		var sPayTime = $("sPayTime1").val();
		var sReturnMoneyReason = $("sReturnMoneyReason1").val();
		var sIsInClass = $("sIsInClass1").val();
		var sInClassContent = $("sInClassContent1").val();
		var sIsBaoBei = $("sIsBaoBei1").val();
		var sZiXunId = $("sZiXunId1").val();
		$.post("updateStudent", {
			sId : sId,
			sName : sName,
			sLearnForward : sLearnForward,
			sRecord : sRecord,
			sStuState : sStuState,
			sPhone : sPhone,
			sIsValid : sIsValid,
			sLostValid : sLostValid,
			sIsReturnVist : sIsReturnVist,
			sFirstVisitTime : sFirstVisitTime,
			sIsHome : sIsHome,
			sHomeTime : sHomeTime,
			sIsPay : sIsPay,
			sMoney : sMoney,
			sIsReturnMoney : sIsReturnMoney,
			sReturnMoneyReason : sReturnMoneyReason,
			sIsInClass : sIsInClass,
			sInClassContent : sInClassContent,
			sIsBaoBei : sIsBaoBei,
			sZiXunId : sZiXunId,
		}, function(res) {
			if (res > 0) {
				alert("成功");
				$("#updateAskers").dialog("close");
				$("#tt").datagrid("load");
			} else {
				alert("失败");
				$("#updateAskers").dialog("close");
				$("#tt").datagrid("load");
			}
		}, "json")
	}

	
	
	
	function shezhi() {
		$("#win").window("open");
	}

	/*设置显示列*/
	/* https://blog.csdn.net/qq_29498555/article/details/80050710 */
	//这个特性主要是用来作为本地存储来使用的，解决了cookie存储空间不足的问题(cookie中每条cookie的存储空间为4k)，localStorage中一般浏览器支持的是5M大小，这个在不同的浏览器中localStorage会有所不同。
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

	$(function() {
		var b = $("#time option:checked").val();

	})
	$(function() {//下拉框高度自适应
		$('.easyui-combobox').combobox({
			// 定义用户是否可以直接输入文本到字段中。
			editable : false,
			// 自适应高度。
			panelHeight : 'auto',
			// 设置需要固定的高度(适用于1.4或以上版本)。
			panelMaxHeight : 154
		});
	})
</script>
<body>
<body>
	<table class="easyui-datagrid" id="tt" data-options="toolbar:'#sousuo'">
		<thead>
			<tr>
				<th data-options="field:'checkbox',checkbox:true"></th>
				<th data-options="field:'askerName',title:'咨询师',formatter:askerName"></th>
				<!-- <th data-options="field:'sId',title:'sId'"></th> -->
				<th data-options="field:'sName',title:'姓名'"></th>
				<th data-options="field:'sAge',title:'年龄'      "></th>
				<th data-options="field:'sSex',title:'性别 '  ,formatter:sSex"></th>
				<th data-options="field:'sPhone',title:'电话'"></th>
				<th data-options="field:'sStuState',title:'学历'"></th>
				<th data-options="field:'sIsPay',title:'是否缴费' ,formatter:sIsPay"></th>
				<th data-options="field:'sIsValid',title:'是否有效' ,formatter:sIsValid"></th>
				<th data-options="field:'sState',title:'状态'"></th>
				<th data-options="field:'sMsgSource',title:'来源渠道'"></th>
				<th data-options="field:'sSourceUrl',title:'来源网站'"></th>
				<th data-options="field:'sSourceKeyWord',title:'来源关键词'"></th>
				<th data-options="field:'sNetPusherId',title:'所在区域'"></th>
				<th data-options="field:'sStuConcern',title:'学员关注'"></th>
				<th data-options="field:'sContent',title:'来源部门'"></th>
				<th data-options="field:'sQQ',title:'学员QQ'"></th>
				<th data-options="field:'sWeiXin',title:'微信号'"></th>
				<th
					data-options="field:'sIsBaoBei',title:'是否报备 '  ,formatter:sIsBaoBei "></th>
				<!-- <th data-options="field:'sCreateUserId',title:'录入人'"></th> -->
				<th
					data-options="field:'caozuo',title:'操作',formatter:formatterCaozuo"></th>
			</tr>
		</thead>
	</table>
	<div id="win" class="easyui-window" title="设置"
		style="width: 600px; height: 400px"
		data-options="iconCls:'icon-save',modal:true,closed:true">
		<p>
			<input type="checkbox" value="askerName" onclick="test(this)" />咨询师
			<!-- <input type="checkbox"  value="sId" onclick="test(this)" />sId -->
			<input type="checkbox" value="sName" onclick="test(this)" />姓名 <input
				type="checkbox" value="sAge" onclick="test(this)" />年龄 <input
				type="checkbox" value="sSex" onclick="test(this)" />性别 <input
				type="checkbox" value="sPhone" onclick="test(this)" />电话 <input
				type="checkbox" value="sStuState" onclick="test(this)" />学历 <input
				type="checkbox" value="sIsPay" onclick="test(this)" />是否缴费 <input
				type="checkbox" value="sIsValid" onclick="test(this)" />是否有效 <input
				type="checkbox" value="sState" onclick="test(this)" />状态 <input
				type="checkbox" value="sMsgSource" onclick="test(this)" />来源渠道 <input
				type="checkbox" value="sSourceUrl" onclick="test(this)" />来源网站 <input
				type="checkbox" value="sSourceKeyWord" onclick="test(this)" />来源关键词
			<input type="checkbox" value="sNetPusherId" onclick="test(this)" />所在区域
			<input type="checkbox" value="sStuConcern" onclick="test(this)" />学员关注
			<input type="checkbox" value="sContent" onclick="test(this)" />来源部门
			<input type="checkbox" value="sQQ" onclick="test(this)" />学员QQ <input
				type="checkbox" value="sWeiXin" onclick="test(this)" />微信号 <input
				type="checkbox" value="sIsBaoBei" onclick="test(this)" />是否报备
			<!-- <input type="checkbox"  value="sCreateUserId" onclick="test(this)" />是否报备 -->
		</p>
	</div>
	<!--搜索-->
	<div id="sousuo">
		<!-- 姓名关键字、电话、咨询师、是否缴费、是否有效、是否回访、QQ、创建时间/上门时间/首次回访时间/缴费时间/进班时间 -->
		<form id="tb-frm" class="easyui-form">
			<label for="name">姓名:</label> <input class="easyui-validatebox"
				type="text" id="sName" data-options="required:true" /> <label
				for="name">电话:</label> <input class="easyui-validatebox" type="text"
				id="sPhone" data-options="required:true" /> <label for="name">咨询师:</label>
			<input class="easyui-validatebox" type="text" id="askerName"
				data-options="required:true" /> <label for="name">是否缴费:</label> <select
				id="sIsPay" class="easyui-combobox" name="dept"
				style="width: 200px;">
				<option value="1">已缴费</option>
				<option value="0">未缴费</option>

			</select> </br> <label for="name">是否有效:</label> <select id="sIsValid1"
				class="easyui-combobox" name="dept" style="width: 200px;">
				<option value="1">有效</option>
				<option value="0">无效</option>
			</select> <label for="name">QQ:</label> <input class="easyui-validatebox"
				type="text" id="sQQ" data-options="required:true" /> <label
				for="name">创建时间:</label> <input class="easyui-datetimebox"
				type="text" id="sCreateTime" data-options="required:true" /> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-search'" onclick="init()">搜索</a> <a
				id="btn" href="javascript:shezhi()" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit'">设置</a>
				<a
				 href="javascript:print()" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit'">导出</a>


		</form>
	</div>
	<!--查看-->
	<div id="chakanAskers" class="easyui-dialog"
		data-options="modal:true,title:'修改',closed:true,fit:true">
		<form class="easyui-form" id="chakanA">
			<table cellpadding="5">
				<tr>
					<td><label>學生姓名:</label></td>
					<td><input disabled="disabled" class="easyui-textbox"
						type="text" id="sName2" name="sName" /></td>
					<td><label>课程方向:</label></td>
					<td><input disabled="disabled" class="easyui-textbox"
						type="text" id="sLearnForward2" name="sLearnForward"
						data-options="required:true" /></td>
					<td><label>打分:</label></td>
					<td><input disabled="disabled" class="easyui-textbox"
						type="text" id="sRecord2" name="sRecord"
						data-options="required:true" /></td>
					<td><label for="sName">是否有效:</label></td>
					<td><input disabled="disabled" class="easyui-textbox"
						type="text" id="sIsValid2" name="sIsValid"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="sName">无效原因:</label></td>
					<td><input disabled="disabled" class="easyui-textbox"
						type="text" id="sStuState2" name="sStuState"
						data-options="required:true" /></td>

					<td><label for="sName">是否回访:</label></td>
					<td><input disabled="disabled" class="easyui-textbox"
						type="text" id="sIsValid2" name="sIsValid"
						data-options="required:true" /></td>

					<td><label for="sName">首访时间:</label></td>
					<td><input disabled="disabled" class="easyui-textbox"
						type="text" id="sLostValid2" name="sLostValid"
						data-options="required:true" /></td>

					<td><label for="sName">是否上门:</label></td>
					<td><input disabled="disabled" class="easyui-textbox"
						type="text" id="sIsReturnVist2" name="sIsReturnVist"
						data-options="required:true" /></td>
				</tr>

				<tr>
					<td><label for="sName">上门时间:</label></td>
					<td><input disabled="disabled" id="sFirstVisitTime2"
						name="sFirstVisitTime" type="text" class="easyui-datebox">
						</input></td>

					<td><label for="sName">定金金额:</label></td>
					<td><input disabled="disabled" class="easyui-textbox"
						type="text" id="sIsHome2" name="sIsHome"
						data-options="required:true" /></td>

					<td><label for="sName">定金时间:</label></td>
					<td><input disabled="disabled" class="easyui-textbox"
						type="text" id="sHomeTime2" name="sHomeTime"
						data-options="required:true" /></td>

					<td><label for="sName">是否缴费（是，否）:</label></td>
					<td><input disabled="disabled" class="easyui-textbox"
						type="text" id="sIsPay2" name="sIsPay"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="sName">缴费时间:</label></td>
					<td><input disabled="disabled" class="easyui-textbox"
						type="text" id="sMoney2" name="sMoney"
						data-options="required:true" /></td>

					<td><label for="sName">缴费金额:</label></td>
					<td><input disabled="disabled" class="easyui-textbox"
						type="text" id="sIsReturnMoney2" name="sIsReturnMoney"
						data-options="required:true" /></td>

					<td><label for="sName">是否退费（是，否）:</label></td>
					<td><input disabled="disabled" class="easyui-textbox"
						type="text" id="sPayTime2" name="sPayTime"
						data-options="required:true" /></td>

					<td><label for="sName">退费原因</label></td>
					<td><input disabled="disabled" class="easyui-textbox"
						type="text" id="sReturnMoneyReason2" name="sReturnMoneyReason"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="sName">是否进班（是，否）</label></td>
					<td><input disabled="disabled" class="easyui-textbox"
						type="text" id="sIsInClass2" name="sIsInClass"
						data-options="required:true" /></td>
					<td><label for="sName">进班时间:</label></td>
					<td><input disabled="disabled" class="easyui-textbox"
						type="text" id="sInClassContent2" name="sInClassContent"
						data-options="required:true" /></td>

					<td><label for="sName">进班备注:</label></td>
					<td><input disabled="disabled" class="easyui-textbox"
						type="text" id="sIsBaoBei2" name="sIsBaoBei"
						data-options="required:true" /></td>
					<td><label for="sName">咨询师备注:</label></td>
					<td><input disabled="disabled" class="easyui-textbox"
						type="text" id="sZiXunId2" name="sZiXunId"
						data-options="required:true" /></td>
				</tr>
			</table>
		</form>
	</div>

	<!-- 修改的对话框 -->
	<div id="updateAskers" class="easyui-dialog"
		data-options="modal:true,title:'修改',closed:true,fit:true,
			buttons:[{
				text:'保存',
				handler:function(){
					saveEdit();
				}
			},{
				text:'取消',
				handler:function(){
					closeEdit();
				}
			}]">
		<form class="easyui-form" id="frm">
			<table cellpadding="5">

				<tr>
					<td><input type="hidden" id="sId1" name="sId" /></td>
				</tr>
				<tr>
					<td><label>學生姓名:</label></td>
					<td><input class="easyui-textbox" type="text" id="sName1"
						name="sName" /></td>
					<td><label>课程方向:</label></td>
					<td>
					<select id="sLearnForward1" name="sLearnForward" class="easyui-combobox"
						name="dept" style="width: 150px;">
							<option value="电子商务">电子商务</option>
							<option value="手机开发">手机开发</option>
							<option value="网络开发">手机开发</option>
					</select>
					</td>
					
					<td><label>打分:</label></td>
					<td><input class="easyui-textbox" type="text" id="sRecord1"
						name="sRecord" data-options="required:true" /></td>
					<td><label>是否有效:</label></td>
					<td><input class="easyui-textbox" type="text" id="sPhone1"
						name="sPhone" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label>无效原因:</label></td>
					<td><input class="easyui-textbox" type="text" id="sStuState1"
						name="sStuState" data-options="required:true" /></td>

					<td><label>是否回访:</label></td>
					<td><input class="easyui-textbox" type="text" id="sIsValid1"
						name="sIsValid" data-options="required:true" /></td>

					<td><label>首访时间:</label></td>
					<td><input class="easyui-datetimebox" type="text"
						id="sLostValid1" name="sLostValid" data-options="required:true" /></td>

					<td><label>是否上门:</label></td>
					<td><input class="easyui-textbox" type="text"
						id="sIsReturnVist1" name="sIsReturnVist"
						data-options="required:true" /></td>
				</tr>


				<tr>
					<td><label>上门时间:</label></td>
					<td><input id="sFirstVisitTime1" name="sFirstVisitTime"
						type="text" class="easyui-datetimebox"> </input></td>

					<td><label>定金金额:</label></td>
					<td><input class="easyui-textbox" type="text" id="sIsHome1"
						name="sIsHome" data-options="required:true" /></td>

					<td><label>定金时间:</label></td>
					<td><input class="easyui-datetimebox" type="text"
						id="sHomeTime1" name="sHomeTime" data-options="required:true" /></td>

					<td><label>是否缴费（是，否）:</label></td>
					<td>
					<select id="sIsPay1" name="sIsPay" class="easyui-combobox"
						name="dept" style="width: 200px;">
							<option value="1">已缴费</option>
							<option value="0">未缴费</option>
					</select>
					</td>
				</tr>
				<tr>
					<td><label>缴费时间:</label></td>
					<td><input class="easyui-datetimebox" type="text" id="sMoney1"
						name="sMoney" data-options="required:true" /></td>

					<td><label>缴费金额:</label></td>
					<td><input class="easyui-textbox" type="text"
						id="sIsReturnMoney1" name="sIsReturnMoney"
						data-options="required:true" /></td>

					<td><label>是否退费（是，否）:</label></td>
					<td><input class="easyui-textbox" type="text" id="sPayTime1"
						name="sPayTime" data-options="required:true" /></td>

					<td><label>退费原因</label></td>
					<td><input class="easyui-textbox" type="text"
						id="sReturnMoneyReason1" name="sReturnMoneyReason"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label>是否进班（是，否）</label></td>
					<td><input class="easyui-textbox" type="text" id="sIsInClass1"
						name="sIsInClass" data-options="required:true" /></td>
					<td><label for="sName">进班时间:</label></td>
					<td><input class="easyui-datetimebox" type="text"
						id="sInClassContent1" name="sInClassContent"
						data-options="required:true" /></td>

					<td><label>进班备注:</label></td>
					<td><input class="easyui-textbox" type="text" id="sIsBaoBei1"
						name="sIsBaoBei" data-options="required:true" /></td>

					<td><label>咨询师备注:</label></td>
					<td><input class="easyui-textbox" type="text" id="sZiXunId1"
						name="sZiXunId" data-options="required:true" /></td>
				</tr>

			</table>
		</form>
	</div>
	<!-- 添加的对话框 -->
	<div id="insetNefolls" class="easyui-dialog"
		data-options="modal:true,title:'添加',closed:true,fit:true,
			buttons:[{
				text:'保存',
				handler:function(){
					saveNefolls();
				}
			},{
				text:'取消',
				handler:function(){
					closeNefolls();
				}
			}]">
		<form class="easyui-form" id="insetNe">
			<table cellpadding="5">
				<tr>

					<td><input type="hidden" id="nStudentId" name="sId" /></td>
					<td><input type="hidden" id="nStudentName" name="sName" /></td>
				</tr>
				<tr>
					<td><label>跟踪时间:</label></td>
					<td><input class="easyui-datetimebox" type="text"
						id="nFollowTime" name="nFollowTime" data-options="required:true" /></td>

					<td><label for="sName">下次跟踪时间:</label></td>
					<td><input class="easyui-datetimebox" type="text"
						id="nNextFollowTime" name="nNextFollowTime"
						data-options="required:true" /></td>


					<td><label for="sName">内荣:</label></td>
					<td><input class="easyui-textbox" type="text" id="nContent"
						name="nContent" data-options="required:true" /></td>

					<td><label for="sName">用户编号:</label></td>
					<td><input class="easyui-textbox" type="text" id="nUserId"
						name="nUserId" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="sName">跟踪类别:</label></td>
					<td><input class="easyui-textbox" type="text" id="nFollowType"
						name="nFollowType" data-options="required:true" /></td>

					<td><label for="sName">创建时间:</label></td>
					<td><input class="easyui-datetimebox" type="text"
						id="nCreateTime" name="nCreateTime" data-options="required:true" /></td>

					<td><label for="sName">跟踪状态:</label></td>
					<td><input class="easyui-textbox" type="text"
						id="nFollowState" name="nFollowState" data-options="required:true" /></td>

				</tr>

			</table>
		</form>
	</div>

</body>

</html>