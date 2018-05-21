<%-- 
    Document   : getStudents
    Created on : 17-May-2018, 19:36:36
    Author     : Alex Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/myjs.js" ></script>

        <title>JSP Page</title>
    </head>
    <body>
        <div id="searchUsers" class="slds-show slds-size_1-of-2 slds-align_absolute-center" style="height: 5rem;">

            <div class="slds-form slds-form_compound">
                <fieldset class="slds-form-element">
                    <div class="slds-form-element__group">
                        <div class="slds-form-element__row">
                            <div class="slds-form-element slds-size_4-of-6">
                                <div class="slds-form-element__control slds-input-has-icon slds-input-has-icon_right">

                                    <svg class="slds-icon slds-input__icon slds-input__icon_right slds-icon-text-default" aria-hidden="true">

                                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="./icons/utility-sprite/svg/symbols.svg#search" />

                                    </svg>

                                    <input value="" type="text" id="text-input-id-1" class="slds-input" placeholder="Enter a name" />

                                </div>
                            </div>
                            <div class="slds-form-element slds-size_2-of-6">
                                <button class="slds-button" onclick="searchUser()">Search</button>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </div>





        </div>



        <div id="usersTable" class="slds-show">
            <table id="userTable" class="slds-table slds-table_bordered slds-table_cell-buffer">
                <thead>
                    <tr class="slds-text-title_caps">
                        <th scope="col">
                            <div class="slds-truncate" title="No.">No.</div>
                        </th>
                        <th scope="col">
                            <div class="slds-truncate" title="Full Name">Full Name</div>
                        </th>
                        <th scope="col">
                            <div class="slds-truncate" title="Username">Username</div>
                        </th>
                        <th scope="col">
                            <div class="slds-truncate" title="Email">Email</div>
                        </th>
                        <th scope="col">
                            <div class="slds-truncate" title="Telephone">Telephone</div>
                        </th>
                        <th scope="col">
                            <div class="slds-truncate" title="Gender">Gender</div>
                        </th>
                        <th scope="col">
                            <div class="slds-truncate" title="Date of Birth">Date of Birth</div>
                        </th>
                        <th scope="col">
                            <div class="slds-truncate" title="University">University</div>
                        </th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach items="${sessionScope.USERS}" var="user" varStatus="loop">
                        <tr>
                            <th scope="row" data-label="Order">
                                <div id="count" class="slds-truncate">${loop.count}</div>
                            </th>
                            <th scope="row" data-label="Full Name">
                                <div class="slds-truncate">${user.fullName}</div>
                            </th>
                            <td data-label="Username">
                                <div class="slds-truncate"><a id ="editStudentLink" onclick="editUser(this.title)" title="${user.username}">${user.username}</a></div>
                            </td>
                            <td data-label="Email">
                                <div class="slds-truncate">${user.email}</div>
                            </td>
                            <td data-label="Telephone">
                                <div class="slds-truncate">${user.telephone}</div>
                            </td>
                            <td data-label="Gender">
                                <div class="slds-truncate">${user.gender}</div>
                            </td>
                            <td data-label="Date of Birth">
                                <div class="slds-truncate">${user.dateOfBirth}</div>
                            </td>
                            <td data-label="University">
                                <div class="slds-truncate">${user.university}</div>
                            </td>
                        </tr> 
                    </c:forEach>

                </tbody>
            </table>
        </div>

        <div id="editForm" class="slds-size_4-of-6" style="display: none">

            <form id="updateUser" autocomplete="off" onsubmit="updateUser();">
                <div class="slds-form slds-form_horizontal">

                    <div class="slds-form-element">
                        <label class="slds-form-element__label " for="fullname">Full Name</label>
                        <div class="slds-form-element__control">
                            <input type="text" name ="fullname" id="fullname" class="slds-input" placeholder="Full Name" value=""/>
                        </div>
                    </div>

                    <div class="slds-form-element">
                        <label class="slds-form-element__label" for="email">Email</label>
                        <div class="slds-form-element__control">
                            <input type="email" name ="email" id="email" class="slds-input" placeholder="Email" value=""/>
                        </div>
                    </div>

                    <div class="slds-form-element">
                        <label class="slds-form-element__label" for="role">Role</label>
                        <div class="slds-form-element__control">
                            <div class="slds-select_container">
                                <select name="role" class="slds-select" id="role">
                                    <option value="STUDENT">STUDENT</option>
                                    <option value="ADMIN">ADMIN</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="slds-form-element">
                        <label class="slds-form-element__label" for="gender">Gender</label>
                        <div class="slds-form-element__control">
                            <div class="slds-select_container">
                                <select name="gender" class="slds-select" id="gender">
                                    <option value="">Select a value</option>
                                    <option value="M">M</option>
                                    <option value="F">F</option>
                                </select>
                            </div>
                        </div>
                    </div>


                    <div class="slds-form-element">
                        <label class="slds-form-element__label" for="phone">Phone Number</label>
                        <div class="slds-form-element__control">
                            <input type="tel" name ="phone" id="phone" class="slds-input" placeholder="Phone Number" value=""/>
                        </div>
                    </div>

                    <div class="slds-form-element">
                        <label class="slds-form-element__label" for="cnp">CNP</label>
                        <div class="slds-form-element__control">
                            <input type="text" name ="cnp" id="cnp" class="slds-input" placeholder="CNP"/>
                        </div>
                    </div>

                    <div class="slds-form-element">
                        <label class="slds-form-element__label" for="university">University</label>
                        <div class="slds-form-element__control">
                            <input type="text" name ="university" id="university" class="slds-input" placeholder="University" value=""/>
                        </div>
                    </div>

                    <div class="slds-form-element">
                        <label class="slds-form-element__label" for="studentid">Student ID</label>
                        <div class="slds-form-element__control">
                            <input type="text"  name ="studentid" id="studentid" class="slds-input" placeholder="Student ID" value=""/>
                        </div>
                    </div>

                    <div class="slds-form-element">
                        <label class="slds-form-element__label" for="yearofstudy">Year of study</label>
                        <div class="slds-form-element__control">
                            <input type="number" name ="yearofstudy" id="yearofstudy" class="slds-input" placeholder="Year of study" value=""/>
                        </div>
                    </div>

                    <div class="slds-form-element">
                        <label class="slds-form-element__label" for="birthdate">Birth date</label>
                        <div class="slds-form-element__control">
                            <input type="date" name ="birthdate" id="birthdate" class="slds-input" placeholder="Birth date" value=""/>
                        </div>
                    </div>

                    <div class="slds-form-element">
                        <label class="slds-form-element__label" for="completeprofile">Complete profile?</label>
                        <div class="slds-form-element__control">
                            <input type="checkbox" name ="completeprofile" id="completeprofile" class="slds-input" checked=""/>
                        </div>
                    </div>

                    <div class="slds-form-element slds-align_absolute-center">
                        <div class="slds-button-group" role="group">
                            <div class="slds-form-element__control ">
                                <input type="submit" class="slds-button slds-button_outline-brand" value="Update">
                            </div>
                            <div class="slds-form-element__control ">
                                <input type="button" class="slds-button slds-button_destructive" value="Delete">
                            </div>
                        </div>
                    </div>







                </div>
            </form>

        </div>
    </body>
</html>
