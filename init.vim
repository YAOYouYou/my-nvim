if has("wsl")
	if empty($SSH_CLIENT)
		let g:clipboard = {
					\   'name': 'WslClipboard',
					\   'copy': {
					\      '+': 'clip.exe',
					\      '*': 'clip.exe',
					\    },
					\   'paste': {
					\      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
					\      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
					\   },
					\   'cache_enabled': 0,
					\ }
	endif
endif

if exists('g:vscode')
	lua require("vscode")
else

	lua require("init")
endif
