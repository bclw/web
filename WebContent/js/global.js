var globalData = {
	server: "http://stuapi.ysd3g.com",
	server2:"http://192.168.1.250:83",
	pre: "http://localhost:8080/Web/",
	myToken: "e79fd7ae-15aa-477e-8c81-e5b70ac5a782",
	mytheme: "default",
	setUserInfo: function(uid, uname, roleNames) {
		sessionStorage.setItem("uid", uid);
		sessionStorage.setItem("uname", uname);
		sessionStorage.setItem("roleNames", roleNames)
	},
	getCurUid: function() {
		return sessionStorage.getItem("uid");
	},
	getCurUName: function() {
		return sessionStorage.getItem("uname");
	},
	getUserRoleNames:function(){
		var rs=window.sessionStorage.getItem("roleNames");
		/*var arr=rs.split(",");
		for(var i=0;i<arr.length;i++){
			arr[i]="\'"+arr[i]+"\'"
		}*/
		return rs
	}
}

document.write('<link rel="stylesheet" href="' + globalData.pre + 'js/jquery-easyui-1.4.3/themes/icon.css" type="text/css"/>');
document.write('<link rel="stylesheet" href="' + globalData.pre + 'js/jquery-easyui-1.4.3/themes/'+globalData.mytheme+'/easyui.css"/>');
document.write('<script type="text/javascript" src="' + globalData.pre + 'js/jquery-easyui-1.4.3/jquery.min.js" ></script>');
document.write('<script type="text/javascript" src="' + globalData.pre + 'js/jquery-easyui-1.4.3/jquery.easyui.min.js" ></script>');
document.write('<script src="' + globalData.pre + 'js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>');
