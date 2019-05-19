<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>欢迎页面</title>
<script src="js/global.js"></script>
<style type="text/css">
input#rightcode {
	font-family: Arial;
	font-style: italic;
	color: red;
	padding: 2px 3px;
	letter-spacing: 2px;
	font-weight: bolder;
}
</style>
</head>
<script>
	var username, userpsw, str;

	function createNewCode() {
		var arr = [ '0', '1', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c',
				'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
				'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A',
				'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
				'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' ];
		str = "";
		var strlength = 4;
		for (var i = 0; i < strlength; i++) {
			var num = Math.floor(Math.random() * arr.length);
			str += arr[num];
		}
		;
		var btn = document.getElementById("rightcode");
		btn.value = str;
	};

	function setCookie(_name, val, expires) {
		var d = new Date();
		d.setDate(d.getDate() + expires);
		document.cookie = _name + "=" + val + ";path=/;expires="
				+ d.toGMTString();
	}//获取cookie
	function getCookie(_name) {

		var cookie = document.cookie;
		var arr = cookie.split("; ");
		for (var i = 0; i < arr.length; i++) {

			var newArr = arr[i].split("=");
			if (newArr[0] == _name) {
				return newArr[1];
			}
		}
		return "";
	}
	/*
	      如何将json对象转换为字符串
	          JSON.stringify(对象);
	          返回值是一个字符串
	      如何将字符串转换为json对象
	          JSON.parse(字符串)
	          返回值是对象
	 */

	if (getCookie("init")) {
		var cookie = JSON.parse(getCookie("init"));
		username = cookie.name;
		userpsw = cookie.pass;
	}

	function submitForm() {

		if ($("#check").is(":checked")) {
			var obj = {};
			obj.name = $("#username").val();
			obj.pass = $("#userpsw").val();
			var a = JSON.stringify(obj);
			setCookie("init", a, 7);
		}
		var name = $("#username").val();
		var pwd = $("#userpsw").val();
		var yan = $("#yan").val();
		var flag = $("#frm").form("validate");
		if (flag) {
			if (str == yan) {
				login(name, pwd);

			} else {
				$.messager.alert("提示", "验证码错误");
			}
		} else {
			$.messager.alert("提示", "输入内容为空");
		}
	}

	function login(name, pwd) {
		$.post("ulogin", {
			un : name,
			pwd : pwd
		}, function(res) {
			if (res == 0) {
				$.messager.alert("提示", "该用户不存在");
			} else if (res == 1) {
				window.location.href = "index.jsp";
			} else if (res == 3) {
				$.messager.alert("提示", "该用户已被锁定");
			} else {
				$.messager.alert("提示", "密码错误");
			}

		}, "json")
	}
	$(function() {
		createNewCode();
		if (username != null) {
			$('#uwin').panel('close');
			$.messager
					.show({
						title : '消息提示',
						timeout : 5000,
						showType : 'slide',
						msg : '<font size=\"2\" color=\"#666666\"><strong>是否登陆上次账号?'
								+ '<br clear=left>'
								+ '<br><span  style=\"padding-left:60px\"></span><input type=\"button\" value=\"登陆\" onClick=\"showlogin()\">'
								+ '<span  style=\"padding-left:20px\"></span><input type=\"button\" value=\"清空\" onClick=\"closeshow()\">'

					});

		}

	})

	function showlogin() {
		$("#frm").form("load", {
			name : username,
			psw : userpsw
		});
		login(username, userpsw);
	}

	function closeshow() {
		$('#uwin').panel('open');
		$.messager.show({
			title : '消息提示',
			timeout : 5000,
			showType : 'slide',
			msg : '已清空上次登陆记录'
		});
		setCookie("init","",0);
	}
</script>
<body>
<br>
<div
		style="margin-top: 180px; margin-left: 600px; width: 400px; height: 400px;">
		<div class="easyui-panel" title="用户登录" id="uwin">
			<div style="padding: 20px; margin-left: 20px;">
				<form id="frm">
					<table cellpadding="5">
					<tr>
							<td>验证码：</td>
							<td><input type="text" class="validatebox" name="yan"
								id="yan"> <input type="button" id="rightcode"
								onclick="createNewCode()"></td>
						</tr>
						<tr>
							<td>用户名：</td>
							<td><input id="username" name="name" class="validatebox"
								data-options="required:true" /></td>
						</tr>
						<tr>
							<td>密码：</td>
							<td><input id="userpsw" type="password" name="psw"
								class="validatebox" data-options="required:true" /></td>
						</tr>
						
					</table>
				</form>
				<br />
				<div style="text-align: center; padding-top: 5px;">
					<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
						onclick="submitForm()">登陆</a> <a class="easyui-linkbutton"
						data-options="iconCls:'icon-clear'" onclick="clearForm()">取消</a>
				</div>
			</div>
			<div>
				<label for=""><input type="checkbox" id="check">7天免登陆</label>
			</div>
		</div>
	</div>
</body>
</html>