local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Remember cursor position
autocmd('BufReadPost', {
  group = augroup('remember_cursor', { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- JSON formatting with jq
autocmd('FileType', {
  group = augroup('json_format', { clear = true }),
  pattern = 'json',
  callback = function()
    vim.bo.formatprg = 'jq'
  end,
})

-- LaTeX syntax regions
autocmd('FileType', {
  group = augroup('tex_syntax', { clear = true }),
  pattern = 'tex',
  callback = function()
    vim.cmd([[syntax region texZone start='\\begin{lstlisting}' end='\\end{lstlisting}' contains=NONE]])
    vim.cmd([[syntax region texZone start='\\begin{minted}' end='\\end{minted}' contains=NONE]])
  end,
})

-- Git commit encoding
autocmd('BufReadPre', {
  group = augroup('git_encoding', { clear = true }),
  pattern = { 'COMMIT_EDITMSG', 'MERGE_MSG', 'git-rebase-todo' },
  callback = function()
    vim.bo.fileencoding = 'utf-8'
  end,
})

-- Diff whitespace highlight
autocmd('FileType', {
  group = augroup('diff_whitespace', { clear = true }),
  pattern = 'diff',
  callback = function()
    vim.cmd([[highlight WhiteSpaceEOL ctermbg=red]])
    vim.cmd([[match WhiteSpaceEOL /\(^+.*\)\@<=\s\+$/]])
  end,
})

-- Patch files as diff
autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup('patch_filetype', { clear = true }),
  pattern = '*.patch',
  callback = function()
    vim.bo.filetype = 'diff'
  end,
})

-- Enable Treesitter highlighting explicitly (new nvim-treesitter API)
-- Auto-installs missing parsers on first open
autocmd('FileType', {
  group = augroup('enable_treesitter', { clear = true }),
  pattern = '*',
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    if ft == '' then return end -- ignore if no filetype is detected

    local lang = vim.treesitter.language.get_lang(ft) or ft

    -- if is supported
    local ok, parsers = pcall(require, 'nvim-treesitter.parsers')
    if not ok or not parsers[lang] then
      return -- Do nothing
    end

    if pcall(vim.treesitter.start, args.buf) then
      vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo[0][0].foldmethod = 'expr'
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    else
      -- Just install if exits
      pcall(function() require("nvim-treesitter").install({ lang }) end)
    end
  end,
})

-- Save and restore folds
local folds_group = augroup('remember_folds', { clear = true })
autocmd('BufWinLeave', {
  group = folds_group,
  pattern = '?*',
  command = 'silent! mkview',
})
autocmd('BufWinEnter', {
  group = folds_group,
  pattern = '?*',
  command = 'silent! loadview',
})

-- Avoid parser/query mismatch errors on vim/help buffers
autocmd('FileType', {
  group = augroup('disable_ts_vim_help', { clear = true }),
  pattern = { 'vim', 'help' },
  callback = function(args)
    pcall(vim.treesitter.stop, args.buf)
  end,
})

autocmd('BufEnter', {
  group = augroup('disable_ts_vim_help_enter', { clear = true }),
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    if ft == 'vim' or ft == 'help' then
      pcall(vim.treesitter.stop, args.buf)
    end
  end,
})
