let g:switch_definitions =
          \ [
          \   {
          \     '<div\(.\{-}\)>\(.\{-}\)</div>': '<span\1>\2</span>',
          \     '<span\(.\{-}\)>\(.\{-}\)</span>': '<div\1>\2</div>',
          \   }
          \ ]

