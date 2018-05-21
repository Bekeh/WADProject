<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.hostel.mgt.bean.RoomBean" %>
    <%@page import="java.util.*"%>
    <%@page import="com.hostel.mgt.model.RoomModel" %>
    
<jsp:include page="header.jsp" />



<div id="admin">
<div id="roomBtn">
	<form action="RoomCtl" method="post">
	<input type="hidden" name="param" value="roomDetails" >
    <input type="submit" value="Room Details" id="btn">
	</form>
</div>
<div id="roomBtn">
	
    <form action="RoomCtl" method="post">
    <input type="hidden" name="param" value="AddNewRoom" >
    <button>Add New Room  </button>	
	</form>
</div>
<div id="roomBtn">
	<form action="RoomCtl" method="post">
	  <input type="hidden" name="param" value="AllotARoom" >
    <button>Allot A Room </button>	
	</form>
</div>
</div>

<div id="roomData">
<%
String s1 = request.getParameter("var");
//out.println(s1);
if(s1.equals("roomDetails")){
RoomBean rb = new RoomBean();
ArrayList<RoomBean> al =new ArrayList<RoomBean>();

RoomModel rm = new RoomModel();
al = rm.availbleRoom();
//out.println("Complete Room Details");
%><br><div style="margin-left: 500px;"><% 
for(int i=0;i<al.size();i++) {
	out.println(al.get(i).getRoomNumber()+" " +al.get(i).getAllotTo()+" "+al.get(i).getFromDate());
	%>
	<br>
	<br>
	<% 
}}else if(s1.equals("AddNewRoom")){
	
	%></div>
	<div id="loginForm">
       		<form action="RoomCtl" method="post">
        
		<div class="row">
		        <input type="hidden" name="param" value="AddNewR"/>
    			<input type="text" name="roomNumber" placeholder="Enter Room Number"/>
  			</div> 
  			  			
  			<div class="row">	
    			<button type="submit"  value="Login" >Submit</button>
		</div>
	
 </form>
 </div>
	
	<% 
	
}else if(s1.equals("AllotARoom")){
	%>
	 <div id="loginForm">
       		<form action="RoomCtl" method="post">
    		<div class="row">
    		    <input type="hidden" name="param" value="allotR"/>
    			<input type="text" name="roomNumber" placeholder="Room Number"/>
  			</div> 
  			
    		<div class="row">
    			<input type="text" name="name" placeholder="Student Name"/>
  			</div> 
  			
  			<div class="row">
    			<input type="text" name="allotDate" placeholder="Allot Date"/>
  			</div> 
  			
  			<div class="row">
    			<input type="text" name="email" placeholder="Student's email"/>
  			</div> 
  			  			
  			<div class="row">	
    			<button type="submit"  value="Login" >Submit</button>
			</div>

 </form>
 </div>
	
	<%
}else if(s1.equals("dataInserted")){
	
	out.println("Data is inserted Sucessfully........");
}
%>

</div>