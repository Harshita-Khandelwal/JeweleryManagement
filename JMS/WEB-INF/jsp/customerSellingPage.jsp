<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Selling</title>
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
.tdspace {
	padding-right: 100px;
}
.sespace {
	padding-right: 20px;
}
</style>
<script>
function getItemListOnTheBasisOfItemType(itemType)	{
	var xml =null;
	params="";
	try {
		var activexmodes = [ "Msxml2.XMLHTTP", "Microsoft.XMLHTTP" ]; 
		if (window.ActiveXObject) {
			for ( var i = 0; i < activexmodes.length; i++) {
				try {
					xml = new ActiveXObject(activexmodes[i]);
				} 
				catch (e) {
				}
			}
		} 
		else if (window.XMLHttpRequest){ 
			xml = new XMLHttpRequest();
		}
		xml.onreadystatechange = function() {
			if (xml.readyState == 4) {
				if (xml.status == 200 || window.location.href.indexOf("http") == -1) {
					document.getElementById("itemNameDiv").innerHTML = xml.responseText;
				} 
			}
		};
		xml.open("POST", "getItemListOnTheBasisOfItemType/"+itemType, false);
		xml.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xml.send(params);
	} 
	catch (e) {
		alert(e);
	}
}	
function addCustomerSell()
{
var name=$('#name').val();
	var mobile =$('#mobile').val();
	var itemName=$('#itemId').val();
	var quantity =$('#quantity').val();
	var weight =$('#weight').val();
	var ratePerGram =$('#ratePerGram').val();
	alert("itemName:"+itemName)
	if(name=="")
	{
		alert("Please Enter Name");
		return false;
	}
	if(mobile=="")
	{
		alert("Please Enter Mobile No");
		return false;
	}
	if(itemName=="0")
			{
				alert("Please Select Item Name");
				return false;
			}
	if(quantity=="")
	{
		alert("Please Enter Quantity");
		return false;
	}
	if(weight=="")
	{
		alert("Please Enter Weight");
		return false;
	}
	if(ratePerGram=="")
	{
		alert("Please Enter Rate/Gram");
		return false;
	}
	alert("Saving !");
	document.forms[0].action="<%=request.getContextPath()%>/addCustomerSell";
	document.forms[0].method="post";
	document.forms[0].submit();
	
}
	$(document).ready(function() {
	    $("#quantity").keydown(function (e) {
		
	        // Allow: backspace, delete, tab, escape, enter 
	        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13]) !== -1 ||
	             // Allow: Ctrl+A, Command+A
	            (e.keyCode == 65 && ( e.ctrlKey === true || e.metaKey === true ) ) || 
	             // Allow: home, end, left, right, down, up
	            (e.keyCode >= 35 && e.keyCode <= 40)) {
	                 // let it happen, don't do anything
	                 return;
	        }
	        // Ensure that it is a number and stop the keypress
	        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
	            e.preventDefault();
	        }
	    });
	    
	    $("#weight").keydown(function (e) {
	        // Allow: backspace, delete, tab, escape, enter ,dot
	        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110,190]) !== -1 ||
	             // Allow: Ctrl+A, Command+A
	            (e.keyCode == 65 && ( e.ctrlKey === true || e.metaKey === true ) ) || 
	             // Allow: home, end, left, right, down, up
	            (e.keyCode >= 35 && e.keyCode <= 40)) {
	                 // let it happen, don't do anything
	                 return;
	        }
	        // Ensure that it is a number and stop the keypress
	        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
	            e.preventDefault();
	        }
	    });
		$("#ratePerGram").keydown(function (e) {
	        // Allow: backspace, delete, tab, escape, enter ,dot
	        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110,190]) !== -1 ||
	             // Allow: Ctrl+A, Command+A
	            (e.keyCode == 65 && ( e.ctrlKey === true || e.metaKey === true ) ) || 
	             // Allow: home, end, left, right, down, up
	            (e.keyCode >= 35 && e.keyCode <= 40)) {
	                 // let it happen, don't do anything
	                 return;
	        }
	        // Ensure that it is a number and stop the keypress
	        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
	            e.preventDefault();
	        }
	    });
		$("#makingcharge").keydown(function (e) {
	        // Allow: backspace, delete, tab, escape, enter ,dot
	        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110,190]) !== -1 ||
	             // Allow: Ctrl+A, Command+A
	            (e.keyCode == 65 && ( e.ctrlKey === true || e.metaKey === true ) ) || 
	             // Allow: home, end, left, right, down, up
	            (e.keyCode >= 35 && e.keyCode <= 40)) {
	                 // let it happen, don't do anything
	                 return;
	        }
	        // Ensure that it is a number and stop the keypress
	        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
	            e.preventDefault();
	        }
	    });
		$("#serviceTax").keydown(function (e) {
	        // Allow: backspace, delete, tab, escape, enter ,dot
	        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110,190]) !== -1 ||
	             // Allow: Ctrl+A, Command+A
	            (e.keyCode == 65 && ( e.ctrlKey === true || e.metaKey === true ) ) || 
	             // Allow: home, end, left, right, down, up
	            (e.keyCode >= 35 && e.keyCode <= 40)) {
	                 // let it happen, don't do anything
	                 return;
	        }
	        // Ensure that it is a number and stop the keypress
	        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
	            e.preventDefault();
	        }
	    });
		$("#vat").keydown(function (e) {
	        // Allow: backspace, delete, tab, escape, enter ,dot
	        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110,190]) !== -1 ||
	             // Allow: Ctrl+A, Command+A
	            (e.keyCode == 65 && ( e.ctrlKey === true || e.metaKey === true ) ) || 
	             // Allow: home, end, left, right, down, up
	            (e.keyCode >= 35 && e.keyCode <= 40)) {
	                 // let it happen, don't do anything
	                 return;
	        }
	        // Ensure that it is a number and stop the keypress
	        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
	            e.preventDefault();
	        }
	    });
		$("#anyOtherAmount").keydown(function (e) {
	        // Allow: backspace, delete, tab, escape, enter ,dot
	        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110,190]) !== -1 ||
	             // Allow: Ctrl+A, Command+A
	            (e.keyCode == 65 && ( e.ctrlKey === true || e.metaKey === true ) ) || 
	             // Allow: home, end, left, right, down, up
	            (e.keyCode >= 35 && e.keyCode <= 40)) {
	                 // let it happen, don't do anything
	                 return;
	        }
	        // Ensure that it is a number and stop the keypress
	        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
	            e.preventDefault();
	        }
	    });
	});

	function calculateAmount(){
	var weight= $('#weight').val()-0;
	var quantity= $('#quantity').val()-0;
	var ratePerGram= $('#ratePerGram').val()-0;
	var amount= (quantity*(weight*ratePerGram));
	$('#amount').val(amount);
	var makingCharge =$('#makingCharge').val()-0;
	var makingAmount= (quantity*(weight*makingCharge));
	$('#makingAmount').val(makingAmount);
	var serviceTax=$('#serviceTax').val()-0;
	var vat=$('#vat').val()-0;
	var anyOtherAmount=$('#anyOtherAmount').val()-0;
	var totalAmount= amount+makingAmount+serviceTax+vat+anyOtherAmount;
	$('#totalAmount').val(totalAmount);
	
}
</script>
</head>
<body>

