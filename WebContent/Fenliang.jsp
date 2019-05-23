<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>分量設置</title>
</head>
<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/icon.css"/>
<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/default/easyui.css"/>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/datagrid-export.js"></script>
<script type="text/javascript">

$(function(){
	init();
	$('#cc').combobox({    
	    url:'selectQD',    
	    valueField:'uId',    
	    textField:'loginName'   
	}); 
})
function init(){	
	$("#showd").datagrid({
		url:'selectStuends',
		method:'post',
		pagination:true,
		toolbar:'#bar',
		queryParams:{
			 sName:$("#sName").val(),
			sPhone:$("#sPhone").val(),
			 sIsPay:$("#sIsPay").combobox("getValue"),
			sIsValid:$("#sIsValid").combobox("getValue"),
			sIsReturnVist:$("#sIsReturnVist").combobox("getValue"),
			sQQ:$("#sQQ").val(),
			sCreateTime:$("#sCreateTime").val()  
			
		}
})
}


function formattercaozuo(value,row,index) {
	return "<a href='javascript:void(0)' onclick='looks("+index+")'>查看</a> <a href='javascript:void(0)' onclick='deletes("+index+")'>刪除</a> <a href='javascript:void(0)' onclick='updatesd("+index+")'>分配咨询师</a> "
}

function formattersex(value, row, index) {
	return value ==1 ? "男":"女"
}
function formatterIsPay(value, row, index) {
	return value ==1 ? "已缴费":"未缴费"
}
function formattersIsValid(value, row, index) {
	return value ==1 ? "有效":"无效"
}
function formatterIsReturnVist(value, row, index) {
	return value ==1 ? "已回访":"未回访"
}
function formatterIsBaoBei(value, row, index) {
	return value ==1 ? "已报备":"未报备"
}
function  formatterIsHome(value, row, index){
	return value ==1 ? "在家":"不在家"
}
function  formatterIsReturnMoney(value, row, index){
	return value ==1 ? "退":"不退"
}



function looks(index) {
	var datas=$("#showd").datagrid("getData");
	var row=datas.rows[index];
	//填充表单
	$("#lookFrm").form("load",row)
	//打开弹窗
	$("#lookDialog").dialog("open");
	$.post("lookStuends",{
		sId:$("#sId").val(),
		sName:$("#sName").val(),
		sAge:$("#sAge").val(),
		sSex:$("#sSex").val(),
		sPhone:$("#sPhone").val(),
		sStuState:$("#sStuState").val(),
		sState:$("#sState").val(),
		sMsgSource:$("#sMsgSource").val(),
		sSourceUrl:$("#sSourceUrl").val(),
		sSourceKeyWord:$("#sSourceKeyWord").val(),
		sQQ:$("#sQQ").val(),
		sWeiXin:$("#sWeiXin").val(),
		sIsBaoBei:$("#sIsBaoBei").val(),
	})
}




//添加
function insert(){
	$("#insertdialog").dialog("open");
}
function saveInsert(){
	var isAutoAllot = $("#isAuto").is(":checked");
	$.post("InsertStuends",{
		sName:$("#sName1").val(),
		sAge:$("#sAge1").val(),
		sSex:$("#sSex1").val(),
		sPhone:$("#sPhone1").val(),
		sStuState:$("#sStuState1").val(),
		sState:$("#sState1").val(),
		sMsgSource:$("#sMsgSource1").val(),
		sSourceUrl:$("#sSourceUrl1").val(),
		sSourceKeyWord:$("#sSourceKeyWord1").val(),
		sQQ:$("#sQQ1").val(),
		sWeiXin:$("#sWeiXin1").val(),
		sIsBaoBei:$("#sIsBaoBei1").val(),
		isAutoAllot:isAutoAllot,
		sCreateUserId:$("#sCreateUserId1").val(),
	},function(res){
		if(res>0){
			//添加成功
			$("#showd").datagrid("reload");
			$("#insertdialog").dialog("close")
			$.messager.alert("提示","添加成功");
		}else{
			//添加失败
			$.messager.alert("提示","添加失败");
		}
	},"json")
	$("#insertfrm").form("clear");
}

function closeInsert(){
	$("#insertdialog").dialog("close");
}


