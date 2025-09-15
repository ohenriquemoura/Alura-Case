<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="/assets/css/login.css">
    <link rel="stylesheet" type="text/css" href="/assets/external-libs/themify-icons/themify-icons.css">
    <link rel="stylesheet" type="text/css" href="/assets/css/control-menu.css">
</head>
<body class="login-page">

<!-- Control Menu -->
<div class="control-menu">
    <div class="control-icon">
        <span></span>
        <span></span>
        <span></span>
    </div>
</div>

<!-- Sidebar -->
<div class="sidebar">
    <div class="sidebar-header">
        <h3 class="sidebar-title">🏫 Alura</h3>
        <p class="sidebar-subtitle">Sistema de Ensino</p>
    </div>
    
    <nav class="sidebar-nav">
        <div class="nav-section">
            <h4 class="nav-section-title">🏠 Páginas Principais</h4>
            <ul class="nav-links">
                <li><a href="/" class="nav-link"><span class="nav-link-icon">🏠</span><span class="nav-link-text">Página Inicial</span></a></li>
                <li><a href="/registration" class="nav-link"><span class="nav-link-icon">📝</span><span class="nav-link-text">Teste de Matrícula</span></a></li>
                <li><a href="/setup-registration" class="nav-link"><span class="nav-link-icon">⚙️</span><span class="nav-link-text">Configurar Testes</span></a></li>
            </ul>
        </div>
        
        <div class="nav-section">
            <h4 class="nav-section-title">👨‍💼 Administração</h4>
            <ul class="nav-links">
                <li><a href="/admin/categories" class="nav-link"><span class="nav-link-icon">📚</span><span class="nav-link-text">Categorias</span></a></li>
                <li><a href="/admin/category/new" class="nav-link"><span class="nav-link-icon">➕</span><span class="nav-link-text">Nova Categoria</span></a></li>
                <li><a href="/admin/courses" class="nav-link"><span class="nav-link-icon">🎓</span><span class="nav-link-text">Cursos</span></a></li>
                <li><a href="/admin/course/new" class="nav-link"><span class="nav-link-icon">➕</span><span class="nav-link-text">Novo Curso</span></a></li>
            </ul>
        </div>
    </nav>
</div>

<!-- Overlay -->
<div class="sidebar-overlay"></div>

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
                        <span class="card-icon ti ${category.icon()}" style="color: ${category.cardColor()};"></span>
                        <h3>
                            <span class="prefixo" style="color: ${category.cardColor()};">Escola_</span>
                            <span class="categoria" style="color: ${category.cardColor()};">${category.name()}</span>
                        </h3>
                        
                        
                        
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

<script src="/assets/js/control-menu.js"></script>
</body>
</html>
