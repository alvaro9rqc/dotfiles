# Integración de tmux con Caelestia

Esta configuración usa el fork de Tokyo Night Tmux para consumir roles
semánticos de Caelestia, conservar la transparencia de Foot y mostrar imágenes
dentro de tmux.

## Flujo de actualización

1. Caelestia procesa `~/.config/caelestia/templates/tmux.conf` y genera
   `~/.local/state/caelestia/theme/tmux.conf`.
2. La integración oficial de terminal genera y distribuye
   `~/.local/state/caelestia/sequences.txt`, incluyendo OSC 11.
3. Foot aplica el nuevo fondo conservando su configuración de `alpha` y `blur`.
4. El `postHook` ejecuta `~/dotfiles/scripts/caelestia-theme-reload`.
5. El hook recarga tmux, conserva los paneles en el fondo `default` y refresca
   los clientes.
6. El plugin carga el `tmux.conf` generado y actualiza la barra.

## Archivos importantes

- `~/dotfiles/tmux/tmux.conf`: selecciona el tema, la transparencia, SIXEL y
  el passthrough de imágenes.
- `~/dotfiles/scripts/caelestia-theme-reload`: recarga tmux después del
  broadcast oficial de Caelestia.
- `~/dotfiles/zsh/zshrc`: carga `sequences.txt` en un terminal exterior, igual
  que la configuración oficial de Fish.
- `~/.config/caelestia/templates/tmux.conf`: exporta roles Material para tmux.
- `~/tokyo-night-tmux/src/themes.sh`: consume el archivo generado.
- `~/.config/caelestia/cli.json`: activa el terminal y registra el `postHook`.
- `~/.config/foot/foot.ini`: contiene `alpha` y `blur`.

## Opciones necesarias

En `tmux.conf`:

```tmux
set -g default-terminal "tmux-256color"
set -as terminal-features ',foot:RGB:usstyle:clipboard:sixel'
set -as terminal-features ',xterm-kitty:RGB:usstyle:clipboard'
set -g allow-passthrough on

set -g @plugin 'alvaro9rqc/tokyo-night-tmux'
set -g @tokyo-night-tmux_theme caelestia
set -g @tokyo-night-tmux_transparent 1
```

En `~/.config/caelestia/cli.json`:

```json
{
  "theme": {
    "enableTerm": true,
    "postHook": "/home/alvaro9rqc/dotfiles/scripts/caelestia-theme-reload"
  }
}
```

## Causa del fallo oscuro → claro

La personalización anterior desactivaba `enableTerm`, generaba
`sequences-no-background.txt` sin OSC 11 y enviaba OSC 111 para restaurar el
fondo predeterminado. Por eso los colores ANSI cambiaban pero Foot conservaba
un fondo oscuro al activar el modo claro. Una terminal nueva parecía corregirlo
porque volvía a cargar un archivo de secuencias durante el inicio del shell.

La prueba manual `printf "\e]11;#E3E3E3\a"` confirmó que Foot conserva su alpha
cuando recibe OSC 11. La solución es usar el broadcast oficial completo y dejar
el hook limitado a tmux. No debe volver a generar ni distribuir una segunda
paleta.

## Comprobaciones rápidas

```sh
tmux show-options -g status-style
tmux show-options -g window-style
tmux show-options -g window-active-style
tmux show-options -gv @tokyo-night-tmux_transparent
od -An -t x1 ~/.local/state/caelestia/sequences.txt
```

Los estilos esperados son `bg=default`, `default`, `default` y `1`. El archivo
de secuencias debe contener OSC 10, OSC 11, OSC 12 y la paleta OSC 4.
