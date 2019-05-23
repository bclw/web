<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/icon.css">
<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/default/easyui.css"> 
<!--  <script type="text/javascript" src="js/global.js"></script>  -->
 <script type="text/javascript">
 
 $(function() {
		init();
	});

	 function init() {
			$('#treemenu').tree({
				url : 'getModules',
				method : "POST",
				animate : true,
				lines:true,
				checkbox :true,
				onContextMenu:function(e,node){
					e.preventDefault();
					//查找节点
					$("#treemenu").tree('select',node.target); 
					//显示右键菜单
					/* $('mm').menu('show',{
						left:e.pageX,
						top:e.pageY
					}) */
				}
			})
	 }
	
	 
	 //点击新增按钮
        function addModule(){
            var nodes = $('#treemenu').tree('getSelected');    // get checked nodes
            // alert(nodes.text);//获取
            //alert(nodes.id);//获取节点id
            if(nodes!=null){
                //将当前行数据填入表单
                $("#parentModulename").text(nodes.text);
                $("#insertWindow").window("open");
            }else{
                alert("请选择父节点！");
            }
        }
 
 //点击新增保存按钮
 function insertInfo(){
     var nodes = $('#treemenu').tree('getSelected');
     var flag=$("#insertFrm").form("validate");
     var mName=$("#mName").val();
     var mPath=$("#mPath").val();
     if(flag){
         $.post("insertModule",
             {    
                 mName:mName,
                 mParentId: nodes.id, 
                 mPath: mPath,
             }, 
             function(res){
                 if(res>0){
                	 init();
                     alert("新增成功");
                     $("#insertWindow").window("close");
                     /* $("#mm").datagrid("reload"); */
                     window.location.reload();

                 }                            
         },"json");
     }    
 }
 
 //点击新增取消按钮
 function closeInfo(){
     $('#insertFrm').form('clear');
     $("#insertWindow").window("close");
     $("#updateWindow").window("close");
 }
 
 
 
 
 function editModule() {
	 var nodes = $('#treemenu').tree('getSelected');    // get checked nodes
     if(nodes!=null){
         //将当前行数据填入表单
        /*  $("#mId1").text(nodes.text); */
         $("#updateWindow").window("open");
     }else{
         alert("请选择节点！");
     }
     
	}

	function updateInfo() {
		var nodes = $('#treemenu').tree('getSelected');
	     var flag=$("#updateFrm").form("validate");
	     var mName=$("#mName1").val();
	     if(flag){
	         $.post("updateModule",
	             {    
	        		 mId: nodes.id, 
	                 mName:mName,
	             }, 
	             function(res){
	                 if(res>0){
	                     alert("修改成功");
	                     $("#updateWindow").window("close");
	                     window.location.reload();
	                 }                            
	         },"json");
	     }    
	}

	
	
	
	
	function removeModule(){
		var nodes = $('#treemenu').tree('getSelected');    // get checked nodes
        if(nodes!=null){
        	$.messager.confirm("提示","确认删除么？",function(r){
    			if(r){
    				$.post("deleteModule",{
    					mId : nodes.id
    				},function(res){
    					if(res>0){
    						//删除成功
    					window.location.reload();
    						$.messager.alert("提示","删除成功");
    					}else{
    						//删除失败
    						$.messager.alert("提示","删除失败");
    					}
    				},"json")
    				
    			}
    		})
        	
        }else{
            alert("请选择父节点！");
        }
	}
 
 </script>
</head>
<body>

<div>

		 <div id="mm"  data-options="onClick:menuHandler">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addModule()">新增</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editModule()">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cut" plain="true" onclick="removeModule()">删除</a>
		</div> 
		
		<div id="moduleDiv" title="请选择模块">
			<ul id="treemenu"></ul>
		</div>
			
			
<!-- 添加 -->
	<div id="insertWindow" class="easyui-window" title="新增窗口" style="height:200px;weight:150px" data-options="modal:true,closed:true">
		<form id="insertFrm" class="easyui-form" >
			<table>
				<tr>
					<td>
						<label for="name">父节点名称:</label> 
					</td>
					<td>
						<div id="parentModulename"></div>
						<!-- <input class="easyui-validatebox" type="text" id="parentModulename" /> -->
					</td>
				</tr>
				
				<tr>
					<td>
						<label for="name">URL:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="mPath" name="mPath" />
					</td>
				</tr>
				
				
				<tr>
					<td>
						<label for="name">模块名称:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="mName" name="mName" />
					</td>
				</tr>
				
				
				<tr>
					<td>
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="insertInfo()" >提交</a>
					</td>
					<td>
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeInfo()" >取消</a>
					</td>
				</tr>
				
			</table>
		</form>
	</div>
	
	
	<!--修改的对话框  -->
	<div id="updateWindow" class="easyui-window" title="修改窗口" style="height:200px;weight:150px" data-options="modal:true,closed:true">
		<form id="updateFrm" class="easyui-form" >
			<table>
				 <tr>
					<td>
						<label for="name" hidden="hidden">编号名称:</label> 
					</td>
					<td>
						<div id="mId1"></div>
					</td>
				</tr> 
				
				<tr>
					<td>
						<label for="name">新模块名称:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="mName1" name="mName1" />
					</td>
				</tr>
				
				
				<tr>
					<td>
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateInfo()" >提交</a>
					</td>
					<td>
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeInfo()" >取消</a>
					</td>
				</tr>
				
			</table>
		</form>
	</div>
		
		
</div>
</body>
</html>