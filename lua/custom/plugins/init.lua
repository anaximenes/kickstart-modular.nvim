-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        init = function()
            vim.cmd.colorscheme 'catppuccin'
            vim.cmd.hi 'Comment gui=none'
        end,
    },
    {
        "tpope/vim-fugitive"
    },
    {
        "tpope/vim-repeat"
    },
    {
        "tpope/vim-dispatch"
    },
    {
        "tpope/vim-surround"
    },
    {
        "tpope/vim-unimpaired"
    },
    { 'ojroques/vim-oscyank' },
    { 'rbgrouleff/bclose.vim' },
    { 'arithran/vim-delete-hidden-buffers' },
    { 'AndrewRadev/linediff.vim' },
    {
        'lfv89/vim-interestingwords',
        init = function()
            vim.g.interestinWordsGUIColors = {'#A4E57E', '#FDB72', '#FF7272', '#FFB3FF', '#9999FF', '#A2678d', '#5e9c74', '#8CCBEA'}
        end
    },
}
