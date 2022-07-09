
if !exists('g:loaded_glyph-palette') | finish | endif

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

GlyphPalette1(ctermfg=1 guifg="#e27878)  
