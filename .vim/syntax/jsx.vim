syn cluster javaScriptAll contains=javaScriptCommentTodo,javaScriptLineComment,
			\javaScriptCommentSkip,javaScriptComment,javaScriptSpecial,
			\javaScriptStringD,javaScriptStringS,javaScriptSpecialCharacter,
			\javaScriptNumber,javaScriptRegexpString,javaScriptConditional,
			\javaScriptRepeat,javaScriptBranch,javaScriptOperator,javaScriptType,
			\javaScriptStatement,javaScriptBoolean,javaScriptNull,
			\javaScriptIdentifier,javaScriptLabel,javaScriptException,
			\javaScriptMessage,javaScriptGlobal,javaScriptMember,javaScriptDeprecated,
			\javaScriptReserved

syn region javaScriptBlock matchgroup=javaScriptBraces start=/{/ end=/}/
			\ contains=@javaScriptAll extend fold

" JSX

if exists('b:current_syntax')
  let s:current_syntax=b:current_syntax
  unlet b:current_syntax
endif
syn include @XMLSyntax syntax/xml.vim
if exists('s:current_syntax')
  let b:current_syntax=s:current_syntax
endif

syn region xmlString contained start=+{+ end=++ contains=javaScriptBlock
syn region jsxChild contained start=+{+ end=++ contains=javaScriptBlock extend
syn region jsxRegion
  \ contains=@Spell,@XMLSyntax,jsxRegion,jsxChild,javaScriptBlock
  \ start=+\%(<\|\w\)\@<!<\z([a-zA-Z][a-zA-Z0-9:\-.]*\)+
  \ skip=+<!--\_.\{-}-->+ end=+</\z1\_\s\{-}>+ end=+/>+ keepend extend

syn cluster jsExpression add=jsxRegion
syn cluster javascriptNoReserved add=jsxRegion