//分配
function updatesd(index){
	var datas=$("#showd").datagrid("getData");
	var row=datas.rows[index];
	
		$('#cc').combobox({    
		    url:'selectQD',    
		    valueField:'uId',    
		    textField:'loginName'   
		}); 
		//填充表单
		$("#fenpeifrm").form("load",row)
		$("#fenpeidialog").dialog("open");
}
function savefenpei(){
	var sId = $("#sIdd").val();
	$.post("updateUserId",{
		sId:sId, 
		sCreateUserId:$("#cc").combobox('getValue'),
	},function(res){
		if(res>0){
			//修改咨询成功
			$("#showd").datagrid("reload");
			$("#fenpeidialog").dialog("close")
			$.messager.alert("提示","分配成功");
		}else{
			//修改咨询失败
			$.messager.alert("提示","分配失败");
		}
	},"json")
	$("#fenpeifrm").form("clear");
}









//删除
function deletes(index){
	var data=$("#showd").datagrid("getData");
	var row=data.rows[index];
	
	$.messager.confirm("提示","确认删除么？",function(r){
		if(r){
			$.post("deletesStuends",{
				sId : row.sId
			},function(res){
				if(res>0){
					//删除成功
					$("#showd").datagrid("reload");
					$.messager.alert("提示","删除成功");
					
				}else{
					//删除失败
					$.messager.alert("提示","删除失败");
				}
			},"json")
			
		}
	})
	
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
		$('#showd').datagrid('showColumn', row.value);//显示
	} else {
		$('#showd').datagrid('hideColumn', row.value);//隐藏
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

		$('#showd').datagrid('hideColumn', this.value);//将没选中的列隐藏起来
	});
});



</script>





<body>

<table id="showd" class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'',checkbox:true"></th>
				<th data-options="field:'sId',title:'编号'"></th>
				<th data-options="field:'sName',title:'姓名'"></th>
			    <th data-options="field:'sAge',title:'年龄'"></th>
			    <th data-options="field:'sSex',title:'性别',formatter:formattersex"></th>
			    <th data-options="field:'sPhone',title:'电话'"></th>
			    <th data-options="field:'sStuState',title:'学历'"></th>
			    <th data-options="field:'sState',title:'状态'"></th>
			    <th data-options="field:'sMsgSource',title:'来源渠道'"></th>
				<th data-options="field:'sSourceUrl',title:'来源网站'"></th>
				<th data-options="field:'sSourceKeyWord',title:'来源关键词'"></th>
				<th data-options="field:'sAddress',title:'地址'"></th>
				<th data-options="field:'sNetPusherId',title:'所在区域'"></th>
				<th data-options="field:'sStuConcern',title:'学员关注'"></th>
				<th data-options="field:'sQQ',title:'学员QQ'"></th>
				<th data-options="field:'sWeiXin',title:'微信号'"></th>
				<th data-options="field:'sContent',title:'来源部门'"></th>
				<th data-options="field:'sCreateTime',title:'创建时间'"></th>
				<th data-options="field:'sLearnForward',title:'课程方向'"></th>
				<th data-options="field:'sIsValid',title:'是否有效',formatter:formattersIsValid"></th>
				<th data-options="field:'sRecord',title:'备注'"></th>
				<th data-options="field:'sIsReturnVist',title:'是否拜访',formatter:formatterIsReturnVist"></th>
				<th data-options="field:'sFirstVisitTime',title:'首次拜访时间'"></th>
				<th data-options="field:'sIsHome',title:'是否在家',formatter:formatterIsHome"></th>
				<th data-options="field:'sHomeTime',title:'进门时间'"></th>
				<th data-options="field:'sLostValid',title:'无效原因'"></th>
				<th data-options="field:'sIsPay',title:'是否缴费',formatter:formatterIsPay"></th>
				<th data-options="field:'sPayTime',title:'缴费时间'"></th>
				<th data-options="field:'sMoney',title:'缴费金额'"></th>
				<th data-options="field:'sIsReturnMoney',title:'是否退费',formatter:formatterIsReturnMoney"></th>
				<th data-options="field:'sReturnMoneyReason',title:'退费原因'"></th>
				<th data-options="field:'sIsInClass',title:'是否进班'"></th>
				<th data-options="field:'sInClassTime',title:'进班时间'"></th>
				<th data-options="field:'sInClassContent',title:'内容'"></th>
				<th data-options="field:'sIsBaoBei',title:'是否报备',formatter:formatterIsBaoBei"></th>
				<!-- <th data-options="field:'sZiXunId',title:'咨询师编号'"></th> -->
				<th data-options="field:'sCreateUserId',title:'录入人编号'"></th>
				<th data-options="field:'sPreMoney',title:'定金金额'"></th>
				<th data-options="field:'sPreMoneyTime',title:'定金时间'"></th>
				<th data-options="field:'caozuo',title:'操作',formatter:formattercaozuo"></th> 
			</tr>
		</thead>
	</table>
	


