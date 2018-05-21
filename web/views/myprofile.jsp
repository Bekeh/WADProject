<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" /> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/myjs.js" ></script>
        <link rel="stylesheet" href="salesforce-lightning-design-system.css" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>


        <div id="page">

            <jsp:include page="slide.jsp"/>
            <h1>My Profile</h1>

            <div id="editForm" class="slds-size_5-of-6 slds-align_absolute-center">
                <div class="">
                    <form class="" action="myProfile" method="post">

                        <div class="slds-form-element">
                            <label class="slds-form-element__label " for="fullname">Full Name</label>
                            <div class="slds-form-element__control">
                                <input type="text" name ="fullname" id="fullname" class="slds-input" placeholder="Full Name" value="${sessionScope.USER.fullName}"/>
                            </div>
                        </div>

                        <div class="slds-form-element">
                            <label class="slds-form-element__label" for="email">Email</label>
                            <div class="slds-form-element__control">
                                <input type="email" name ="email" id="email" class="slds-input" placeholder="Email" value="${sessionScope.USER.email}"/>
                            </div>
                        </div>
                        <div class="slds-form-element">
                            <label class="slds-form-element__label" for="cnp">CNP</label>
                            <div class="slds-form-element__control">
                                <input type="text" name ="cnp" id="cnp" class="slds-input" placeholder="CNP" value="${sessionScope.USER.cnp}"/>
                            </div>
                        </div>

                        <div class="slds-form-element">
                            <label class="slds-form-element__label" for="phone">Phone Number</label>
                            <div class="slds-form-element__control">
                                <input type="tel" name ="telephone" id="phone" class="slds-input" placeholder="Phone Number" value="${sessionScope.USER.telephone}"/>
                            </div>
                        </div>


                        <div class="slds-form-element">
                            <label class="slds-form-element__label" for="gender">Gender</label>
                            <div class="slds-form-element__control">
                                <div class="slds-select_container">
                                    <select name="gender" class="slds-select" id="gender">
                                        <option value="${sessionScope.USER.gender}">Select a value</option>
                                        <option value="M">M</option>
                                        <option value="F">F</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="slds-form-element">
                            <label class="slds-form-element__label" for="university">University</label>
                            <div class="slds-form-element__control">
                                <input type="text" name ="university" id="university" class="slds-input" placeholder="University" value="${sessionScope.USER.university}"/>
                            </div>
                        </div>	
                        <div class="slds-form-element">
                            <label class="slds-form-element__label" for="studentid">Student ID</label>
                            <div class="slds-form-element__control">
                                <input type="text"  name ="studentid" id="studentid" class="slds-input" placeholder="Student ID" value="${sessionScope.USER.studentId}"/>
                            </div>
                        </div>


                        <div class="slds-form-element">
                            <label class="slds-form-element__label" for="yearofstudy">Year of study</label>
                            <div class="slds-form-element__control">
                                <input type="number" name ="yearOfStudy" id="yearofstudy" class="slds-input" placeholder="Year of study" value="${sessionScope.USER.yearOfStudy}"/>
                            </div>
                        </div>

                        <div class="slds-form-element">
                            <label class="slds-form-element__label" for="birthdate">Birth date</label>
                            <div class="slds-form-element__control">
                                <fmt:formatDate value="${sessionScope.USER.dateOfBirth}" pattern="yyyy-MM-dd" var="myDate" />
                                <input  type="date" name="birthdate" id="birthdate" class="slds-input" placeholder="Birth date" value = "${myDate}"/>
                            </div>
                        </div>


                        <div class="slds-form-element slds-align_absolute-center" style="height: 5rem;">
                            <div class="slds-button-group" role="group">
                                <div class="slds-form-element__control ">
                                    <input type="submit" class="slds-button slds-button_outline-brand" value="Update">
                                </div>
                                <div class="slds-form-element__control ">
                                    <input type="reset" class="slds-button slds-button_destructive" value="Reset">
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>

        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>