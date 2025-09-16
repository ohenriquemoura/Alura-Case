<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relatório de Cursos</title>
    <link rel="stylesheet" type="text/css" href="/assets/css/control-menu.css">
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #0d1a3a, #001428);
            color: #fff;
            min-height: 100vh;
            padding: 2rem;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        .page-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        .page-title {
            font-size: 2.5rem;
            margin: 0;
            color: #7CFFCB;
            text-shadow: 0 0 20px rgba(124, 255, 203, 0.3);
        }
        .page-subtitle {
            font-size: 1.2rem;
            color: #cfd8e3;
            margin: 0.5rem 0 0 0;
        }
        .card {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .card-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        .card-header h3 {
            font-size: 1.8rem;
            margin: 0;
            color: #7CFFCB;
        }
        .card-header p {
            color: #cfd8e3;
            margin: 0.5rem 0 0 0;
        }
        .table-container {
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }
        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        th {
            background: rgba(124, 255, 203, 0.1);
            color: #7CFFCB;
            font-weight: bold;
            border-bottom: 2px solid rgba(124, 255, 203, 0.3);
        }
        tr:hover {
            background: rgba(124, 255, 203, 0.05);
        }
        .medal {
            font-size: 1.2rem;
        }
        .enrollment-badge {
            background: #7CFFCB;
            color: #000;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-weight: bold;
        }
        .course-code {
            background: rgba(124, 255, 203, 0.1);
            padding: 0.2rem 0.5rem;
            border-radius: 4px;
            font-family: 'Courier New', monospace;
            font-size: 0.9rem;
        }
        .category-badge {
            background: rgba(255,255,255,0.1);
            padding: 0.2rem 0.5rem;
            border-radius: 4px;
        }
        .instructor-email {
            color: #7CFFCB;
            text-decoration: none;
        }
        .instructor-email:hover {
            text-decoration: underline;
        }
    </style>
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
                <li><a href="/course-report" class="nav-link active"><span class="nav-link-icon">📊</span><span class="nav-link-text">Relatório de Cursos</span></a></li>
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
            <h1 class="page-title">📊 Relatório de Cursos Mais Acessados</h1>
            <p class="page-subtitle">Cursos ordenados por número de matrículas</p>
        </div>

        <div class="card">
            <div class="card-header">
                <h3>📈 Ranking de Cursos</h3>
                <p>Lista dos cursos mais populares baseado no número de matrículas</p>
            </div>
            <div id="report-content">
                <p>Carregando...</p>
            </div>
        </div>
    </div>

<script src="/assets/js/control-menu.js"></script>
<script>
        fetch('/registration/report')
            .then(response => response.json())
            .then(data => {
                console.log('Dados:', data);
                displayReport(data);
            })
            .catch(error => {
                console.error('Erro:', error);
                document.getElementById('report-content').innerHTML =
                    '<p style="color: red;">Erro ao carregar dados</p>';
            });

        function displayReport(data) {
            if (!data || data.length === 0) {
                document.getElementById('report-content').innerHTML =
                    '<p style="text-align: center; color: #cfd8e3;">Nenhum curso encontrado</p>';
                return;
            }

            let html = '<div class="table-container">';
            html += '<table>';
            html += '<thead><tr><th>#</th><th>Curso</th><th>Código</th><th>Categoria</th><th>Instrutor</th><th>Matrículas</th></tr></thead>';
            html += '<tbody>';

            data.forEach((course, index) => {
                const rank = index + 1;
                const medal = rank === 1 ? '🥇' : rank === 2 ? '🥈' : rank === 3 ? '🥉' : '';

                html += '<tr>';
                html += '<td style="text-align: center; font-weight: bold;"><span class="medal">' + medal + '</span> ' + rank + '</td>';
                html += '<td><strong>' + (course.courseName || 'N/A') + '</strong></td>';
                html += '<td><span class="course-code">' + (course.courseCode || 'N/A') + '</span></td>';
                html += '<td><span class="category-badge">' + (course.categoryName || 'N/A') + '</span></td>';
                html += '<td><a href="mailto:' + (course.instructorEmail || '#') + '" class="instructor-email">' + (course.instructorEmail || 'N/A') + '</a></td>';
                html += '<td style="text-align: center;"><span class="enrollment-badge">' + (course.enrollmentCount || 0) + '</span></td>';
                html += '</tr>';
            });

            html += '</tbody></table>';
            html += '</div>';
            document.getElementById('report-content').innerHTML = html;
        }
    </script>
</body>
</html>
