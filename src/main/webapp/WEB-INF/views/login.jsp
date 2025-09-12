<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="/assets/css/login.css">
</head>
<body class="login-page">
<div class="container">
    <div class="login-box">
        <h2>Já estuda com a gente?</h2>
        <p>Faça seu login e boa aula!</p>
        <a href="/admin/categories" class="btn-login">ENTRAR</a>
    </div>

    <div class="courses">
        <h2>Ainda não estuda com a gente?</h2>
        <p>São mais de mil cursos nas seguintes áreas:</p>

        <div class="grid">
            <c:forEach items="${categoriesWithCourses}" var="category">
                <div class="card">
                    <div class="card-header">
                        <span class="card-icon" style="color: ${category.cardColor()};">${category.icon()}</span>
                        <h3 style="color: ${category.cardColor()};">Escola_ ${category.name()}</h3>
                    </div>
                    <p>
                        <c:forEach items="${category.activeCourses()}" var="course" varStatus="status">
                            ${course}<c:if test="${!status.last}">, </c:if>
                        </c:forEach>
                        <c:if test="${empty category.activeCourses()}">
                            Em breve novos cursos nesta área!
                        </c:if>
                    </p>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