<!-- 查看 -->
	<div id="lookDialog" class="easyui-dialog" data-options="modal:true,closed:true">
		<form id="lookFrm" class="easyui-form" >
			<table>
				<tr>
					<td>
						<label for="name">学生编号:</label> 
					</td>
					<td>
						<input disabled="disabled" class="easyui-validatebox" type="text" id="sId" name="sId" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">学生姓名:</label> 
					</td>
					<td>
						<input disabled="disabled" class="easyui-validatebox" type="text" id="sName" name="sName" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">年龄:</label> 
					</td>
					<td>
						<input disabled="disabled" class="easyui-validatebox" type="text" id="sAge" name="sAge" />
					</td>
				</tr>
				
						<tr>
					<td>
						<label for="name">性别:</label> 
					</td>
					<td>
						<input disabled="disabled" class="easyui-validatebox" type="text" id="sSex" name="sSex" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">电话:</label> 
					</td>
					<td>
						<input disabled="disabled" class="easyui-validatebox" type="text" id="sPhone" name="sPhone" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">学历:</label> 
					</td>
					<td>
						<input disabled="disabled" class="easyui-validatebox" type="text" id="sStuState" name="sStuState" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">状态:</label> 
					</td>
					<td>
						<input disabled="disabled" class="easyui-validatebox" type="text" id="sState" name="sState" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">来源渠道:</label> 
					</td>
					<td>
						<input disabled="disabled" class="easyui-validatebox" type="text" id="sMsgSource" name="sMsgSource" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">来源网站:</label> 
					</td>
					<td>
						<input disabled="disabled" class="easyui-validatebox" type="text" id="sSourceUrl" name="sSourceUrl" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">来源关键词:</label> 
					</td>
					<td>
						<input disabled="disabled" class="easyui-validatebox" type="text" id="sSourceKeyWord" name="sSourceKeyWord" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">学生QQ:</label> 
					</td>
					<td>
						<input disabled="disabled" class="easyui-validatebox" type="text" id="sQQ" name="sQQ" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">学生微信:</label> 
					</td>
					<td>
						<input disabled="disabled" class="easyui-validatebox" type="text" id="sWeiXin" name="sWeiXin" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">是否报备:</label> 
					</td>
					<td>
						<input disabled="disabled" class="easyui-validatebox" type="text" id="sIsBaoBei" name="sIsBaoBei" />
					</td>
				</tr>
			</table>
		</form>
	</div>

	<!-- 搜索 -->
	<div id="bar">
	<!-- 姓名关键字、电话、咨询师、是否缴费、是否有效、是否回访、QQ、创建时间/上门时间/首次回访时间/缴费时间/进班时间 -->
	   <form id="tb-frm" class="easyui-form">
		  <label for="name">姓名:</label>   
          <input class="easyui-validatebox" type="text" id="sName" data-options="required:true" />
          <label for="name">电话:</label>   
          <input class="easyui-validatebox" type="text" id="sPhone" data-options="required:true" />
          <!-- <label for="name">咨询师:</label>   
          <input class="easyui-validatebox" type="text" id="loginName" data-options="required:true" /> -->
       	  是否缴费:<select id="sIsPay" name="sIsPay" class="easyui-combobox" >
							<option value="">--请选择--</option>
							<option value="1">已缴费</option>
							<option value="2">未缴费</option>
					</select> 
					
		 是否有效:<select id="sIsValid" name="sIsValid" class="easyui-combobox" >
							<option value="">--请选择--</option>
							<option value="1">有效</option>
							<option value="2">无效</option>
					</select> 
					
					
		 是否回访:<select id="sIsReturnVist" name="sIsReturnVist" class="easyui-combobox" >
							<option value="">--请选择--</option>
							<option value="1">回访</option>
							<option value="2">不回访</option>
					</select> 
          <label for="name">QQ:</label>   
          <input class="easyui-validatebox" type="text" id="sQQ" data-options="required:true" />
          <label for="name">创建时间:</label>   
          <input class="easyui-datetimebox" id="sCreateTime" name="sCreateTime"  data-options="required:true"><br>
          
          
          <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="init()">搜索</a>  
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="insert()" data-options="iconCls:'icon-add'">新增</a>
		  <a id="btn" href="javascript:shezhi()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">设置</a>
		  
		</form>
	</div> 




