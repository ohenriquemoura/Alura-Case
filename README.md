# Projeto Alura - Sistema de Ensino Online

## 📋 Visão Geral

Este projeto é uma plataforma educacional completa desenvolvida em Spring Boot, implementando funcionalidades de gestão de cursos, categorias, usuários e matrículas. O sistema foi desenvolvido seguindo as melhores práticas de desenvolvimento web e inclui uma interface moderna e responsiva.



## 📊 Modelo de Dados

### Entidades Principais

#### User (Usuário)
- **Campos**: id, name, email, password, role
- **Roles**: STUDENT, ADMIN
- **Funcionalidades**: Criptografia MD5 da senha

#### Category (Categoria)
- **Campos**: id, name, code, color, icon, order, createdAt
- **Validações**: Código único, nome obrigatório
- **Funcionalidades**: Ordenação personalizada, ícones temáticos

#### Course (Curso)
- **Campos**: id, name, code, description, instructorEmail, status, category, deactivatedAt
-- A escolha de utilizar o e-mail para identificar o instrutor foi feita para servir de chave única, já que instrutores podem ter o mesmo nome 
- **Status**: ACTIVE, INACTIVE
- **Validações**: Código único, formato específico (letras minúsculas + hífen)
- **Funcionalidades**: Inativação automática com timestamp
#### Registration (Matrícula)
- **Campos**: id, user, course, enrollmentDate
- **Validações**: Usuário não pode se matricular duas vezes no mesmo curso
- **Funcionalidades**: Apenas cursos ativos podem receber matrículas

## 🎯 Funcionalidades Implementadas

### ✅ Questão 1 - Cadastro de Cursos
- **Implementação**: CRUD completo para cursos
- **Validações**: Código único, formato específico, categoria obrigatória
- **Interface**: Formulários de criação e edição com validação em tempo real
- **Status**: Cursos criados automaticamente como ACTIVE

### ✅ Questão 2 - Inativação de Cursos
- **Endpoint**: `POST /course/{code}/inactive`
- **Funcionalidade**: Inativação com timestamp automático
- **Interface**: Botões de ativação/desativação na listagem de cursos

### ✅ Questão 3 - Front-end Página de Login
- **Design**: Interface moderna baseada no Figma fornecido
- **Funcionalidades**: 
  - Carregamento dinâmico de categorias e cursos
  - Design responsivo com gradientes e efeitos visuais
  - Integração com sistema de autenticação

### ✅ Questão 4 - Edição de Categorias e Cursos
- **Categorias**: Formulário de edição com validações
- **Cursos**: Edição completa com validação de código único
- **Interface**: Formulários intuitivos com feedback visual

### ✅ Questão 5 - Matrícula de Alunos via API
- **Endpoint**: `POST /registration/new`
- **Validações**: 
  - Usuário não pode se matricular duas vezes no mesmo curso
  - Apenas cursos ativos aceitam matrículas
- **DTO**: `NewRegistrationDTO` para transferência de dados
- **Interface**: Páginas de teste para demonstração

### ✅ Questão 6 - Relatório de Cursos Mais Acessados
- **Endpoint**: `GET /registration/report`
- **Implementação**: SQL nativo otimizado para evitar N+1
- **Interface**: Página dedicada com ranking visual e medalhas
- **Funcionalidades**: 
  - Ordenação por número de matrículas
  - Exibição de categoria, instrutor e estatísticas
  - Design responsivo com tabelas interativas

## 🎨 Interface e Design

### Control Menu (Sidebar)
- **Implementação**: Menu lateral responsivo com animações
- **Funcionalidades**: 
  - Navegação entre todas as páginas
  - Design moderno com ícones e cores temáticas
  - Responsividade para dispositivos móveis

### Páginas Principais
- **Login**: Design moderno com gradientes e efeitos visuais
- **Admin**: Interface administrativa para gestão de conteúdo
- **Relatórios**: Visualização de dados com ranking e estatísticas
- **Formulários**: Validação em tempo real com feedback visual

### Responsividade
- **Mobile First**: Design otimizado para dispositivos móveis
- **Breakpoints**: Adaptação para tablets e desktops
- **Componentes**: Cards, tabelas e formulários responsivos

## 🧪 Testes Implementados

### Estratégia de Testes
- **Testes Unitários**: Entidades e lógica de negócio
- **Testes de Controller**: Endpoints e validações
- **Cobertura**: Foco nas funcionalidades críticas

### Testes por Módulo

#### User Tests
- Validação de criptografia de senha
- Testes de controller com validações de email
- Testes de criação e listagem de usuários

#### Course Tests
- Validação de criação de cursos
- Testes de ativação/desativação
- Testes de controller para CRUD

#### Category Tests
- Validação de propriedades da categoria
- Testes de controller para listagem e edição
- Testes de redirecionamento

## 🗄️ Banco de Dados

### Migrações Flyway
- **V1**: Criação da tabela User
- **V2**: Criação da tabela Category
- **V3**: Criação da tabela Course
- **V4**: Criação da tabela Registration
- **V5**: Adição de campos de ícone e ordem para Category
- **V6**: Inserção de 20 categorias de teste

### Relacionamentos
- **Course → Category**: Many-to-One
- **Registration → User**: Many-to-One
- **Registration → Course**: Many-to-One

## 🚀 Como Executar

### Endpoints Principais
- **Login**: `GET /`
- **Admin Cursos**: `GET /admin/courses`
- **Admin Categorias**: `GET /admin/categories`
- **Relatório**: `GET /course-report`
- **API Matrícula**: `POST /registration/new`
- **API Relatório**: `GET /registration/report`

## 📈 Melhorias Implementadas

### Performance
- **SQL Nativo**: Relatórios otimizados para grandes volumes
- **Lazy Loading**: Carregamento eficiente de relacionamentos
- **Índices**: Otimização de consultas frequentes

### UX/UI
- **Design System**: Cores e componentes consistentes
- **Feedback Visual**: Validações em tempo real
- **Responsividade**: Adaptação para todos os dispositivos
- **Acessibilidade**: Navegação intuitiva e clara

### Código
- **Clean Code**: Código limpo e bem documentado
- **Padrões**: Seguimento de convenções Java/Spring
- **Validações**: Validações robustas em todas as camadas
- **Tratamento de Erros**: Mensagens claras e informativas

## 📝 Extras

- Implementação de uma searchbar, sidebar e filtros para melhor experiência e correção por parte dos avaliadores
- Melhorias no css para um visual mais agradável e coerente com o figma
