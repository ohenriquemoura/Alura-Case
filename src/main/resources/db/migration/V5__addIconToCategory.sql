-- Adicionar coluna icon à tabela Category
ALTER TABLE Category ADD COLUMN icon VARCHAR(50) NOT NULL DEFAULT 'ti-star';

-- Atualizar categorias existentes com ícone padrão
UPDATE Category SET icon = 'ti-star' WHERE icon IS NULL OR icon = '';
