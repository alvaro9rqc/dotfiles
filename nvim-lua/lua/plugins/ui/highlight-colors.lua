return {
  "brenoprata10/nvim-highlight-colors",
  -- LA CLAVE DE LA EFICIENCIA: Solo se carga al leer o crear un archivo nuevo
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    render = 'background',
    exclude_filetypes = { 'lazy', 'mason', 'help', 'neo-tree' },
  }
}
