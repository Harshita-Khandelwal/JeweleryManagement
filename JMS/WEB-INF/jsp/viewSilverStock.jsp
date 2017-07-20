<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Jewellery Management System</title>
<%@ include file="/WEB-INF/jsp/common.jsp" %>
<style type="text/css">
.form-style-5{
	
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
.form-style-5 table {
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
.form-style-5 table:focus{
	background: #d2d9dd;
}
.form-style-5 table{
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

</style>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/jsp/header.jsp" %>
 <div id="page-wrapper">
</br></br>
<div class="form-style-5" style="height:700px;width: 800px;overflow:auto;overflow:scroll">
<fieldset>
<legend><span class="number">1</span> Silver Stock Details</legend>
</br>
<center>
<table cellpadding="10px" cellspacing="0px", border=1>
<tr>

	<th>Item Type</th>
	<th>Item Name</th>
	<th>Date Of Purchase</th>
	<th>Vendor Name</th>
	<th>Vendor Address</th>
	<th>Bill No</th>
	<th>Quantity</th>
	<th>Weight</th>
	<th>RatePerGram</th>
	<th>Amount</th>
	<th>Service Tax</th>
	<th>VAT Amount</th>
	<th>Any other Amount</th>
	<th>Total Amount</th>
	<th>Paid Amount</th>
	<th>Remaining Amount</th>
	<th>Action</th>
</tr>

<c:choose>
<c:when test="${addStockModels !=null && fn:length(addStockModels)>0}">
<c:forEach var="model" items="${addStockModels}" varStatus="counter">
<c:choose>
<c:when test="${model.itemType == 'Silver'}">
<tr>
	<td><c:out value="${model.itemType}"/></td>
	<td><c:out value="${model.addItemModel.itemName}"/></td>
	<td><c:out value="${model.dateOfPurchase}"/></td>
	<td><c:out value="${model.vendorName}"/></td>
	<td><c:out value="${model.vendorAddress}"/></td>
	<td><c:out value="${model.billNo}"/></td>
	<td><c:out value="${model.quantity}"/></td>
	<td><c:out value="${model.weight}"/></td>
	<td><c:out value="${model.ratePerGram}"/></td>
	<td><c:out value="${model.amount}"/></td>
	<td><c:out value="${model.serviceTax}"/></td>
	<td><c:out value="${model.vat}"/></td>
	<td><c:out value="${model.anyOtherAmount}"/></td>
	<td><c:out value="${model.totalAmount}"/></td>
	<td><c:out value="${model.paidAmount}"/></td>
	<td><c:out value="${model.remainingAmount}"/></td>
		<td><a href="<%=request.getContextPath()%>/getStock/${model.id}" >Update </a>&nbsp &nbsp
	<a href="<%=request.getContextPath()%>/deleteSilverStocks/${model.id}" > Delete</a></td>
</tr>
</c:when>
</c:choose>
</c:forEach>
</c:when>
</c:choose>
</table>
</center>
</fieldset>
</div>
${deleteMessage}
${updateMessage}
</div>
</div>
</body>
</html>