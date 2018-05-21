<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<link rel="stylesheet" href="salesforce-lightning-design-system.css" type="text/css">

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script
    src="http://code.jquery.com/jquery-2.2.4.js"
    integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
crossorigin="anonymous"></script>
<script type="text/javascript" src="js/myjs.js" ></script>


<jsp:include page="header.jsp" flush="true"/>  
<div id="page">


    <%-- if a user is logged in --%>
    <c:if test="${sessionScope.USER != null}">

        <%-- if student --%>
        <c:if test="${sessionScope.USER.getRole() == 'STUDENT'}">

            <%-- if profile completed --%>
            <c:if test="${sessionScope.USER.isCompleteProfile() == true}">

            </c:if>

            <%-- if profile not completed --%>
            <c:if test="${sessionScope.USER.isCompleteProfile() == false}">
                <h2>Hello, ${sessionScope.USER.getFullName()}</h2>
                <h3>In order to request a room and use the full functionality of the platform, please complete your profile.</h3>
                <form action="myProfile" method="get">
                    <h4>Click the button bellow to go to your profile</h4>
                    <div class="row">	
                        <button class="slds-button slds-button_outline-brand" type="submit"  value="myProfile">My Profile</button>
                    </div>
                </form>

            </c:if>


        </c:if>

        <%-- if admin --%>
        <c:if test="${sessionScope.USER.getRole() == 'ADMIN'}">

            <div class="slds-button-group slds-align_absolute-center" style="height: 5rem;" role="group">
                <button id="buttonOne" class="slds-button slds-button_neutral" onclick="helper(this.id)">View Requests</button>
                <button id="buttonTwo" class="slds-button slds-button_neutral" onclick="helper(this.id)">View Users</button>
                <button id="buttonThree" class="slds-button slds-button_neutral"><a href="rooms?STATUS=add">Add a room</a></button>
                <button id="buttonFour" class="slds-button slds-button_neutral" onclick="helper(this.id)">Allot a room</button>
                <button id="buttonFive" class="slds-button slds-button_neutral"><a href="rooms?STATUS=view">View Rooms</a></button>
            </div>

            <div id="contentBox" class="slds-box slds-m-around_small">
                <div id="content" class="slds-show"></div>

                <div id="spinnerDiv" class="slds-hide" style="height: 1rem;">
                    <div class="slds-spinner_container slds-is-fixed">
                        <div role="status" class="slds-spinner slds-spinner_large">
                            <span class="slds-assistive-text">Loading</span>
                            <div class="slds-spinner__dot-a"></div>
                            <div class="slds-spinner__dot-b"></div>
                        </div>
                    </div>
                </div>


                <div class="modal fade" id="your-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">

                            </div>
                            <div class="modal-body">

                            </div>
                        </div>
                    </div>
                </div>


                <div id="successMsg">


                    <div class="demo-only slds-hide" style="height: 640px;">
                        <section role="dialog" tabindex="-1" aria-labelledby="modal-heading-01" aria-modal="true" aria-describedby="modal-content-id-1" class="slds-modal slds-fade-in-open">
                            <div class="slds-modal__container">

                                <div class="slds-modal__content" id="modal-content-id-1">

                                    <div class="slds-notify_container slds-is-relative">
                                        <div class="slds-notify slds-notify_toast slds-theme_success" role="alert">

                                            <span class="slds-icon_container slds-icon-utility-success slds-m-right_small slds-no-flex slds-align-top" title="Description of icon when needed">
                                                <svg class="slds-icon slds-icon_small" aria-hidden="true">
                                                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="./icons/utility-sprite/svg/symbols.svg#success" />
                                                </svg>
                                            </span>
                                            <div class="slds-notify__content">
                                                <h2 class="slds-text-heading_small ">Account <a href="javascript:void(0);">ACME - 100</a> widgets was created.</h2>
                                            </div>
                                            <button class="slds-button slds-button_icon slds-notify__close slds-button_icon-inverse" title="Close">
                                                <svg class="slds-button__icon slds-button__icon_large" aria-hidden="true">
                                                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="./icons/utility-sprite/svg/symbols.svg#close" />
                                                </svg>
                                                <span class="slds-assistive-text">Close</span>
                                            </button>
                                        </div>
                                    </div>



                                </div>
                            </div>
                        </section>
                        <div class="slds-backdrop slds-backdrop_open"></div>
                    </div>



                    <div class="demo-only slds-hide" style="height: 4rem;">
                        <div class="slds-notify_container slds-is-relative">
                            <div class="slds-notify slds-notify_toast slds-theme_success" role="alert">

                                <span class="slds-icon_container slds-icon-utility-success slds-m-right_small slds-no-flex slds-align-top" title="Description of icon when needed">
                                    <svg class="slds-icon slds-icon_small" aria-hidden="true">
                                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="./icons/utility-sprite/svg/symbols.svg#success" />
                                    </svg>
                                </span>
                                <div class="slds-notify__content">
                                    <h2 class="slds-text-heading_small ">Account <a href="javascript:void(0);">ACME - 100</a> widgets was created.</h2>
                                </div>
                                <button class="slds-button slds-button_icon slds-notify__close slds-button_icon-inverse" title="Close">
                                    <svg class="slds-button__icon slds-button__icon_large" aria-hidden="true">
                                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="./icons/utility-sprite/svg/symbols.svg#close" />
                                    </svg>
                                    <span class="slds-assistive-text">Close</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </c:if>

    </c:if>

    <%-- if admin --%>


    <%-- if none is logged in --%>
    <c:if test="${sessionScope.USER == null}">
        <jsp:include page="slide.jsp"/>
        <div id="loginForm">
            <form action="login" method="post">

                <div class="row">
                    <input type="text" name="username" placeholder="Email"/>
                </div> 

                <div class="row">
                    <input type="password"  name="password" placeholder="Password"/>
                </div>	

                <div class="row">	
                    <button type="submit"  value="Login">Login</button>
                </div>	 

            </form>
        </div>
    </c:if>



</div>

<jsp:include page="footer.jsp"/>