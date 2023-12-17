" nnoremap <A-p> :PasteImg<CR> 
" inoremap <A-p> <Esc>:PasteImg<CR><BS>i 

lua << EOF

require'clipboard-image'.setup {
	-- Default configuration for all filetype
	default = {
		img_dir = function()
			local ap_img_dir = vim.env.AP_PRJ_SN7_DIR .. '/_images'
			if vim.env.AP_PRJ_SN7_DIR == nil then
				ap_img_dir = vim.env.AP_TMP_DIR .. '/_images'
			end
			return ap_img_dir
		end,
		
		-- img_name = function() return os.date('%Y-%m-%d-%H-%M-%S') end, -- Example result: "2021-04-13-10-04-18"
		img_name = function()
			vim.fn.inputsave()
			local name = vim.fn.input('Name: ')
			vim.fn.inputrestore()

			if name == nil or name == '' then
				return os.date('%y-%m-%d-%H-%M-%S')
			end
			return name
		end,

		affix = "<\n  %s\n>" -- Multi lines affix
	},

	-- You can create configuration for ceartain filetype by creating another field (markdown, in this case)
	-- If you're uncertain what to name your field to, you can run `lua print(vim.bo.filetype)`
	-- Missing options from `markdown` field will be replaced by options from `default` field
	markdown = {
		-- img_dir = {"src", "assets", "img"}, -- Use table for nested dir (New feature form PR #20)
		-- img_dir_txt = "/assets/img",
		
		img_dir_txt = function()
			local ap_img_dir_txt = vim.env.AP_PRJ_SN7_DIR .. '/_images'
			if vim.env.AP_PRJ_SN7_DIR == nil then
				ap_img_dir_txt = vim.env.AP_TMP_DIR .. '/_images'
			end
			return ap_img_dir_txt
		end,

		-- img_handler = function(img) -- New feature from PR #22
			-- local script = string.format('./image_compressor.sh "%s"', img.path)
			-- os.execute(script)
		-- end,
	}
}
EOF