<!-- 设置隐藏列 -->
<div id="win" class="easyui-window" title="设置" style="width: 500px; height: 300px"
		data-options="iconCls:'icon-save',modal:true,closed:true">
<p>
<input type="checkbox" name="sId" id="sId" value="sId" onclick="test(this)" />编号
<input type="checkbox" name="sName" id="sName" value="sName" onclick="test(this)" />姓名
<input type="checkbox" name="sAge" id="sAge" value="sAge" onclick="test(this)" />年龄
<input type="checkbox" name="sSex" id="sSex" value="sSex" onclick="test(this)" />性别
<input type="checkbox" name="sPhone" id="sPhone" value="sPhone" onclick="test(this)" />手机号
<br>
<input type="checkbox" name="sStuState" id="sStuState" value="sStuState" onclick="test(this)" />学历
<input type="checkbox" name="sState" id="sState" value="sState" onclick="test(this)" />状态
<input type="checkbox" name="sMsgSource" id="sMsgSource" value="sMsgSource" onclick="test(this)" />来源渠道
<input type="checkbox" name="sSourceUrl" id="sSourceUrl" value="sSourceUrl" onclick="test(this)" />来源网站
<input type="checkbox" name="sSourceKeyWord" id="sSourceKeyWord" value="sSourceKeyWord" onclick="test(this)" />来源关键字
<br>
<input type="checkbox" name="sAddress" id="sAddress" value="sAddress" onclick="test(this)" />地址
<input type="checkbox" name="sNetPusherId" id="sNetPusherId" value="sNetPusherId" onclick="test(this)" />所在区域
<input type="checkbox" name="sStuConcern" id="sStuConcern" value="sStuConcern" onclick="test(this)" />学员关注
<input type="checkbox" name="sContent" id="sContent" value="sContent" onclick="test(this)" />来源部门
<input type="checkbox" name="sQQ" id="sQQ" value="sQQ" onclick="test(this)" />QQ
<br>
<input type="checkbox" name="sWeiXin" id="sWeiXin" value="sWeiXin" onclick="test(this)" />微信
<input type="checkbox" name="sIsBaoBei" id="sIsBaoBei" value="sIsBaoBei" onclick="test(this)" />是否报备
<!-- <input type="checkbox" name="sZiXunId" id="sZiXunId" value="sZiXunId" onclick="test(this)" />咨询师 -->
<input type="checkbox" name="sCreateTime" id="sCreateTime" value="sCreateTime" onclick="test(this)" />创建时间
<input type="checkbox" name="sLearnForward" id="sLearnForward" value="sLearnForward" onclick="test(this)" />课程方向
<br>
<input type="checkbox" name="sIsValid" id="sIsValid" value="sIsValid" onclick="test(this)" />是否有效
<input type="checkbox" name="sRecord" id="sRecord" value="sRecord" onclick="test(this)" />备注
<input type="checkbox" name="sFirstVisitTime" id="sFirstVisitTime" value="sFirstVisitTime" onclick="test(this)" />首次拜访时间
<input type="checkbox" name="sIsHome" id="sIsHome" value="sIsHome" onclick="test(this)" />是否在家
<input type="checkbox" name="sIsReturnVist" id="sIsReturnVist" value="sIsReturnVist" onclick="test(this)" />是否回访
<br>
<input type="checkbox" name="sHomeTime" id="sHomeTime" value="sHomeTime" onclick="test(this)" />在家时间
<input type="checkbox" name="sLostValid" id="sLostValid" value="sLostValid" onclick="test(this)" />是否回访
<input type="checkbox" name="sMoney" id="sMoney" value="sMoney" onclick="test(this)" />缴费金额
<input type="checkbox" name="sPayTime" id="sPayTime" value="sPayTime" onclick="test(this)" />缴费时间
<input type="checkbox" name="sIsReturnMoney" id="sIsReturnMoney" value="sIsReturnMoney" onclick="test(this)" />是否退费
<br>
<input type="checkbox" name="sReturnMoneyReason" id="sReturnMoneyReason" value="sReturnMoneyReason" onclick="test(this)" />退费原因
<input type="checkbox" name="sIsInClass" id="sIsInClass" value="sIsInClass" onclick="test(this)" />是否进班
<input type="checkbox" name="sInClassTime" id="sInClassTime" value="sInClassTime" onclick="test(this)" />进班时间
<input type="checkbox" name="sInClassContent" id="sInClassContent" value="sInClassContent" onclick="test(this)" />在班内容
<input type="checkbox" name="sIsBaoBei" id="sIsBaoBei" value="sIsBaoBei" onclick="test(this)" />是否报备
<br>
<input type="checkbox" name="sIsPay" id="sIsPay" value="sIsPay" onclick="test(this)" />是否缴费
<input type="checkbox" name="sCreateUserId" id="sCreateUserId" value="sCreateUserId" onclick="test(this)" />录入人 
<input type="checkbox" name="sPreMoney" id="sPreMoney" value="sPreMoney" onclick="test(this)" />定金金额
<input type="checkbox" name="sPreMoneyTime" id="sPreMoneyTime" value="sPreMoneyTime" onclick="test(this)" />定金时间
<input type="checkbox" name="caozuo" id="caozuo" value="caozuo" onclick="test(this)" />操作
 </p>   
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
		closeInsert();
		}
	}
	]">
		<form id="insertfrm" class="easyui-form">
	         			<table>
				
				<tr>
					<td>
						<label for="name">姓名:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="sName1" name="sName" />
					</td>
				</tr>
				
						<tr>
					<td>
						<label for="name">年龄:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="sAge1" name="sAge" />
					</td>
				</tr>
				
						<tr>
					<td>
						<label for="name">性别:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="sSex1" name="sSex" />
					</td>
				</tr>
				
				<tr>
					<td>
						<label for="name">电话:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="sPhone1" name="sPhone" />
					</td>
				</tr>
				
				<tr>
					<td>
						<label for="name">学历:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="sStuState1" name="sStuState" />
					</td>
				</tr>
				
				<tr>
					<td>
						<label for="name">状态:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="sState1" name="sState" />
					</td>
				</tr>
				
				
				<tr>
					<td>
						<label for="name">来源渠道:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="sMsgSource1" name="sMsgSource" />
					</td>
				</tr>
				
				
				<tr>
					<td>
						<label for="name">来源网站:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="sSourceUrl1" name="sSourceUrl" />
					</td>
				</tr>
				
				
				<tr>
					<td>
						<label for="name">来源关键词:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="sSourceKeyWord1" name="sSourceKeyWord" />
					</td>
				</tr>
				
				
				<tr>
					<td>
						<label for="name">学生QQ:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="sQQ1" name="sQQ" />
					</td>
				</tr>
				
				
				<tr>
					<td>
						<label for="name">学生微信:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="sWeiXin1" name="sWeiXin" />
					</td>
				</tr>
				
				<tr>
					<td>
						<label for="name">是否报备(是/否):</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="sIsBaoBei1" name="sIsBaoBei" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">录入人:</label> 
					</td>
					<!-- <td>
			        	<select class="easyui-combobox" style="width:100px;" id="sCreateUserId1" name="sCreateUserId1">   
						    <option value="">--请选择--</option>      
						    <option value="0">1234</option> 
						    <option value="1">12345</option>
						    <option value="2">1231231</option>
						    <option value="3">12312311</option> 
						    <option value="4">123123123131</option>    
						</select>
						<input type="checkbox" id="isAuto" />自动分配
			        </td> -->
				</tr>
				
				
				
				

			
			</table>
		</form>
		</div>
		
		
		
		
		
		
		
		
		
		
<!-- 分配咨询师 -->
	<div  id="fenpeidialog" class="easyui-dialog" data-options="modal:true,closed:true,buttons:[
	{
	text:'保存',
	handler:function(){
		savefenpei();
		}
	},{
	text:'取消',
	handler:function(){
		closeInsert();
		}
	}
	]">
		<form id="fenpeifrm" class="easyui-form">
	         			<table>
	         			<tr>
					<td>
			        	<input class="easyui-validatebox" type="text" id="sIdd" name="sId" hidden="hidden" />
			        </td>
				</tr>
				
				<tr>
					<td>
						<label for="name">咨询师姓名:</label> 
					</td>
					<td>
			        	<input id="cc" name="dept" value="--请选择--" class="easyui-combobox"> 
			        </td>
				</tr>

			</table>
		</form>b0
		</div>
		
		

</body>
</html>