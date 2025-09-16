<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Categorias</title>
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
                <li><a href="/course-report" class="nav-link"><span class="nav-link-icon">📊</span><span class="nav-link-text">Relatório de Cursos</span></a></li>
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
            <h1 class="page-title">📚 Categorias</h1>
            <p class="page-subtitle">Gerencie as categorias de cursos da plataforma</p>
        </div>

        <div class="card">
            <div class="card-header">
                <h2 class="card-title">Lista de Categorias</h2>
                <a href="/admin/category/new" class="btn btn-primary">➕ Nova Categoria</a>
            </div>

            <c:if test="${empty categories}">
                <div class="alert alert-info text-center">
                    📝 Nenhuma categoria cadastrada ainda. <a href="/admin/category/new">Clique aqui</a> para criar a primeira!
                </div>
            </c:if>

            <c:if test="${not empty categories}">
                <div class="table-container">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Nome</th>
                                <th>Código</th>
                                <th>Cor</th>
                                <th>Ordem</th>
                                <th class="text-center">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${categories}" var="category">
                                <tr>
                                    <td>
                                        <strong>${category.name()}</strong>
                                    </td>
                                    <td>
                                        <code style="background: rgba(255,255,255,0.1); padding: 0.2rem 0.5rem; border-radius: 4px; color: #7CFFCB;">${category.code()}</code>
                                    </td>
                                    <td>
                                        <div style="display: flex; align-items: center; gap: 0.5rem;">
                                            <div style="width: 20px; height: 20px; border-radius: 50%; background-color: ${category.color()}; border: 2px solid rgba(255,255,255,0.2);"></div>
                                            <span>${category.color()}</span>
                                        </div>
                                    </td>
                                    <td>
                                        <span class="status-badge status-active">${category.order()}</span>
                                    </td>
                                    <td class="text-center">
                                        <a href="/admin/category/edit/${category.id()}" class="btn btn-secondary">✏️ Editar</a>
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