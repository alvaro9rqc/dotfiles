# TMUX
```bash
# Recuperar sesión
tmux attach-session -t 0
#[detached (from session 0)]

# Listar sesiones
tmux ls
# 0: 2 windows (created Wed Oct  9 15:35:31 2024)
# 1: 1 windows (created Wed Oct  9 17:04:54 2024)

# Renombrar sesión
tmux rename-session -t 1 ta_ar

# tmux ls
# 0: 2 windows (created Wed Oct  9 15:35:31 2024)
# ta_ar: 1 windows (created Wed Oct  9 17:04:54 2024)

# Recuperar sesión con nombre
tmux attach-session -t ta_ar
# [detached (from session ta_ar)]

# Iniciar sesión 
tmux new-session -s libro

```
---

# VIM
```vim
set foldmethod=manual
```

vim
Para usar folding basado en la indentación:
set foldmethod=indent



vim
Para usar folding basado en la sintaxis:
set foldmethod=syntax



vim
Para que los folds se cierren automáticamente al abrir un archivo:
set foldlevelstart=0


vim
Para definir el nivel de folding que se muestra al abrir un archivo: Si quieres ver solo el nivel superior de folds:
set foldlevelstart=1


vim
Comandos adicionales de folding
Ir al siguiente fold cerrado (zj): Mueve el cursor al inicio del siguiente fold cerrado.
zj

Ir al fold anterior cerrado (zk): Mueve el cursor al inicio del fold cerrado anterior.
zk

Cambiar el nivel de apertura de los folds: Puedes ajustar cuántos niveles de folds quieres abrir/mostrar en todo el archivo con:
set foldlevel=<número>

Configuración recomendada
Si deseas activar el folding automáticamente con indentación, puedes configurar lo siguiente en tu init.vim:

set foldmethod=indent
set foldlevel=99
set foldenable



vim 
para ver las diferencias con el plug de fugitive
Gdiffsplit


formato:
Establece un programa de formateo y lo aplica con gq
autocmd FileType json setlocal formatprg=jq


para icpc:
inoremap {<CR> {<CR>}<Esc>O
