/**
 * Simple Category Search for Login Page
 * Busca simples de categorias na página de login
 */

document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('category-search');
    const resultsContainer = document.getElementById('search-results');
    
    if (!searchInput) {
        console.log('Campo de busca não encontrado');
        return;
    }
    
    function filterCategories(searchTerm) {
        const cards = document.querySelectorAll('.grid .card');
        const term = searchTerm.toLowerCase().trim();
        let visibleCount = 0;
        
        cards.forEach(card => {
            const nameElement = card.querySelector('.categoria');
            const coursesElement = card.querySelector('p');
            
            const name = nameElement ? nameElement.textContent.toLowerCase() : '';
            const courses = coursesElement ? coursesElement.textContent.toLowerCase() : '';
            
            const matches = term === '' || name.includes(term) || courses.includes(term);
            
            if (matches) {
                card.classList.remove('hidden');
                card.classList.add('visible');
                visibleCount++;
            } else {
                card.classList.remove('visible');
                card.classList.add('hidden');
            }
        });
        
        // Atualizar contador de resultados
        if (resultsContainer) {
            if (visibleCount === cards.length) {
                resultsContainer.innerHTML = '';
            } else if (visibleCount === 0) {
                resultsContainer.innerHTML = '<div class="no-results"><div class="no-results-icon">🔍</div><p>Nenhuma categoria encontrada</p></div>';
            } else {
                resultsContainer.innerHTML = `<div class="search-results">Mostrando <strong>${visibleCount}</strong> de <strong>${cards.length}</strong> categorias</div>`;
            }
        }
    }
    
    // Event listener para busca em tempo real
    searchInput.addEventListener('input', function(e) {
        filterCategories(e.target.value);
    });
    
    // Limpar busca com Escape
    searchInput.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            this.value = '';
            filterCategories('');
        }
    });
    
    // Foco no campo de busca com Ctrl+F
    document.addEventListener('keydown', function(e) {
        if ((e.ctrlKey || e.metaKey) && e.key === 'f') {
            e.preventDefault();
            searchInput.focus();
        }
    });
});