<div id="wrapper">
		<%@ include file="/WEB-INF/jsp/header.jsp" %>
		
		
        <div id="page-wrapper">
<br/><br/>
	<div class="form-style-5">
<form>
<legend><center>Customer Selling Page</center></legend><br/><br/>
<fieldset>
<legend><span class="number">1</span> Customer Info</legend>
<input type="text" name="name" placeholder="Customer Name *" id="name" value="${customerSellModel.name}">
<input type="text" name="mobile" placeholder="Mobile No *" id="mobile" value="${customerSellModel.mobile}">
<input type="text" name="address" placeholder="Address *" id="address" value="${customerSellModel.address}">



<legend><span class="number">2</span> Add More Item</legend>

<table>
<tr>
<table ><tr>
	<th>Item Type</th>
	<th>Item Name</th></tr>
	<tr>
	<td class="sespace"><select id="itemType" name="itemType" onchange="getItemListOnTheBasisOfItemType(this.value)">
		<optgroup label="Itemtype">
		<option>---Select item Category---</option>
		<option value="Gold">Gold</option>
		<option value="Silver">Silver</option>
		<option value="Artificial">Artificial</option>
		</optgroup>
	</select> </td>
	<td> <div id="itemNameDiv">
	<select id="itemId" name="itemId">
		<optgroup label="ItemName">
		<option value="0" selected="selected">---Select---</option>
		</optgroup>
	</select> 
	</div>
		</td>
		</tr>
