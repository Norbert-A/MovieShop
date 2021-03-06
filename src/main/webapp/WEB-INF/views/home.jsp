<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>MovieLandia</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">


    <!-- Custom styles for this template -->
    <link href="<c:url value="/resources/css/carousel.css"/>" rel="stylesheet">
</head>
<body style="background-color: #1b1e21">

<header>
    <style>
        .nav-link:hover {
            font-weight: bold;

        }
        .navbar {
            background: rgba(0,0,0,0.5);
        }
    </style>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <div class="navbar-brand" style="text-shadow:3px 3px 2px black"><i style="color:yellow" class="fa fa-film"></i>&nbsp;&nbsp;<strong>MovieLandia</strong></div>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" style="text-shadow:3px 3px 2px black, 0 0 40px yellow, 0 0 10px darkblue;" href="/">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" style="text-shadow:3px 3px 2px black, 0 0 40px yellow, 0 0 10px darkblue;" href="<c:url value="/movieList"/>">Movies</a>
                </li>
            </ul>
            <ul class="nav navbar-nav pull-right">
                <li class="nav-item">
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <c:if test="${pageContext.request.userPrincipal.name  == 'admin@admin.com'}">
                <li><a class="nav-link" style="color: orange; text-shadow:3px 3px 2px black, 0 0 40px yellow, 0 0 10px darkblue;" href="<c:url value="/admin" />">Admin</a></li>
                </c:if>
                <c:if test="${pageContext.request.userPrincipal.name != 'admin@admin.com'}">
                    <li><a class="nav-link" style="color: orange; text-shadow:3px 3px 2px black, 0 0 40px yellow, 0 0 10px darkblue;" href="<c:url value="/cart" />">Cart <i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
                </c:if>
                <li><a class="nav-link" style="color: yellow; text-shadow:3px 3px 2px black, 0 0 40px yellow, 0 0 10px darkblue;" href="<c:url value="/logout" />">Logout</a></li>
                </c:if>
                </li>
                <li  class="nav-item">
                    <c:if test="${pageContext.request.userPrincipal.name  == null}">
                <li><a class="nav-link" style="color: yellow; text-shadow:3px 3px 2px black, 0 0 40px yellow, 0 0 10px darkblue;" href="<c:url value="/login" />">Login</a></li>
                <li><a class="nav-link" style="color: orange; text-shadow:3px 3px 2px black, 0 0 40px yellow, 0 0 10px darkblue;" href="<c:url value="/registration" />">Register</a></li>
                </c:if>
                </li>
            </ul>
        </div>
    </nav>
</header>


<main role="main">

    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" style="height: 105%">
            <div class="carousel-item active">
                <div>
                    <img src="<c:url value="/resources/images/aquaman.jpg" />" alt="bg1" style="width:100%">
                </div>

                <div class="container">
                    <div class="carousel-caption text-left">
                        <h1 style="text-shadow:3px 3px 2px black, 0 0 40px yellow, 0 0 10px darkblue;">Aquaman</h1>
                        <p style="text-shadow: 3px 3px 2px black, 0 0 40px yellow, 0 0 10px darkblue;">Arthur Curry learns that he is the heir to the underwater kingdom of Atlantis, and must step forward to lead his people and be a hero to the world.</p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div>
                    <img src="<c:url value="/resources/images/hobbit.jpg" />" alt="bg1" style="width:100%">
                </div>
                <div class="container">
                    <div class="carousel-caption text-left">
                        <h1 style="text-shadow:3px 3px 2px black, 0 0 40px yellow, 0 0 10px darkblue;">Hobbit</h1>
                        <p style="text-shadow: 3px 3px 2px black, 0 0 40px yellow, 0 0 10px darkblue;">A reluctant Hobbit, Bilbo Baggins, sets out to the Lonely Mountain with a spirited group of dwarves to reclaim their mountain home, and the gold within it from the dragon Smaug.</p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div>
                    <img src="<c:url value="/resources/images/greatestshowman.jpg" />" alt="bg1" style="width: 110%">
                </div>
                <div class="container">
                    <div class="carousel-caption text-left">
                        <h1 style="text-shadow:3px 3px 2px black, 0 0 40px yellow, 0 0 10px darkblue;">Greatest Showman</h1>
                        <p style="text-shadow: 3px 3px 2px black, 0 0 40px yellow, 0 0 10px darkblue;">Celebrates the birth of show business and tells of a visionary who rose from nothing to create a spectacle that became a worldwide sensation.</p>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <!-- FOOTER -->
    <footer class="container">
        <p>&copy; 2017-2019 MovieLandia Company, Inc.</p>
    </footer>
</main>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>""><\/script>')</script><script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
</body>
</html>