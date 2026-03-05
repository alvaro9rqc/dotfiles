1. Lo configuras en qt para que te genere el compile command
2. haces un enlace simbólico
3. pones esto en el `.clangd`

```yaml
CompileFlags:
  Add: [-std=c++17]
  Remove: [-nostdinc, -nostdinc++]
  CompilationDatabase: build/Desktop_Qt_6_9_3-Debug/.qtc_clangd
```

4. creas tu .nvim.lua

```lua
vim.cmd("let g:copilot_enabled = 1")
```

5. crear el `.vim` y como no tienes un formater, añades:

```json
{
  "coc.preferences.formatOnSave": false,
  "coc.preferences.formatOnType": false,
}
```
