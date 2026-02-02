local capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    require("cmp_nvim_lsp").default_capabilities()
)

capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

vim.lsp.config("clangd", {
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy=false",
        "--header-insertion=never"
    },
    filetypes = { "c", "h", "cpp", "hpp" },
})
vim.lsp.enable("clangd")

vim.lsp.config("jdtls", {
    capabilities = capabilities,
    cmd = {"jdtls"},
    filetypes = {"java"},
})
vim.lsp.enable("jdtls")

vim.lsp.config("glsl_analyzer", {
    capabilities = capabilities,
    filetypes = { "glsl", "hlsl"},
})
vim.lsp.enable("glsl_analyzer")

vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    filetypes = { "lua" },
})
vim.lsp.enable("lua_ls")

vim.lsp.config("asm_lsp", {
    capabilities = capabilities,
    cmd = { "asm-lsp" },
    filetypes = { "asm", "vmasm" },
})
vim.lsp.enable("asm_lsp")

vim.lsp.config("bashls", {
    capabilities = capabilities,
    cmd = {'bash-language-server', 'start'},
    filetypes = { "sh", "bash" },
})
vim.lsp.enable('bashls')

vim.lsp.config("tinymist", {
    capabilities = capabilities,
    filetypes = { "typst" },
})
vim.lsp.enable("tinymist")

vim.lsp.config("lemminx", {
    capabilities = capabilities,
    filetypes = { "xml" },
})
vim.lsp.enable("lemminx")

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "dec", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "def", vim.lsp.buf.definition, {})
vim.keymap.set("n", "ref", vim.lsp.buf.references, {})
vim.keymap.set("n", "ren", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
