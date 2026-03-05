# Configuración

Usé esta Configuración para un proyecto, si funcionó con la instalacioń local de prisma lsp
Era un monorepo

```json
{
  "prettier.enable": true,
  "eslint.validate": [
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue"
  ],
  "tsserver.enable": true,
  "languageserver": {
    "prisma": {
      "command": "bash",
      "args": [
        "apps/backend/node_modules/.bin/prisma-language-server",
        "--stdio"
      ],
      "filetypes": ["prisma"],
      "rootPatterns": [
        "apps/backend/prisma/schema.prisma",
        "prisma/schema.prisma"
      ],
      "settings": {
        "prisma": {
          "prismaSchemaPath": "apps/backend/prisma/schema.prisma"
        }
      }
    }
  }
}
```
