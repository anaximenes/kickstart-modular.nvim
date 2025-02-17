return {
    "folke/flash.nvim",
    event = "VeryLazy",
    --@type Flash.Config
    opts = {
        jump = {
            autojump = true,
        },
        modes = {
            char = {
                enabled = false,
                jump_labels = true,
            }
        }
    },

    keys = {
        { "<space>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
}
