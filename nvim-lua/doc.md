Perfecto, Alvaro. Si estás empezando con `lazy.nvim`, conocer las **opciones clave** que controlan el comportamiento de cada plugin es fundamental para una configuración limpia, rápida y eficiente.

Aquí te explico las principales **variables/opciones** que puedes usar en cada plugin del array de `lazy.setup({ ... })`.

---

### 🧩 Estructura general de un plugin

```lua
{
  "autor/repositorio",   -- string obligatoria
  lazy = true,           -- carga perezosa
  event = "InsertEnter", -- dispara la carga con eventos de Neovim
  cmd = "Telescope",     -- carga si se ejecuta el comando
  ft = "lua",            -- carga si el archivo es de tipo lua
  priority = 1000,       -- ordena la carga (útil para temas)
  dependencies = { ... },-- plugins que deben cargarse primero
  config = function() ... end, -- configuración personalizada
  opts = { ... },        -- config auto si el plugin lo permite
  init = function() ... end, -- ejecuta algo antes de cargar
  enabled = true,        -- puedes desactivar un plugin
  build = "make",        -- para compilar después de instalar
}
```

---

## 🛠️ Opciones principales explicadas

### `lazy` (boolean)

* **`true`** → no carga al inicio, solo cuando se necesita.
* **`false`** → carga inmediatamente al iniciar Neovim.
* Por defecto es `true` si usas `event`, `cmd`, `ft`, etc.

👉 Úsalo para acelerar el arranque.

---

### `priority` (número)

* Determina el **orden de carga**. Mayor valor = más prioridad.
* Útil para temas de colores o plugins que deben cargarse antes que otros.

```lua
{ "catppuccin/nvim", priority = 1000, lazy = false }
```

---

### `event` (string o array)

Carga el plugin al dispararse un evento de Neovim:

* `"VimEnter"` → al iniciar Neovim.
* `"BufReadPre"` → antes de abrir un archivo.
* `"InsertEnter"` → al entrar en modo insertar.
* `"BufWinEnter"` → cuando aparece una ventana con buffer.

```lua
{ "nvim-lualine/lualine.nvim", event = "VimEnter" }
```

---

### `cmd` (string o array)

* Carga el plugin **solo cuando se ejecuta el comando** dado.

```lua
{ "nvim-tree/nvim-tree.lua", cmd = "NvimTreeToggle" }
```

---

### `ft` (filetype)

* Carga el plugin **solo si abres un archivo de cierto tipo**.

```lua
{ "iamcco/markdown-preview.nvim", ft = "markdown" }
```

---

### `config` (función)

* Ejecuta una función de configuración después de cargar el plugin.

```lua
config = function()
  require("pluginname").setup({ ... })
end
```

---

### `opts` (tabla)

* Si el plugin **soporta configuración automática**, esto es más limpio que `config`.

```lua
opts = {
  icons = true,
  theme = "auto",
}
```

---

### `dependencies` (lista)

* Plugins que deben cargarse antes que este.

```lua
dependencies = {
  "nvim-tree/nvim-web-devicons"
}
```

---

### `build` (string o función)

* Si el plugin necesita compilación después de instalarse.

```lua
build = ":TSUpdate"
```

---

### `init` (función)

* Se ejecuta antes de que el plugin sea cargado. Útil para definir variables globales.

```lua
init = function()
  vim.g.some_plugin_setting = true
end
```

---

### `enabled` (boolean)

* Puedes desactivar temporalmente un plugin.

```lua
enabled = false
```

---

### 🗂️ Dónde ver todo esto

La documentación **oficial** está en GitHub:
👉 [https://github.com/folke/lazy.nvim#-plugin-spec](https://github.com/folke/lazy.nvim#-plugin-spec)

---

¿Quieres que te dé una lista de eventos útiles (`event = ...`) o algunos trucos de rendimiento?

