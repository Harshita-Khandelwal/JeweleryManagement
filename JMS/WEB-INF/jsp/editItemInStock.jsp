<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Jewellery Management System</title>
<%@ include file="/WEB-INF/jsp/common.jsp" %>

<script>
	
	function pageOnLoad(){
		$('#itemType').val('${addStockModel.itemType}');
		getItemListOnTheBasisOfItemType('${addStockModel.itemType}');
		$('#itemId').val('${addStockModel.itemId}');
		$('#dateOfPurchase').val('${addStockModel.dateOfPurchase}');
		$('#vendorName').val('${addStockModel.vendorName}');
		$('#vendorAddress').val('${addStockModel.vendorAddress}');
		$('#billNo').val('${addStockModel.billNo}');
		$('#quantity').val('${addStockModel.quantity}');
		$('#weight').val('${addStockModel.weight}');
		$('#ratePerGram').val('${addStockModel.ratePerGram}');
		$('#amount').val('${addStockModel.amount}');
		$('#serviceTax').val('${addStockModel.serviceTax}');
		$('#vat').val('${addStockModel.vat}');
		$('#anyOtherAmount').val('${addStockModel.anyOtherAmount}');
		$('#totalAmount').val('${addStockModel.totalAmount}');
		$('#paidAmount').val('${addStockModel.paidAmount}');
		$('#remainingAmount').val('${addStockModel.remainingAmount}');
		$('#remarks').val('${addStockModel.remarks}');
			
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
		$("#paidAmount").keydown(function (e) {
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
	
function updateStocks()
{
	var itemName=$('#itemId').val();
	var dateOfPurchase =$('#dateOfPurchase').val();
	var vendorName =$('#vendorName').val();
	var vendorAddress =$('#vendorAddress').val();
	var quantity =$('#quantity').val();
	var weight =$('#weight').val();
	var ratePerGram =$('#ratePerGram').val();
	
	if(itemName=="0")
			{
				alert("Please Select Item Name");
				return false;
			}
	if(dateOfPurchase=="")
	{
		alert("Please Select Date Of Purchase");
		return false;
	}
	if(vendorName=="")
	{
		alert("Please Enter Vendor Name");
		return false;
	}
	if(vendorAddress=="")
	{
		alert("Please Enter Vendor Address");
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
	document.forms[0].action="<%=request.getContextPath()%>/updateStocks/"+id;
	document.forms[0].method="post";
	document.forms[0].submit();
	
}
$(function() {
	$("#dateOfPurchase").datepicker({
		dateFormat: "dd/mm/yy",
		changeMonth: true,
		changeYear: true
	});
});



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
		xml.open("POST", "<%=request.getContextPath()%>/getItemListOnTheBasisOfItemType/"+itemType, false);
		xml.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xml.send(params);
	} 
	catch (e) {
		alert(e);
	}
}	
function calculateAmount(){
	var weight= $('#weight').val()-0;
	var quantity= $('#quantity').val()-0;
	var ratePerGram= $('#ratePerGram').val()-0;
	var amount= (quantity*(weight*ratePerGram));
	$('#amount').val(amount);
	var serviceTax=$('#serviceTax').val()-0;
	var vat=$('#vat').val()-0;
	var anyOtherAmount=$('#anyOtherAmount').val()-0;
	var totalAmount= amount+serviceTax+vat+anyOtherAmount;
	$('#totalAmount').val(totalAmount);
	var paidAmount=$('#paidAmount').val()-0;
	var remainingAmount=totalAmount-paidAmount;
	$('#remainingAmount').val(remainingAmount);
	
}

</script>
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
<body onload="pageOnLoad()">
<div id="wrapper">
		<%@ include file="/WEB-INF/jsp/header.jsp" %>
		
		
        <div id="page-wrapper">
         </br></br>
<div class="form-style-5">
<form>
<fieldset>
<legend> Update Item Details In Stock</legend>
<legend><span class="number">1</span>Item Info</legend>
<label for="itemType">ItemType:</label>

<select id="itemType" name="itemType" onchange="getItemListOnTheBasisOfItemType(this.value)">
	<optgroup label="Itemtype">
	<option>---Select item Category---</option>
	<option value="Gold">Gold</option>
	<option value="Silver">Silver</option>
	<option value="Artificial">Artificial</option>
	</optgroup>
</select> 
 
 <div id="itemNameDiv">
 <label for="itemId">ItemName:</label>
<select id="itemId" name="itemId">
	<optgroup label="ItemName">
	<option value="0" selected="selected">---Select---</option>
	</optgroup>
</select> 
</div>


<legend><span class="number">2</span>Purchase Info</legend>
<input type="text" name="dateOfPurchase" placeholder="Date Of Purchase *" id="dateOfPurchase" readOnly>
<input type="text" name="vendorName" placeholder="Vendor Name *" id="vendorName">
<input type="text" name="vendorAddress" placeholder="Vendor Address *" id="vendorAddress">
<input type="text" name="billNo" placeholder="Bill No *" id="billNo">

<legend><span class="number">3</span>Transaction Info</legend>
<input type="text" name="quantity" placeholder="Quantity *" id="quantity" onkeypress="calculateAmount()" onkeyup="calculateAmount()">
<input type="text" name="weight" placeholder="Weight In Gm *" id="weight" onkeypress="calculateAmount()" onkeyup="calculateAmount()">
<input type="text" name="ratePerGram" placeholder="Rate/Gram *" id="ratePerGram" onkeypress="calculateAmount()" onkeyup="calculateAmount()">
<input type="text" name="amount" placeholder="Amount *" id="amount" readOnly>

<legend><span class="number">4</span>Other</legend>
<input type="text" name="serviceTax" placeholder="Service Tax *" id="serviceTax" onkeypress="calculateAmount()" onkeyup="calculateAmount()">
<input type="text" name="vat" placeholder="vat *" id="vat" onkeypress="calculateAmount()" onkeyup="calculateAmount()">
<input type="text" name="anyOtherAmount" placeholder="Any Other Amount *" id="anyOtherAmount" onkeypress="calculateAmount()" onkeyup="calculateAmount()">
<input type="text" name="totalAmount" placeholder="Total Amount *" id="totalAmount" class="form-c" readOnly>
<input type="text" name="paidAmount" placeholder="Paid Amount *" id="paidAmount" onkeypress="calculateAmount()" onkeyup="calculateAmount()">
<input type="text" name="remainingAmount" placeholder="Remaining Amount *" id="remainingAmount" readOnly >

<legend><span class="number">5</span>Other Info</legend>
<input type="text" name="remarks" placeholder="Remarks *" id="remarks">
    

</fieldset>
<input type="button" name="update" value="update" onclick="updateStocks(${addStockModel.id})">
</form>

</div>
</div>
</div>
</body>
</html>
