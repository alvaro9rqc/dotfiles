# Integración de tmux con Caelestia

Esta configuración usa el fork de Tokyo Night Tmux para leer la paleta activa
de Caelestia, conservar el fondo transparente de Foot y mostrar imágenes dentro
de tmux.

## Flujo de actualización

1. Caelestia procesa `~/.config/caelestia/templates/tmux.conf` y genera
   `~/.local/state/caelestia/theme/tmux.conf` con roles semánticos.
2. La integración nativa de terminal está desactivada porque incluye OSC 11.
3. El `postHook` ejecuta
   `~/dotfiles/scripts/caelestia-theme-reload`.
4. El hook restablece el fondo configurado por Foot mediante OSC 111, genera
   `sequences-no-background.txt` y actualiza foreground, cursor y colores ANSI
   sin emitir OSC 11. Esto funciona aunque tmux todavía no esté iniciado.
5. El hook recarga `~/.tmux.conf`, limpia fondos sólidos antiguos y redibuja los
   clientes.
6. El plugin carga el `tmux.conf` generado y actualiza la barra de tmux.

La integración nativa de Caelestia genera OSC 11 a partir de `surface` y lo
envía a todos los `/dev/pts`. Dentro de tmux esto puede dejar un fondo sólido
aunque `status-style` sea `bg=default`. La configuración personalizada conserva
los demás colores dinámicos y no genera OSC 11.

## Archivos importantes

- `~/dotfiles/tmux/tmux.conf`: configuración principal, selección del tema,
  transparencia, SIXEL y passthrough de imágenes.
- `~/dotfiles/scripts/caelestia-theme-reload`: hook que recarga colores y
  genera la paleta segura y conserva la transparencia.
- `~/dotfiles/zsh/zshrc`: carga el archivo oficial `sequences.txt` únicamente
  en el terminal exterior, igual que la configuración de Fish.
- `~/.config/caelestia/templates/tmux.conf`: exporta roles Material para tmux.
- `~/tokyo-night-tmux/src/themes.sh`: consume el archivo generado y convierte
  sus roles semánticos en la paleta del plugin.
- `~/tokyo-night-tmux/tokyo-night.tmux`: construye la barra de estado.
- `~/.tmux/plugins/tokyo-night-tmux`: enlace al repositorio local
  `~/tokyo-night-tmux` usado por TPM.
- `~/.config/caelestia/cli.json`: registra el `postHook`.
- `~/.config/foot/foot.ini`: contiene `alpha` y `blur` para la transparencia.

## Opciones necesarias

En `tmux.conf` deben permanecer estas opciones:

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
    "enableTerm": false,
    "postHook": "/home/alvaro9rqc/dotfiles/scripts/caelestia-theme-reload"
  }
}
```

## Comprobaciones rápidas

Recargar manualmente toda la integración:

```sh
~/dotfiles/scripts/caelestia-theme-reload
```

Comprobar que la barra conserva el fondo predeterminado:

```sh
tmux show-options -g status-style
tmux show-options -g window-style
tmux show-options -g window-active-style
tmux show-options -gv @tokyo-night-tmux_transparent
```

Los valores esperados son `bg=default`, `default`, `default` y `1`.

## Problema pendiente de actualización en vivo

La transición claro → oscuro actualiza correctamente las terminales abiertas.
La transición oscuro → claro puede dejar la paleta ANSI anterior en una
terminal ya abierta, aunque los archivos generados sean correctos. Una terminal
nueva carga la paleta clara correcta; el mismo comportamiento ocurre en Fish,
por lo que el fallo está en el broadcast OSC del hook y no en Zsh ni en tmux.

Comprobar que la paleta segura no contiene OSC 11:

```sh
od -An -t x1 ~/.local/state/caelestia/sequences-no-background.txt
```

Debe contener secuencias que empiezan por `1b 5d 31 30`, `1b 5d 31 32` y
`1b 5d 34`, pero nunca `1b 5d 31 31 3b`.

Comprobar capacidades gráficas:

```sh
tmux show-options -gv allow-passthrough
tmux show-options -s | grep terminal-features
```

Foot debe aparecer con `sixel` y el passthrough debe estar en `on`.

## Si un panel antiguo continúa negro

Ejecutar el hook manualmente. Si una aplicación de pantalla completa pintó su
propio fondo, salir de esa aplicación o abrir una ventana nueva con
`Ctrl-Space c`; ese fondo pertenece a la aplicación y no a la barra de tmux.
