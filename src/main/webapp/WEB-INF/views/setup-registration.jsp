<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Configurar Dados de Teste</title>
    <link rel="stylesheet" type="text/css" href="/assets/css/login.css">
    <link rel="stylesheet" type="text/css" href="/assets/css/control-menu.css">
    <style>
        .page-container {
            max-width: 800px;
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
        
        .btn-link {
            display: inline-block;
            background: #7CFFCB;
            border: none;
            color: #000;
            padding: 0.8rem 2rem;
            border-radius: 50px;
            cursor: pointer;
            font-weight: bold;
            font-size: 1rem;
            transition: background 0.3s;
            text-decoration: none;
            text-align: center;
            margin-bottom: 1rem;
        }
        
        .btn-link:hover {
            background: #64d9a7;
            color: #000;
            text-decoration: none;
        }
        
        .result {
            margin-top: 1rem;
            padding: 1rem;
            border-radius: 8px;
            font-weight: bold;
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
        
        .info-text {
            color: #cfd8e3;
            margin-bottom: 1rem;
            line-height: 1.5;
        }
        
        .code-hint {
            background: rgba(255, 255, 255, 0.1);
            padding: 0.5rem;
            border-radius: 4px;
            font-family: 'Courier New', monospace;
            color: #7CFFCB;
            display: inline-block;
            margin-top: 0.5rem;
        }
        
        ol {
            color: #cfd8e3;
            padding-left: 1.5rem;
        }
        
        ol li {
            margin-bottom: 0.5rem;
        }
        
        a {
            color: #7CFFCB;
            text-decoration: none;
        }
        
        a:hover {
            text-decoration: underline;
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

    <div class="page-container">
        <h1 class="page-title">🔧 Configurar Dados de Teste</h1>
        
        <div class="card">
            <h2>1. Criar Usuário de Teste</h2>
            <div class="form-group">
                <label for="userName">Nome:</label>
                <input type="text" id="userName" value="João Silva" placeholder="Digite o nome do usuário" />
            </div>
            <div class="form-group">
                <label for="userEmail">Email:</label>
                <input type="email" id="userEmail" value="joao@email.com" placeholder="Digite o email do usuário" />
            </div>
            <div class="form-group">
                <label for="userPassword">Senha:</label>
                <input type="password" id="userPassword" value="12345678" placeholder="Digite a senha" />
            </div>
            <button onclick="createUser()">Criar Usuário</button>
        </div>
        
        <div class="card">
            <h2>2. Criar Curso de Teste</h2>
            <a href="/admin/course/new" class="btn-link" target="_blank">📚 Cadastrar Novo Curso</a><br>
            <div class="code-hint">
                <strong>Dica:</strong> Fique atento para as regras de criação de cursos!
                
            </div>
        </div>
        
        <div id="result"></div>
        
        <div class="card">
            <h2>3. Próximos Passos</h2>
            <p class="info-text">Após criar os dados de teste:</p>
            <ol>
                <li>Acesse: <a href="/registration" target="_blank">Página de Teste de Matrícula</a></li>
                <li>Teste os cenários de matrícula</li>
                <li>Verifique as validações implementadas</li>
            </ol>
        </div>
    </div>
    
    <script>
        async function createUser() {
            const name = document.getElementById('userName').value;
            const email = document.getElementById('userEmail').value;
            const password = document.getElementById('userPassword').value;
            const resultDiv = document.getElementById('result');
            
            if (!name || !email || !password) {
                resultDiv.innerHTML = '<div class="error">⚠️ Por favor, preencha todos os campos!</div>';
                return;
            }
            
            const data = {
                name: name,
                email: email,
                password: password
            };
            
            try {
                const response = await fetch('/user/newStudent', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(data)
                });
                
                const responseText = await response.text();
                
                if (response.ok) {
                    resultDiv.innerHTML = '<div class="success">✅ Usuário criado com sucesso!</div>';
                } else {
                    resultDiv.innerHTML = `<div class="error">❌ Erro ao criar usuário: ${responseText}</div>`;
                }
            } catch (error) {
                resultDiv.innerHTML = `<div class="error">💥 Erro de conexão: ${error.message}</div>`;
            }
        }
    </script>
    
<script src="/assets/js/control-menu.js"></script>
</body>
</html>