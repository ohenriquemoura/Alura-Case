<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Cursos</title>
    <link rel="stylesheet" type="text/css" href="/assets/css/admin.css">
    <link rel="stylesheet" type="text/css" href="/assets/css/control-menu.css">
</head>
<body>
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
        <div class="page-header">
            <h1 class="page-title">📖 Cursos</h1>
            <p class="page-subtitle">Gerencie todos os cursos da plataforma</p>
        </div>

        <div class="card">
            <div class="card-header">
                <h2 class="card-title">Lista de Cursos</h2>
                <a href="/admin/course/new" class="btn btn-primary">➕ Novo Curso</a>
            </div>

            <c:if test="${empty courses}">
                <div class="alert alert-info text-center">
                    📝 Nenhum curso cadastrado ainda. <a href="/admin/course/new">Clique aqui</a> para criar o primeiro!
                </div>
            </c:if>

            <c:if test="${not empty courses}">
                <div class="table-container">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Nome</th>
                                <th>Código</th>
                                <th>Instrutor</th>
                                <th>Categoria</th>
                                <th>Status</th>
                                <th class="text-center">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${courses}" var="course">
                                <tr>
                                    <td style="max-width: 200px;">
                                        <div style="font-weight: bold; color: #fff; margin-bottom: 0.3rem;">${course.name()}</div>
                                        <c:if test="${not empty course.description() and course.description() != null}">
                                            <div style="color: #cfd8e3; font-size: 0.85rem; line-height: 1.3; word-wrap: break-word;">${course.description()}</div>
                                        </c:if>
                                    </td>
                                    <td>
                                        <code style="background: rgba(255,255,255,0.1); padding: 0.2rem 0.5rem; border-radius: 4px; color: #7CFFCB; white-space: nowrap; font-size: 0.9rem;">${course.code()}</code>
                                    </td>
                                    <td style="max-width: 180px;">
                                        <a href="mailto:${course.instructorEmail()}" style="color: #7CFFCB; word-break: break-all; font-size: 0.9rem;">${course.instructorEmail()}</a>
                                    </td>
                                    <td>
                                        <span style="background: rgba(255,255,255,0.1); padding: 0.2rem 0.5rem; border-radius: 4px; font-size: 0.9rem;">
                                            ${course.categoryName()}
                                        </span>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${course.status() == 'ACTIVE'}">
                                                <span class="status-badge status-active">✅ Ativo</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-badge status-inactive">❌ Inativo</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <div class="action-buttons">
                                            <a href="/admin/course/edit/${course.id()}" class="btn btn-secondary btn-sm">✏️ Editar</a>
                                            <c:choose>
                                                <c:when test="${course.status() == 'ACTIVE'}">
                                                    <form action="/admin/course/${course.id()}/toggle-status" method="post" class="inline-form">
                                                        <button type="submit" class="btn btn-warning btn-sm">⏸️ Inativar</button>
                                                    </form>
                                                </c:when>
                                                <c:otherwise>
                                                    <form action="/admin/course/${course.id()}/toggle-status" method="post" class="inline-form">
                                                        <button type="submit" class="btn btn-success btn-sm">▶️ Ativar</button>
                                                    </form>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </div>

<script src="/assets/js/control-menu.js"></script>
</body>
</html>