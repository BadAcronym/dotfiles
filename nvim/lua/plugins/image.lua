return {
    "3rd/image.nvim",
    event = "VeryLazy",
    dependencies = { { "nvim-treesitter/nvim-treesitter", }, },
    opts = {
        backend = "sixel",
        integrations = {
            markdown = {
                enabled = true,
                clear_in_insert_mode = false,
                download_remote_images = true,
                only_render_image_at_cursor = false,
                -- markdown extensions (ie. quarto) can go here
                filetypes = { "markdown", "vimwiki" },
            },
            neorg = {
                enabled = true,
                clear_in_insert_mode = false,
                download_remote_images = true,
                only_render_image_at_cursor = false,
                filetypes = { "norg" },
            },
        },
        max_width = 100,
        max_height = 50,
        max_width_window_percentage = math.huge,
        max_height_window_percentage = math.huge,
        window_overlap_clear_enabled = true,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
}
