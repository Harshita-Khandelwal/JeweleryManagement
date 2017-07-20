<%@ page language="java" %>
<div class="navbar-default sidebar" role="navigation">
     <div class="sidebar-nav navbar-collapse">
         <ul class="nav" id="side-menu">
             <li class="sidebar-search">
                 <div class="input-group custom-search-form">
                     <input type="text" class="form-control" placeholder="Search...">
                     <span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-search"></i> </button></span>
                 </div>
             </li>
             <li>
                 <a href="<%=request.getContextPath()%>/loadDashboard"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
             </li>
             <li>
                 <a href="#"><i class="fa fa-signal fa-fw"></i> Masters<span class="fa arrow"></span></a>
                 <ul class="nav nav-second-level">
                     <li><a href="<%=request.getContextPath()%>/loadPageOnMenuClick/addNewItemCategory">Add Items </a></li>
                     <li><a href="<%=request.getContextPath()%>/showItems">Show Items </a></li>
                 </ul>
                 <!-- /.nav-second-level -->
           </li>
           <li>
               <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Stock<span class="fa arrow"></span></a>
               <ul class="nav nav-second-level">
                   <li>
                       <a href="<%=request.getContextPath()%>/loadStockPage">Add Items In Stock </a>
                   </li>
                   <li>
                       <a href="<%=request.getContextPath()%>/showStockItems">Show Items Stock</a>
                   </li>
               </ul>
               <!-- /.nav-second-level -->
                </li>
			<li>
               <a href="#"><i class="fa fa-inr fa-fw"></i> Customer Transaction<span class="fa arrow"></span></a>
               <ul class="nav nav-second-level">
                   <li>
                       <a href="<%=request.getContextPath()%>/loadCustomerSellPage"> Customer Sell </a>
                   </li>
                   <li>
                       <a href="<%=request.getContextPath()%>/showCustomerSellDetails"> Show Customer Sell Details </a>
                   </li>
               </ul>
               <!-- /.nav-second-level -->
                </li>
            </ul>
        </div>
</div>