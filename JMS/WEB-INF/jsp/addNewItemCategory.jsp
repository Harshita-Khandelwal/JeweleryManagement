<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Jewellery Management System</title>
<%@ include file="/WEB-INF/jsp/common.jsp" %>
<script>
function saveAddNewItem()
{
	alert("");
	var itemName=$('#itemName').val();
	var itemCode =$('#itemCode').val();
	var itemType =$('#itemType').val();
	alert("itemName:"+itemName);
	if(itemName=="")
	{
		alert("Please Enter Item Name");
		return false;
	}
	if(itemCode=="")
	{
		alert("Please Enter Item Code");
		return false;
	}
	if(itemType=="0")
	{
		alert("Please Select Item Type");
		return false;
	}
	
	alert("Saving!");
	document.forms[0].action="<%=request.getContextPath()%>/saveAddNewItem";
	document.forms[0].method="post";
	document.forms[0].submit();
	
}</script>
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

</head>
<body background=#AEE4FF>
<div id="wrapper">
		<%@ include file="/WEB-INF/jsp/header.jsp" %>
      <div id="page-wrapper">
      </br></br>
<div class="form-style-5">
<form>
<fieldset>
<legend><span class="number">1</span> Add New Item Category</legend>
<input type="text" name="itemName" placeholder="Item Name *" id="itemName">
<input type="text" name="itemCode" placeholder="Item Code *" id="itemCode">
<label for="itemType">ItemType:</label>

<select id="itemType" name="itemType">
	<optgroup label="ItemType">
	<option value="0" >---Select item Category---</option>
	<option value="Gold">Gold</option>
	<option value="Silver">Silver</option>
	<option value="Artificial">Artificial</option>
	</optgroup>
</select>      
</fieldset>
<input type="button" name="Save" value="Save" onclick="saveAddNewItem()">
</br>
${result}
</form>
</div>
</div>
</div>
</body>
</html>