<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="/static/css/login.css" type=text/css rel=stylesheet>
</head>
<script type="text/javascript" src="/static/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
	 function login(){
		var account=$("#account").val();
		var password=$("#psw").val();
		if($.trim(account)==''){
			alert("账户不能为空！");
			document.getElementById("account").focus();
			return;
		}
		if($.trim(password)==''){
			alert("密码不能为空！");
			document.getElementById("psw").focus();
			return;
		}
		document.loginForm.submit();
	}
	
document.onkeydown=function(event){
    var event = event ? event : window.event;
        if(event.keyCode==13){  
           login();
        }
 }
</script>
<BODY id=userlogin_body>
<form action="/dologin/" method="post" name="loginForm">
{% csrf_token %}
<DIV id=user_login>
<DL>
  <DD id=user_top>
  <UL>
    <LI class=user_top_l></LI>
    <LI class=user_top_c></LI>
    <LI class=user_top_r></LI></UL>
  <DD id=user_main>
  <UL>
    <LI class=user_main_l></LI>
    <LI class=user_main_c>
    <DIV class=user_main_box>
    <div align="center" style="font-size: 12px;color: #FF0000;">${errors.userError[0]}</div>
    <UL>
      <LI class=user_main_text>用户名： </LI>
      <LI class=user_main_input><INPUT class=TxtUserNameCssClass id="account" maxLength=20 name="username"> </LI></UL>
    <UL>
      <LI class=user_main_text>密 码： </LI>
      <LI class=user_main_input><INPUT class=TxtPasswordCssClass id="psw" type=password name="password"> </LI></UL>
      </DIV>
      </LI>
    <LI class=user_main_r><img onclick="login()" src="/static/images/user_botton.gif" style="cursor: pointer;"/></LI></UL>
  <DD id=user_bottom>
  <UL>
    <LI class=user_bottom_l></LI>
    <LI class=user_bottom_c> </LI>
    <LI class=user_bottom_r></LI>
    </UL></DD></DL>
    </DIV>
    </form>
</body>
</html>