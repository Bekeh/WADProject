<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<jsp:include page="header.jsp" />  
<div id="page">

    <jsp:include page="slide.jsp"/>
    <h1>JoinUs:</h1>

    <div id="loginForm">
        <form action="register" method="post">
            <c:if test="${requestScope.errors != null}">
                <c:out value="${requestScope.errors}"/>
            </c:if>
            <div class="row">
                <input type="text" name="name" placeholder="FullName" value="${sessionScope.USER.getFullName()}"/>
            </div>
            <div class="row">
                <input type="email" name="email" placeholder="Email" value="${sessionScope.USER.getEmail()}"/>
            </div> 
            <div class="row">
                <input type="text" name="username" placeholder="Username"/>
            </div>


            <!--
                        <div class="row">
                            <input type="text"  name="phoneNumber" placeholder="PhoneNumber"/>
                        </div>	
            
                        <div class="row">
                            <input type="text"  name="gender" placeholder="Gender"/>
                        </div>	
            
                        <div class="row">
                            <input type="text" name="joinDate" placeholder="JoinDate"/>
                        </div> 
            
                        <div class="row">
                            <input type="text" name="address" placeholder="Address"/>
                        </div> 
            -->
            <div class="row">
                <input type="password" name="password" placeholder="Password"/>
            </div> 


            <div class="row">	
                <button type="submit"  value="Register">Register</button>
            </div>

        </form>
    </div>

</div>

<jsp:include page="footer.jsp"/>