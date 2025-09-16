<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relatório de Cursos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #0d1a3a;
            color: #fff;
            padding: 2rem;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        .card {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 2rem;
            margin: 2rem 0;
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
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <h1>📊 Relatório de Cursos Mais Acessados</h1>
            <div id="report-content">
                <p>Carregando...</p>
            </div>
        </div>
    </div>

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
                    '<p>Nenhum curso encontrado</p>';
                return;
            }

            let html = '<table>';
            html += '<thead><tr><th>#</th><th>Curso</th><th>Código</th><th>Categoria</th><th>Instrutor</th><th>Matrículas</th></tr></thead>';
            html += '<tbody>';
            
            data.forEach((course, index) => {
                html += '<tr>';
                html += '<td>' + (index + 1) + '</td>';
                html += '<td>' + (course.courseName || 'N/A') + '</td>';
                html += '<td>' + (course.courseCode || 'N/A') + '</td>';
                html += '<td>' + (course.categoryName || 'N/A') + '</td>';
                html += '<td>' + (course.instructorEmail || 'N/A') + '</td>';
                html += '<td>' + (course.enrollmentCount || 0) + '</td>';
                html += '</tr>';
            });
            
            html += '</tbody></table>';
            document.getElementById('report-content').innerHTML = html;
        }
    </script>
</body>
</html>