</table>
</tr>
<tr>
	<table cellspacing="10px" cellpadding="10px">
	<th>Quantity</th>
	<tr>
		<td><input type="text" id="quantity" name="quantity" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>
	</tr>
	</table>
</tr>
<tr>
	<table cellspacing="10px" cellpadding="10px">
	<th>Weight</th>
	<tr>
		<td><input type="text" id="weight" name="weight" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>
	</tr>
	</table>
</tr>
<tr>
<table>
	<th>RatePerGram</th>
	<th>Amount</th>
	<tr>
		<td class="tdspace"><input type="text" id="ratePerGram" name="ratePerGram" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>
		<td><input type="text" id="amount" name="amount" readOnly></td>
	</tr>
	</table>
</tr>
<tr>
<table>
	<th>Making Charge/Gram</th>
	<th>Making Amount</th>
	<tr>
		<td class="tdspace"><input type="text" id="makingCharge" onkeypress="calculateAmount()" onkeyup="calculateAmount()" name="makingCharge"></td>
		<td><input type="text" id="makingAmount" name="makingAmount" readOnly></td>
	</tr>
	</table>
</tr>
<tr>
<table>
	<th>Service Tax</th>
	<tr>
		<td><input type="text" id="serviceTax" name="serviceTax" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>
	</tr>
</table>
</tr>
<tr>
<table>
	<th>VAT Amount</th>
	<tr>
		<td><input type="text" id="vat" name="vat" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>
	</tr></table>
</tr>
<tr>
<table>
	<th>Any Other Amount</th>
	<th>Total Amount</th>
	<tr>
		<td class="tdspace"><input type="text" id="anyOtherAmount" onkeypress="calculateAmount()" onkeyup="calculateAmount()" name="anyOtherAmount"></td>
		<td><input type="text" id="totalAmount" name="totalAmount" readonly></td>
	</tr></table>
</tr>
${message}
</table>

<input type="button" value="Add"  name="addMoreItems" onclick="addCustomerSell()">
 <center>
<div style="width:400px;overflow:auto;overflow:scroll">
	<table border="2px" align="left" width="1050"  cellspacing="0px">
	<tr>
	<td>Item Type</td>
	<td>Item Name</td>
	<td>Quantity</td>
	<td>Weight</td>
	<td>Rate/Gram</td>
	<td>Amount</td>
	<td>Making Charge/Gram</td>
	<td>Service Tax</td>
	<td>VAT</td>
	<td>Any Other Amount</td>
	<td>Total Amount</td>
	<td>Action</td>
	</tr>
	<c:choose>
	<c:when test="${customerSellModelList_saved != null && fn:length(customerSellModelList_saved)>0}">
	<c:forEach var="model" items="${customerSellModelList_saved}" varStatus="counter">
	<tr>
		<td><c:out value="${model.itemType}"/></td>
		<td><c:out value="${model.itemId}"/></td>
		<td><c:out value="${model.quantity}"/></td>
		<td><c:out value="${model.weight}"/></td>
		<td><c:out value="${model.ratePerGram}"/></td>
		<td><c:out value="${model.amount}"/></td>
		<td><c:out value="${model.makingCharge}"/></td>
		<td><c:out value="${model.serviceTax}"/></td>
		<td><c:out value="${model.vat}"/></td>
		<td><c:out value="${model.anyOtherAmount}"/></td>
		<td><c:out value="${model.totalAmount}"/></td>
		<td><a href="<%=request.getContextPath()%>/deleteCustomerSell/<c:out value="${model.id}"/>">Delete</a></td>
	</tr>
	</c:forEach>
	</c:when>
	</c:choose>
	</table>
</div>
</center>
<input type="button" value="Save"  name="save" >

</fieldset>
</br>
${result}
</form>
</div>
</div>
</div>
</body>
</html>