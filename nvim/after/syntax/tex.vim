" Añade zona matemática para 'align'
if exists("*TexNewMathZone")
  call TexNewMathZone("Align", "align", 1)
  call TexNewMathZone("AlignStar", "align*", 1)
  call TexNewMathZone("Multline", "multline", 1)
endif
