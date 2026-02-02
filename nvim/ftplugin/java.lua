Appdata = os.getenv("LOCALAPPDATA")
local config = {
    cmd = {"%{Appdata}/nvim-data/mason/bin/jdtls.cmd"},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('java').setup(config)
