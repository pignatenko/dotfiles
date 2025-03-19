plugin = {
	"SirVer/ultisnips",
	init = function()
		vim.cmd([[
    let g:UltiSnipsExpandTrigger="<c-x><c-m>"
    let g:UltiSnipsListSnippets="<c-l>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    let g:UltiSnipsEditSplit="vertical"
    let g:UltiSnipsSnippetDirectories=["macros"]
  ]])
	end,
}

return plugin
