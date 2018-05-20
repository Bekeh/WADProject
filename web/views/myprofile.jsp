<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<jsp:include page="header.jsp" />  
<div id="page">

    <jsp:include page="slide.jsp"/>
    <h1>My Profile</h1>

    <div id="loginForm">
        <form action="myProfile" method="post">
            
            <div class="row">
                <input type="text" name="fullname" placeholder="Full Name" value="${sessionScope.USER.getFullName()}"/>
            </div> 
            <div class="row">
                <input type="text" name="cnp" placeholder="CNP" value="${sessionScope.USER.getCnp()}"/>
            </div>                
            <div class="row">
                <input type="email" name="email" placeholder="Email" value="${sessionScope.USER.getEmail()}"/>
            </div> 
            <div class="row">
                <input type="text" name="username" placeholder="Username" value="${sessionScope.USER.getUsername()}"/>
            </div>
            <div class="row">
                <input type="text"  name="telephone" placeholder="Telephone" value="${sessionScope.USER.getTelephone()}"/>
            </div>	
            
            <div class="row">
                <input type="text"  name="gender" placeholder="Gender" value="${sessionScope.USER.getGender()}"/>
            </div>	
                      
            <div class="row">
                <input type="text" name="university" placeholder="University" value="${sessionScope.USER.getUniversity()}"/>
            </div> 
            <div class="row">
                <input id="Year Of Study" placeholder="Year Of Study" onfocus="(this.type='date')" onblur="(this.type='text')" name="yearOfStudy" />
            </div> 
            <div class="row">
                <input id="Join Date" placeholder="Join Date" name="joinDate" onfocus="(this.type='date')" onblur="(this.type='text')"/>
            </div>             
            <div class="row">	
                <button type="submit"  value="Submit">Submit</button>
            </div>

        </form>
    </div>

</div>

<jsp:include page="footer.jsp"/>
