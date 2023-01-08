local _bufferline = {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
}

_bufferline.config = function()
    require('bufferline').setup {
        highlights = require('catppuccin.groups.integrations.bufferline').get(),
        options = {
            max_name_length = 10,
            max_prefix_length = 15,
            diagnostics = 'nvim_lsp',
            diagnostics_update_in_insert = true,
            diagnostics_indicator = function(count, level, _, context)
                if context.buffer:current() then
                    return ''
                end

                local icon = level:match('error') and ' ' or ' '
                return ' ' .. icon .. count
            end,
            offsets = {
                {
                    filetype = 'NvimTree',
                    text = 'File Explorer',
                    text_align = 'center',
                    highlight = 'Directory',
                },
                {
                    filetype = 'SidebarNvim',
                    text = 'Sidebar',
                    text_align = 'center',
                    highlight = 'Directory',
                },
            },
            show_close_icon = false,
            persist_buffer_sort = true,
            always_show_bufferline = false,
            -- enforce_regular_tabs = true,
            -- always_show_bufferline = false,
        },
    }
    vim.keymap.set('n', '<C-Tab>', '<cmd>BufferLinePick<CR>', { desc = 'Pick a buffer' })
end

return {
    _bufferline,
    {
        'ghillb/cybu.nvim',
        keys = {
            { ']b', '<cmd>CybuNext<cr>', desc = 'Go to next buffer', silent = true },
            { '[b', '<cmd>CybuPre<cr>', desc = 'Go to previous buffer', silent = true }
        },
        config = {
            -- behavior = { -- set behavior for different modes
            --     show_on_autocmd = 'BufEnter', -- event to trigger cybu (eg. "BufEnter")
            -- },
            --
            style = {
                path_abbreviation = 'shortened', -- none, shortened
                border = 'rounded', -- single, double, rounded, none
            }
        }
    }

}