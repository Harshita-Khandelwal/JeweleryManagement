<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<%@ include file="/WEB-INF/jsp/common.jsp" %>
</head>


<body>

    <div id="wrapper">
		<%@ include file="/WEB-INF/jsp/header.jsp" %>
		
		
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12"><h3 class="page-header">Dashboard</h3></div>
	        </div>
            <div class="row">
                <div class="col-lg-3 col-md-6" style="display:none">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">26</div>
                                    <div>New Comments!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-asterisk fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
								<%! int i; %>
								<c:choose>
									<c:when test="${addStockModels !=null && fn:length(addStockModels)>0}">
										<% i=0;%>
										<c:forEach var="model" items="${addStockModels}" varStatus="counter">
											<c:choose>
												<c:when test="${model.itemType == 'Gold'}">
													<%i++;%>
												</c:when>
											</c:choose>
										</c:forEach>
									</c:when>
								</c:choose>
                                    <div class="huge"><%= i%></div>
									<div>GOLD</div>
                                </div>
                            </div>
                        </div>
                        <a href="<%=request.getContextPath()%>/viewGoldStock">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-star fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <%! int j; %>
								<c:choose>
									<c:when test="${addStockModels !=null && fn:length(addStockModels)>0}">
										<% j=0;%>
										<c:forEach var="model" items="${addStockModels}" varStatus="counter">
											<c:choose>
												<c:when test="${model.itemType == 'Silver'}">
													<%j++;%>
												</c:when>
											</c:choose>
										</c:forEach>
									</c:when>
								</c:choose>
                                    <div class="huge"><%= j%></div>
									<div>Silver</div>
                                </div>
                            </div>
                        </div>
                        <a href="<%=request.getContextPath()%>/viewSilverStock">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-certificate fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <%! int k; %>
								<c:choose>
									<c:when test="${addStockModels !=null && fn:length(addStockModels)>0}">
										<% k=0;%>
										<c:forEach var="model" items="${addStockModels}" varStatus="counter">
											<c:choose>
												<c:when test="${model.itemType == 'Artificial'}">
													<%k++;%>
												</c:when>
											</c:choose>
										</c:forEach>
									</c:when>
								</c:choose>
                                    <div class="huge"><%= k%></div>
									<div>Artificial</div>
                                </div>
                            </div>
                        </div>
                        <a href="<%=request.getContextPath()%>/viewArtificialStock">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
          </div>
           
           
</div>

</body>

</html>
