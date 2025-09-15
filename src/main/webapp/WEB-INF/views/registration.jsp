<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Teste de Matrícula</title>
    <link rel="stylesheet" type="text/css" href="/assets/css/login.css">
    <link rel="stylesheet" type="text/css" href="/assets/css/control-menu.css">
    <style>
        .page-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 2rem;
        }
        
        .page-title {
            text-align: center;
            margin-bottom: 2rem;
            font-size: 2rem;
            color: #fff;
        }
        
        .card {
            background: rgba(0, 35, 90, 0.6);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
        }
        
        .card h2 {
            color: #7CFFCB;
            margin-bottom: 1rem;
            font-size: 1.4rem;
        }
        
        .form-group {
            margin-bottom: 1rem;
        }
        
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: bold;
            color: #fff;
        }
        
        input {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            font-size: 1rem;
            box-sizing: border-box;
        }
        
        input::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }
        
        input:focus {
            outline: none;
            border-color: #7CFFCB;
            box-shadow: 0 0 10px rgba(124, 255, 203, 0.3);
        }
        
        button {
            background: #7CFFCB;
            border: none;
            color: #000;
            padding: 0.8rem 2rem;
            border-radius: 50px;
            cursor: pointer;
            font-weight: bold;
            font-size: 1rem;
            transition: background 0.3s;
            margin-right: 1rem;
        }
        
        button:hover {
            background: #64d9a7;
        }
        
        .result {
            margin-top: 1rem;
            padding: 1rem;
            border-radius: 8px;
            font-weight: bold;
            white-space: pre-wrap;
            font-family: 'Courier New', monospace;
            font-size: 0.9rem;
        }
        
        .success {
            background: rgba(124, 255, 203, 0.2);
            color: #7CFFCB;
            border: 1px solid rgba(124, 255, 203, 0.3);
        }
        
        .error {
            background: rgba(255, 107, 107, 0.2);
            color: #ff6b6b;
            border: 1px solid rgba(255, 107, 107, 0.3);
        }
        
        .info {
            background: rgba(124, 255, 203, 0.1);
            color: #7CFFCB;
            border: 1px solid rgba(124, 255, 203, 0.2);
        }
        
        .info-text {
            color: #cfd8e3;
            margin-bottom: 1rem;
            line-height: 1.5;
        }
        
        .test-scenarios {
            background: rgba(255, 255, 255, 0.05);
            padding: 1rem;
            border-radius: 8px;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .test-scenarios p {
            margin: 0.5rem 0;
            color: #cfd8e3;
        }
        
        .test-scenarios strong {
            color: #7CFFCB;
        }
    </style>
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

    <div class="page-container">
        <h1 class="page-title">🧪 Teste de Matrícula</h1>
        
        <div class="card">
            <h2>Formulário de Teste</h2>
            <div class="form-group">
                <label for="courseCode">Código do Curso:</label>
                <input type="text" id="courseCode" value="java-basico" placeholder="Digite o código do curso" />
            </div>
            
            <div class="form-group">
                <label for="studentEmail">Email do Aluno:</label>
                <input type="email" id="studentEmail" value="joao@email.com" placeholder="Digite o email do aluno" />
            </div>
            
            <button onclick="testRegistration()">🧪 Testar Matrícula</button>
            
            <div id="result"></div>
        </div>
        
        <div class="card">
            <h2>📋 Cenários de Teste</h2>
            <div class="test-scenarios">
                <p><strong>1. Matrícula Válida:</strong> joao@email.com + java-basico</p>
                <p><strong>2. Usuário não encontrado:</strong> inexistente@email.com + java-basico</p>
                <p><strong>3. Curso não encontrado:</strong> joao@email.com + curso-inexistente</p>
            </div>
        </div>
    </div>
    
    <script>
        async function testRegistration() {
            const courseCode = document.getElementById('courseCode').value;
            const studentEmail = document.getElementById('studentEmail').value;
            const resultDiv = document.getElementById('result');
            
            if (!courseCode || !studentEmail) {
                resultDiv.innerHTML = '<div class="error">⚠️ Por favor, preencha todos os campos!</div>';
                return;
            }
            
            const data = {
                courseCode: courseCode,
                studentEmail: studentEmail
            };
            
            resultDiv.innerHTML = '<div class="info">🔄 Enviando requisição...</div>';
            
            try {
                const response = await fetch('/registration/new', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(data)
                });
                
                const responseText = await response.text();
                
                let resultClass = 'error';
                let resultIcon = '❌';
                
                if (response.ok) {
                    resultClass = 'success';
                    resultIcon = '✅';
                } else if (response.status === 404) {
                    resultClass = 'error';
                    resultIcon = '🔍';
                } else if (response.status === 400) {
                    resultClass = 'error';
                    resultIcon = '⚠️';
                }
                
                resultDiv.innerHTML = resultClass + '">' + resultIcon + ' Status: ' + response.status + ' ' + response.statusText + '\n📝 Resposta: ' + responseText + '</div>';
                
            } catch (error) {
                resultDiv.innerHTML = '<div class="error">💥 Erro de conexão: ' + error.message + '</div>';
            }
        }
    </script>
    
<script src="/assets/js/control-menu.js"></script>
</body>
</html>
