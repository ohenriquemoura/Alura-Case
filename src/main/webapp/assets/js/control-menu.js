// Control Menu JavaScript
document.addEventListener('DOMContentLoaded', function() {
    const controlMenu = document.querySelector('.control-menu');
    const sidebar = document.querySelector('.sidebar');
    const sidebarOverlay = document.querySelector('.sidebar-overlay');
    const navLinks = document.querySelectorAll('.nav-link');

    // Função para abrir o menu
    function openMenu() {
        controlMenu.classList.add('active');
        sidebar.classList.add('active');
        sidebarOverlay.classList.add('active');
        document.body.style.overflow = 'hidden'; // Previne scroll do body
    }

    // Função para fechar o menu
    function closeMenu() {
        controlMenu.classList.remove('active');
        sidebar.classList.remove('active');
        sidebarOverlay.classList.remove('active');
        document.body.style.overflow = ''; // Restaura scroll do body
    }

    // Event listeners
    if (controlMenu) {
        controlMenu.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            
            if (sidebar.classList.contains('active')) {
                closeMenu();
            } else {
                openMenu();
            }
        });
    }

    // Fechar menu ao clicar no overlay
    if (sidebarOverlay) {
        sidebarOverlay.addEventListener('click', closeMenu);
    }

    // Fechar menu ao clicar em um link (exceto links externos)
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            // Se for um link interno (não começa com http), fecha o menu
            if (!this.href.startsWith('http') && !this.target || this.target !== '_blank') {
                closeMenu();
            }
        });
    });

    // Fechar menu ao pressionar ESC
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape' && sidebar.classList.contains('active')) {
            closeMenu();
        }
    });

    // Detectar página atual e marcar link como ativo
    function setActiveLink() {
        const currentPath = window.location.pathname;
        
        navLinks.forEach(link => {
            link.classList.remove('active');
            
            // Remove a classe ativa de todos os links
            if (link.getAttribute('href') === currentPath) {
                link.classList.add('active');
            }
            
            // Para links que são subcaminhos (ex: /admin/category/new)
            if (currentPath.startsWith(link.getAttribute('href')) && 
                link.getAttribute('href') !== '/' && 
                currentPath !== '/') {
                link.classList.add('active');
            }
        });
    }

    // Executar ao carregar a página
    setActiveLink();

    // Animações suaves para links
    navLinks.forEach(link => {
        link.addEventListener('mouseenter', function() {
            this.style.transform = 'translateX(5px)';
        });
        
        link.addEventListener('mouseleave', function() {
            this.style.transform = 'translateX(0)';
        });
    });

    // Adicionar efeito de ripple nos links
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            const ripple = document.createElement('span');
            const rect = this.getBoundingClientRect();
            const size = Math.max(rect.width, rect.height);
            const x = e.clientX - rect.left - size / 2;
            const y = e.clientY - rect.top - size / 2;
            
            ripple.style.width = ripple.style.height = size + 'px';
            ripple.style.left = x + 'px';
            ripple.style.top = y + 'px';
            ripple.classList.add('ripple');
            
            this.appendChild(ripple);
            
            setTimeout(() => {
                ripple.remove();
            }, 600);
        });
    });
});

// CSS para efeito ripple (adicionado dinamicamente)
const rippleCSS = `
.nav-link {
    position: relative;
    overflow: hidden;
}

.ripple {
    position: absolute;
    border-radius: 50%;
    background: rgba(124, 255, 203, 0.3);
    transform: scale(0);
    animation: ripple-animation 0.6s linear;
    pointer-events: none;
}

@keyframes ripple-animation {
    to {
        transform: scale(4);
        opacity: 0;
    }
}
`;

// Adicionar CSS do ripple ao head
const style = document.createElement('style');
style.textContent = rippleCSS;
document.head.appendChild(style);
