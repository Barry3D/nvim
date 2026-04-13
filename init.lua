require("keymaps")
require("config")
require("lazyvim")
require("changelog")

-- TODO: Remove this setup. Why isn't the plugin enough?
require('mini.cursorword').setup()
require('esqueleto').setup(
    {
        patterns = { 'php', 'vue', 'python', 'yml' },
    }
)
