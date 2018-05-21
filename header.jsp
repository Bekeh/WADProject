<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Hostel Management by upb</title>
        <link href="sliderResponsive.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="style.css" type="text/css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js" ></script>
        <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">


        <script>
            $(document).ready(function () {

                $("#menu-toggle").click(function () {

                    $("#menu-wrapper").slideToggle('fast');
                });

            });
        </script>


        <style>

            #slider2 {
                max-width: 30%;
                margin-right: 20px;
            }

            .row2Wrap {
                display: flex;
            }

            .content {
                padding: 50px;
                margin-bottom: 100px;
            }

            html {
                height: 100%;
                box-sizing: border-box;
            }
            *, *:before, *:after {
                box-sizing: inherit;
            }
            h1, h2, h3 {
                font-family: 'Crimson Text', sans-serif;
                font-weight: 100;
            }
            body {
                font: 15px 'Titillium Web', Arial, sans-serif;
                background: radial-gradient(#121212, #000);
                height: 100%;
                color: #aaa;
                margin: 0;
                padding: 0;
            }

            .content {
                padding: 10px 15vw;
            }
        </style>

    </head>
    <body>
        <div id="header">

            <div id="logo">
                <a href="views/index.jsp"><img src="images/hostel_logo.png" alt="LOGO" height="112" width="118"></a>
            </div>
            <c:if test="${sessionScope.USER != null}">
                <div style="clear: both; float: right; margin-right: 25px; padding-bottom: 10px; margin-top: -35px;">
                    <a href="logout">Logout</a>
                </div>
            </c:if>


            <div id="navigation" >
                <a href="#" id="menu-toggle">Menu</a>
                <ul id="menu-wrapper">
                    <li class="selected">
                        <a href="">Home</a>
                    </li>
                    <li>
                        <a href="">About</a>
                    </li>
                    <li>
                        <a href="">Rooms</a>
                    </li>

                    <li>
                        <a href="">Food</a>
                    </li>
                    <li>
                        <a href="register">Join Us</a>
                    </li>
                    <li>
                        <a href="">Contact</a>
                    </li>
                    <c:if test="${sessionScope.USER != null}">
                        <li>
                        <a href="myProfile">My Profile</a>
                        </li>
                    </c:if>
                    
                </ul>
            </div>

        </div>
