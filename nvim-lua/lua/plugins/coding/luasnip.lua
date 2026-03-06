return {
  "L3MON4D3/LuaSnip",
  version = "2.*",
  build = "make install_jsregexp",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node

    -- Load friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Custom snippets migrated from UltiSnips

    -- C++ snippets
    ls.add_snippets("cpp", {
      s("fo", {
        t("for (auto "), i(1, "i"), t(" = "), i(2, "0"), t("; "),
        -- copy node would be complex, keep it simple
        t("i < "), i(3), t("; i"), i(4, "++"), t(") "), i(5),
      }),
      s("fe", {
        t("for(auto& "), i(1, "i"), t(": "), i(2), t(") "), i(3),
      }),
    })

    -- LaTeX snippets
    ls.add_snippets("tex", {
      s("i-fig", {
        t({"\\begin{figure}["}), i(1, "h"), t({"]",
        "\t\\centering",
        "\t\\includegraphics[width="}), i(2, "0.7"), t({"\\textwidth]{"}), i(3, "your-image-file"), t({"}",
        "\t\\caption{"}), i(4, "Caption for the figure"), t({"}",
        "\t\\label{fig:"}), i(5, "label"), t({"}",
        "\\end{figure}"}),
      }),
      s("figure", {
        t({"\\begin{figure}["}), i(1, "h"), t({"]",
        "\t\\centering",
        "\t\\includegraphics[width="}), i(2, "0.7"), t({"\\textwidth]{"}), i(3, "your-image-file"), t({"}",
        "\t\\caption{"}), i(4, "Caption for the figure"), t({"}",
        "\t\\label{fig:"}), i(5, "label"), t({"}",
        "\\end{figure}"}),
      }),
      s("minted", {
        t({"\\begin{listing}["}), i(1, "H"), t({"]",
        "\t\\inputminted[fontsize="}), i(2, "\\small"), t({"]{"}), i(3, "text"), t({"]{"}), i(4, "your-file"), t({"}",
        "\t\\caption{"}), i(5, "Caption"), t({"}",
        "\t\\label{lst:"}), i(6, "act1"), t({"}",
        "\\end{listing}"}),
      }),
    })

    -- Configure LuaSnip
    ls.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      delete_check_events = "TextChanged",
    })
  end,
}
