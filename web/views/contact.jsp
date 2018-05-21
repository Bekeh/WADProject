<script>
function myFunction() {
    alert("Quuery Submited Succesfully");
}
</script>
	<jsp:include page="header.jsp" />  
		<div id="page">

			<jsp:include page="slide.jsp"/>
		
    <h1>ContactUS</h1>
               <div id="loginForm">
       		<form action="ContactCtl" method="post">
    		
    		<div class="row">
    			<input type="text" name="name" placeholder="Name"/>
  			</div> 
  			
  			<div class="row">
    			<input type="text" name="email" placeholder="Email"/>
  			</div> 
  			  
  			<div class="row">
    			<textarea  name="textMsg" placeholder="Message..."></textarea>
  			</div> 
		
			
  			<div class="row">	
    			<button type="submit"  value="Login" >Submit</button>
			</div>
			
		
 </form>
 </div>
 </div>

 <jsp:include page="footer.jsp"/>