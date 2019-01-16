<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@include file="/WEB-INF/views/patterns/header.jsp" %>

<style>
    <%@include file="/WEB-INF/resources/css/login.css" %>
</style>
<div class="container">
    <div class="d-flex justify-content-center h-100">
        <div class="card">
            <div class="card-header">
                <h3>Sign In</h3>
                <div class="d-flex justify-content-end social_icon">
                    <span><i class="fa fa-film"></i></span>
                </div>
            </div>
            <div class="card-body">
                <form action="/login" method="post">
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" id="email" name="email" class="form-control" placeholder="email">
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" id="password" name="password" class="form-control" placeholder="password">
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Login" class="btn float-right login_btn">
                    </div>
                </form>
            </div>
            <div>
                <div class="card-footer">
                    <div class="d-flex justify-content-center links">
                        Don't have an account?<a href="/registration"><i class="fa fa-hand-o-right"></i> Sign Up</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>