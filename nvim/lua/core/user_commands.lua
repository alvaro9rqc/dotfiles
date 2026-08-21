vim.api.nvim_create_user_command("OpenCTerm", function()
  local term_name = vim.fn.input("New terminal name: ")
  if term_name == "" then
    print("Canceled operation")
    return
  end
  vim.cmd("tab term")
  vim.cmd("file " .. vim.fn.fnameescape(term_name))
end, { desc = "Abre terminal en nuevo tab y renombra el buffer" })
