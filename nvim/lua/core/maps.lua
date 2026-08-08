vim.g.mapleader = " "
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, desc = 'Save file' })
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, desc = 'Quit' })

-- Tab navigation
vim.keymap.set('n', '<leader>h', 'gT', { noremap = true, desc = 'Previous tab' })
vim.keymap.set('n', '<leader>l', 'gt', { noremap = true, desc = 'Next tab' })
vim.keymap.set('n', '<leader>ta', ':tabe %:h<C-d>/', { noremap = true, desc = 'Open new tab' })

-- Clipboard (manual copy)
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, desc = 'Copy to clipboard' })
vim.keymap.set('n', '<leader>yy', '"+yy', { noremap = true, desc = 'Copy line to clipboard' })

-- Window resize
vim.keymap.set('n', '<leader>>', '6<C-w>>', { noremap = true, desc = 'Increase width' })
vim.keymap.set('n', '<leader><', '6<C-w><', { noremap = true, desc = 'Decrease width' })
vim.keymap.set('n', '<leader>+', '2<C-w>+', { noremap = true, desc = 'Increase height' })
vim.keymap.set('n', '<leader>-', '2<C-w>-', { noremap = true, desc = 'Decrease height' })
vim.keymap.set('n', 'zJ', function()
  local start_line = vim.fn.line('.')
  local target_level = vim.fn.foldlevel(start_line)
  -- Si el cursor no está en un fold, no hacemos nada
  if target_level == 0 then
    vim.api.nvim_echo({ { "No estás posicionado en un fold.", "WarningMsg" } }, false, {})
    return
  end
  local total_lines = vim.fn.line('$')
  local exited_current_fold = false
  local next_fold_line = nil
  -- Escanear hacia abajo línea por línea
  for i = start_line + 1, total_lines do
    local current_level = vim.fn.foldlevel(i)
    -- Detectamos que salimos del fold actual cuando el nivel baja
    if current_level < target_level then
      exited_current_fold = true
      -- Si ya salimos del fold anterior y encontramos de nuevo el mismo nivel
    elseif current_level == target_level and exited_current_fold then
      next_fold_line = i
      break
    end
  end
  -- Ejecutar el salto o mostrar el aviso
  if next_fold_line then
    vim.api.nvim_win_set_cursor(0, { next_fold_line, 0 })
    -- Opcional: abre el fold automáticamente al llegar a él
    vim.cmd("normal! zv")
  else
    vim.api.nvim_echo({ { "No hay más folds del nivel " .. target_level .. " hacia abajo.", "WarningMsg" } }, false, {})
  end
end, { desc = "Saltar al siguiente fold del mismo nivel" })
vim.keymap.set('n', 'zK', function()
  local start_line = vim.fn.line('.')
  local target_level = vim.fn.foldlevel(start_line)
  if target_level == 0 then
    vim.api.nvim_echo({ { "No estás posicionado en un fold.", "WarningMsg" } }, false, {})
    return
  end
  local exited_current_fold = false
  local prev_fold_line = nil
  local inside_prev_fold = false
  -- Escanear hacia arriba línea por línea
  for i = start_line - 1, 1, -1 do
    local current_level = vim.fn.foldlevel(i)
    if not exited_current_fold then
      -- Detectamos que salimos del fold actual hacia arriba cuando el nivel baja
      if current_level < target_level then
        exited_current_fold = true
      end
    else
      -- Si encontramos un bloque con el nivel objetivo, actualizamos la línea objetivo
      if current_level >= target_level then
        inside_prev_fold = true
        prev_fold_line = i -- Se actualiza en cada iteración para quedarse con la línea más alta (el inicio)
      elseif inside_prev_fold and current_level < target_level then
        -- Si ya estábamos dentro del fold anterior y el nivel vuelve a bajar, llegamos al tope
        break
      end
    end
  end
  -- Ejecutar el salto o mostrar el aviso
  if prev_fold_line then
    vim.api.nvim_win_set_cursor(0, { prev_fold_line, 0 })
    vim.cmd("normal! zv")
  else
    vim.api.nvim_echo({ { "No hay más folds del nivel " ..
    target_level .. " hacia arriba.", "WarningMsg" } }, false, {})
  end
end, { desc = "Saltar al fold anterior del mismo nivel" })
