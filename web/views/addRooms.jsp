<%-- 
    Document   : addRooms
    Created on : 21-May-2018, 10:11:53
    Author     : Alex Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" /> 
<!DOCTYPE html>
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
            <c:if test="${requestScope.ACTION == 'ADD'}">
                <div id="addRoomForm" class="slds-size_5-of-6 slds-align_absolute-center" >
                    <form class="" action="rooms" method="post">
                        <div class="slds-form-element">
                            <label class="slds-form-element__label " for="size">Room Size</label>
                            <div class="slds-form-element__control">
                                <input type="number" name ="size" id="size" class="slds-input" placeholder="Room Size" value=""/>
                            </div>
                        </div>

                        <div class="slds-form-element">
                            <label class="slds-form-element__label " for="rnumber">Room Number</label>
                            <div class="slds-form-element__control">
                                <input type="rnumber" name ="rnumber" id="rnumber" class="slds-input" placeholder="Room Number" value=""/>
                            </div>
                        </div>

                        <div class="slds-form-element slds-align_absolute-center" style="height: 5rem;">

                            <div class="slds-form-element__control ">
                                <input type="submit" class="slds-button slds-button_outline-brand" value="Add">
                            </div>

                        </div>

                    </form>
                </div>
            </c:if>
            <c:if test="${requestScope.ACTION == 'VIEW'}">
                <div id="viewRooms" class="slds-size_5-of-6 slds-align_absolute-center">
                    <table id="roomsTable" class="slds-table slds-table_bordered slds-table_cell-buffer">
                        <thead>
                            <tr class="slds-text-title_caps">
                                <th scope="col">
                                    <div class="slds-truncate" title="Room No.">No.</div>
                                </th>
                                <th scope="col">
                                    <div class="slds-truncate" title="Room Id">Room Id</div>
                                </th>
                                <th scope="col">
                                    <div class="slds-truncate" title="Room Size">Room Size</div>
                                </th>
                                <th scope="col">
                                    <div class="slds-truncate" title="Room Number">Room Number</div>
                                </th>
                                <th scope="col">
                                    <div class="slds-truncate" title="Is Full?">Is Full?</div>
                                </th>
                                <th scope="col">
                                    <div class="slds-truncate" title="Inhibitants">Inhibitants</div>
                                </th>
                                
                            </tr>
                        </thead>
                        <tbody>

                            <c:forEach items="${sessionScope.ROOMS}" var="room" varStatus="loop">
                                <tr>
                                    <td data-label="Order">
                                        <div id="count" class="slds-truncate">${loop.count}</div>
                                    </td>
                                    <td data-label="Room Id">
                                        <div class="slds-truncate">${room.id}</div>
                                    </td>
                                    <td data-label="Room Size">
                                        <div class="slds-truncate">${room.size}</div>
                                    </td>
                                    <td data-label="Room Number">
                                        <div class="slds-truncate">${room.roomNumber}</div>
                                    </td>
                                    <td data-label="Is Full?">
                                        <div class="slds-truncate">${room.isFull}</div>
                                    </td>
                                    <td data-label="Inhibitants">
                                        <div class="slds-truncate">${room.studentsToString}</div>
                                    </td>
                                </tr> 
                            </c:forEach>

                        </tbody>
                    </table>

                </div>
            </c:if>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
