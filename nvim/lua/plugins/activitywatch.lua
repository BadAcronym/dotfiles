return{
    "lowitea/aw-watcher.nvim",
    config = function()
        require("aw_watcher").setup({
            opts = {
                host = "127.0.0.1",
                port = 5600
            }
        })
    end
}
