<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Jewellery Management System</title>
<%@ include file="/WEB-INF/jsp/common.jsp" %>
<style type="text/css">
.form-style-5{
	max-width: 500px;
	padding: 10px 20px;
	background: #f4f7f8;
	margin: 10px auto;
	padding: 20px;
	background: #f4f7f8;
	border-radius: 8px;
	font-family: Georgia, "Times New Roman", Times, serif;
}
.form-style-5 fieldset{
	border: none;
}
.form-style-5 legend {
	font-size: 1.4em;
	margin-bottom: 10px;
}
.form-style-5 label {
	display: block;
	margin-bottom: 8px;
}

.form-style-5 input[type="password"],
.form-style-5 input[type="text"],
.form-style-5 input[type="date"],
.form-style-5 input[type="datetime"],
.form-style-5 input[type="email"],
.form-style-5 input[type="number"],
.form-style-5 input[type="search"],
.form-style-5 input[type="time"],
.form-style-5 input[type="url"],
.form-style-5 textarea,
.form-style-5 select {
	font-family: Georgia, "Times New Roman", Times, serif;
	background: rgba(255,255,255,.1);
	border: none;
	border-radius: 4px;
	font-size: 16px;
	margin: 0;
	outline: 0;
	padding: 7px;
	width: 100%;
	box-sizing: border-box; 
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box; 
	background-color: #e8eeef;
	color:#8a97a0;
	-webkit-box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
	box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
	margin-bottom: 30px;
	
}

.form-style-5 input[type="password"]:focus,
.form-style-5 input[type="text"]:focus,
.form-style-5 input[type="date"]:focus,
.form-style-5 input[type="datetime"]:focus,
.form-style-5 input[type="email"]:focus,
.form-style-5 input[type="number"]:focus,
.form-style-5 input[type="search"]:focus,
.form-style-5 input[type="time"]:focus,
.form-style-5 input[type="url"]:focus,
.form-style-5 textarea:focus,
.form-style-5 select:focus{
	background: #d2d9dd;
}
.form-style-5 select{
	-webkit-appearance: menulist-button;
	height:35px;
}
.form-style-5 .number {
	background: #1abc9c;
	color: #fff;
	height: 30px;
	width: 30px;
	display: inline-block;
	font-size: 0.8em;
	margin-right: 4px;
	line-height: 30px;
	text-align: center;
	text-shadow: 0 1px 0 rgba(255,255,255,0.2);
	border-radius: 15px 15px 15px 0px;
}

.form-style-5 input[type="submit"],
.form-style-5 input[type="button"]
{
	position: relative;
	display: block;
	padding: 8px 18px 8px 18px;
	color: #FFF;
	margin: 0 auto;
	background: #1abc9c;
	font-size: 18px;
	text-align: center;
	font-style: normal;
	border: 1px solid #16a085;
	border-width: 1px 1px 3px;
	margin-bottom: 10px;
}
.form-style-5 input[type="submit"]:hover,
.form-style-5 input[type="button"]:hover
{
	background: #109177;
}

</style>

<script>
	function changePassword(){
alert("Start");
		var userName=$('#userName').val();
		var oldPassword=$('#oldPassword').val();
		var newPassword=$('#newPassword').val();
		var confirmNewPassword=$('#confirmNewPassword').val();
		
		if(userName=="")
		{
			alert("Please Enter User Name");
			return false;
		}
		if(oldPassword=="")
		{
			alert("Please Enter Old Password");
			return false;
		}
		if(newPassword=="")
		{
			alert("Please Enter New Passord");
			return false;
		}
		if(confirmNewPassword=="")
		{
			alert("Please Enter Confirm New Password");
			return false;
		}
		if(newPassword!=confirmNewPassword)
		{
			alert("New Password and confirm Password doesn't match");
			return false;
		}
		alert("Stop");
		document.forms[0].action="<%=request.getContextPath()%>/change/"+userName+"/"+oldPassword+"/"+newPassword+"";
		
		document.forms[0].submit();
	}
</script>
</head>
<body>
<div id="wrapper">
		<%@ include file="/WEB-INF/jsp/header.jsp" %>
 <div id="page-wrapper">
 
   </br></br>
<div class="form-style-5">
<form>
<fieldset>
<legend><span class="number">1</span> Change password</legend>

<input type="text" name="userName" placeholder="User Name *" id="userName">
<input type="password" name="oldPassword" placeholder="Old Password *" id="oldPassword">
<input type="password" name="newPassword" placeholder="New Password *" id="newPassword">
<input type="password" name="confirmNewPassword" placeholder="Confirm New Password *" id="confirmNewPassword">
    
</fieldset>
<input type="button" name="Save" value="Save" onclick="changePassword()">
</form>
<br/>
${message}
</div>
</div>
</div>
</body>
</html>
