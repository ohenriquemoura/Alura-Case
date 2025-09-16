<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastrar Nova Categoria</title>
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
            <h1 class="page-title">➕ Nova Categoria</h1>
            <p class="page-subtitle">Crie uma nova categoria para organizar os cursos</p>
        </div>

        <div class="card">
            <div class="card-header">
                <h2 class="card-title">Dados da Categoria</h2>
                <a href="/admin/categories" class="btn btn-secondary">← Voltar</a>
            </div>

            <c:if test="${not empty errors}">
                <div class="alert alert-error">
                    ⚠️ Existem erros no formulário. Verifique os campos abaixo.
                </div>
            </c:if>

            <form:form modelAttribute="newCategoryForm" action="/admin/category/new" method="post">
                <div class="grid grid-2">
                    <div class="form-group">
                        <label for="newCategory-name" class="form-label">Nome da Categoria:</label>
                        <form:input path="name" id="newCategory-name" cssClass="form-input" placeholder="Ex: Programação" required="required"/>
                        <form:errors path="name" cssClass="field-error"/>
                    </div>

                    <div class="form-group">
                        <label for="newCategory-code" class="form-label">Código:</label>
                        <form:input path="code" id="newCategory-code" cssClass="form-input" placeholder="Ex: programacao" required="required"/>
                        <form:errors path="code" cssClass="field-error"/>
                        <small style="color: #cfd8e3; font-size: 0.9rem; margin-top: 0.5rem; display: block;">
                            💡 Use apenas letras minúsculas, números e hífens
                        </small>
                    </div>

                    <div class="form-group">
                        <label for="newCategory-color" class="form-label">Cor:</label>
                        <form:input path="color" id="newCategory-color" cssClass="form-input" placeholder="Ex: #FF6B6B ou red" required="required"/>
                        <form:errors path="color" cssClass="field-error"/>
                        <small style="color: #cfd8e3; font-size: 0.9rem; margin-top: 0.5rem; display: block;">
                            🎨 Use código hexadecimal (#FF6B6B) ou nome da cor (red, blue, etc.)
                        </small>
                    </div>

                    <div class="form-group">
                        <label for="newCategory-icon" class="form-label">Ícone Themify:</label>
                        <form:input path="icon" id="newCategory-icon" cssClass="form-input" placeholder="Ex: ti-star, ti-world, ti-heart" required="required"/>
                        <form:errors path="icon" cssClass="field-error"/>
                        <small style="color: #cfd8e3; font-size: 0.9rem; margin-top: 0.5rem; display: block;">
                            🎯 Use códigos do Themify Icons (ti-star, ti-world, ti-heart, etc.)
                        </small>
                    </div>

                    <div class="form-group">
                        <label for="newCategory-order" class="form-label">Ordem de Exibição:</label>
                        <form:input path="order" type="number" min="1" id="newCategory-order" cssClass="form-input" placeholder="1" required="required"/>
                        <form:errors path="order" cssClass="field-error"/>
                        <small style="color: #cfd8e3; font-size: 0.9rem; margin-top: 0.5rem; display: block;">
                            📋 Define a ordem de exibição na página inicial
                        </small>
                    </div>
                </div>

                <div style="text-align: center; margin-top: 2rem;">
                    <button type="submit" class="btn btn-primary">💾 Salvar Categoria</button>
                    <a href="/admin/categories" class="btn btn-secondary">❌ Cancelar</a>
                </div>
            </form:form>
        </div>
    </div>

<script src="/assets/js/control-menu.js"></script>
</body>
</html>