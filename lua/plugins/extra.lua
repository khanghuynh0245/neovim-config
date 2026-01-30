return {
    {
        'nvim-tree/nvim-web-devicons',
        lazy = false,
    },
    {
        'akinsho/toggleterm.nvim',
        keys = { { '<C-\\>', '<cmd>ToggleTerm<CR>', 'Toggle terminal' } },
        opts = {
            open_mapping = [[<c-\>]],
            winbar = { enabled = true, },
        },
    },
    {
        'rcarriga/nvim-notify',
        keys = {
            {
                '<leader>un',
                function()
                    require('notify').dismiss { silent = true, pending = true }
                end,
                desc = 'Dismiss all Notifications',
            },
        },
        opts = {
            stages = 'slide',
            background_colour = 'NONE',
            on_open = function(win)
                vim.api.nvim_win_set_config(win, { zindex = 100 })
            end,
        },
    },
    {
        'brenoprata10/nvim-highlight-colors',
        lazy = false,
        opts = {
            render = 'virtual',
        },
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {
            preset = 'modern',
            keys = {
                scroll_down = '<Down>',
                scroll_up = '<Up>',
            },
            win = {
                border = 'rounded',
            },
            windblend = 10,
            show_help = false,
            show_keys = false
        }
    },
    {
        'HiPhish/rainbow-delimiters.nvim',
        main = 'rainbow-delimiters.setup',
        config = true,
        event = 'VeryLazy',
    },
    {
        'kevinhwang91/nvim-fundo',
        lazy = false,
        dependencies = 'kevinhwang91/promise-async',
        config = true,
        build = function() require('fundo').install() end,
    },
    {
        'andrewferrier/debugprint.nvim',
        config = true,
        keys = {
            { 'g?p', mode = 'n' },
            { 'g?P', mode = 'n' },
            { 'g?v', mode = 'n' },
            { 'g?V', mode = 'n' },
            { 'g?o', mode = 'n' },
            { 'g?O', mode = 'n' },
            { 'g?v', mode = 'x' },
            { 'g?V', mode = 'x' },
        },
    },
    {
        'cshuaimin/ssr.nvim',
        keys = {
            {
                '<leader>sr',
                function() require('ssr').open() end,
                { 'n', 'x' },
                desc = 'Structure search and replace',
            },
        },
        opts = {
            min_width = 50,
            min_height = 5,
            keymaps = {
                close = 'q',
                next_match = 'n',
                prev_match = 'N',
                replace_all = '<leader><cr>',
            },
        }
    },
    {
        'hrsh7th/nvim-insx',
        config = function() require('insx.preset.standard').setup() end,
        event = 'InsertEnter',
    },
    {
        'RaafatTurki/hex.nvim',
        config = true,
        cmd = 'HexToggle'
    },
    {
        'glacambre/firenvim',
        build = function()
            vim.fn['firenvim#install'](0)
        end,
        lazy = not vim.g.started_by_firenvim,
        config = function()
            vim.g.firenvim_config = {
                globalSettings = { alt = 'all' },
                localSettings = {
                    ['.*'] = {
                        cmdline  = 'neovim',
                        content  = 'text',
                        priority = 0,
                        selector = 'textarea',
                        takeover = 'always'
                    }
                }
            }
        end,
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup {
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            }
        end,
        keys = {
            { 'gc', mode = { 'n', 'v' } },
            { 'gb', mode = 'v' },
        }
    },
    {
        'danymat/neogen',
        cmd = 'Neogen',
        opts = {},
    },
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        requires = { { 'nvim-lua/plenary.nvim' } },
        keys = {
            { '<leader>a', function() require('harpoon'):list():append() end },
            { '<C-e>',     function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end },
            { '<C-h>',     function() require('harpoon'):list():select(1) end },
            { '<C-j>',     function() require('harpoon'):list():select(2) end },
            { '<C-k>',     function() require('harpoon'):list():select(3) end },
            { '<C-l>',     function() require('harpoon'):list():select(4) end },
            -- Toggle previous & next buffers stored within Harpoon list
            { '<C-M-H>',   function() require('harpoon'):list():prev() end },
            { '<C-M-L>',   function() require('harpoon'):list():next() end },
        },
        config = true
    },
    {
        'benlubas/wrapping-paper.nvim',
        keys = {
            {
                'gww', -- see :h gw to figure out why this makes sense.
                function() require('wrapping-paper').wrap_line() end,
                desc = 'fake wrap current line'
            }
        },
        dependencies = {
            'MunifTanjim/nui.nvim',
        },
    },
    {
        'folke/todo-comments.nvim',
        config = true,
        event = 'VeryLazy'
    },
    {
        'mistricky/codesnap.nvim',
        build = 'make build_generator',
        cmd = 'CodeSnap',
        opts = {
            mac_window_bar = true,
            title = '',
            code_font_family = 'JetBrains Mono',
            watermark = '',
        }
    },
    {
        'nvzone/showkeys',
        cmd = 'ShowkeysToggle',
        opts = {
            timeout = 1,
            maxkeys = 10,
        }
    },
    {
        'rachartier/tiny-inline-diagnostic.nvim',
        event = 'VeryLazy',
        priority = 1000,
        opts = {
            preset = 'powerline',
            options = {
                show_source = { enabled = true },
                multilines = { enabled = true },
                add_messages = { display_count = true },
                multiple_diag_under_cursor = true,
                show_all_diags_on_cursorline = true,
            }
        }
    },
    {
        'saecki/crates.nvim',
        event = { 'BufRead Cargo.toml' },
        opts = {
            completion = {
                crates = {
                    enabled = true,
                    max_results = 8, -- The maximum number of search results to display
                    min_chars = 3    -- The minimum number of charaters to type before completions begin appearing
                }
            },
            lsp = {
                enabled = true,
                actions = true,
                completion = true,
                hover = true,
            },
        }
    },
    {
        'onsails/lspkind.nvim',
        opts = {
            preset = 'codicons',
            mode = 'symbol',
            symbol_map = {
                Text = '',
                -- Method = '',
                -- Function = '',
                Constructor = '',
            },
        },
        config = function(_, opts)
            require('lspkind').init(opts)
        end,
    },
    {
        'nvimdev/lspsaga.nvim',
        event = 'LspAttach',
        keys = {
            {
                '<leader>ld',
                '<cmd>Lspsaga show_line_diagnostics<CR>'
            },
            {
                '[d',
                '<cmd>Lspsaga diagnostic_jump_next<CR>'
            },
            {
                ']d',
                '<cmd>Lspsaga diagnostic_jump_prev<CR>'
            },
            {
                '<leader>lf',
                '<cmd>Lspsaga finder<CR>'
            },
            {
                '<leader>ca',
                mode = {
                    'n',
                    'v',
                },
                '<cmd>Lspsaga code_action<CR>'
            },
            {
                '<leader>rn',
                '<cmd>Lspsaga rename<CR>'
            },
        },
        opts = {
            lightbulb = { virtual_text = false },
            border = 'rounded',
            rename = { in_select = false },
            code_action = { show_server_name = true },
            symbol_in_winbar = {
                enable = false,
                respect_root = true,
                separator = ' > ',
            },
            ui = {
                theme = 'round',
                border = 'rounded',
                winblend = vim.g.neovide and 60 or 0,
            },
            diagnostic = { on_insert = false }
        },
        config = function(_, opts)
            opts.ui.kind = require('catppuccin.groups.integrations.lsp_saga').custom_kind()
            opts.ui.kind['Folder'] = { '', 'NONE' }
            require('lspsaga').setup(opts)
        end
    },
    {
        'kevinhwang91/nvim-ufo',
        event = 'LspAttach',
        opts = {
            open_fold_hl_timeout = 0,
            -- close_fold_kinds = { 'imports', 'regions' }
        }
    },
    {
        'henry-hsieh/riscv-asm-vim',
        ft = 'riscv_asm',
    },
    {
        'rasulomaroff/reactive.nvim',
        enabled = false,
        -- event = 'VeryLazy',
        opts = {
            load = { 'catppuccin-mocha-cursor', 'catppuccin-mocha-cursorline' }
        }
    },
    {
        'xeluxee/competitest.nvim',
        cmd = { 'CompetiTest' },
        opts = {
            testcases_use_single_file = true,
            runner_ui = {
                interface = 'split',
            }
        }
    },
    {
        'nvim-neorg/neorg',
        ft = 'norg',
        cmd = 'Neorg',
        opts = {
            load = {
                ['core.defaults'] = {},
                ['core.completion'] = { config = { engine = 'nvim-cmp' } },
                ['core.concealer'] = {
                    config = {
                        icon_preset = 'diamond'
                    }
                },
                ['core.dirman'] = {
                    config = {
                        workspaces = {
                            note = '~/Documents/note',
                            todo = '~/Documents/todo',
                        },
                    }
                },
                ['core.export'] = {},
                ['core.summary'] = { config = { strategy = 'by_path' } },
                ['core.ui.calendar'] = {},
                ['core.todo-introspector'] = {},
                ['core.esupports.metagen'] = { config = { update_date = false } }, -- do not update date until https://github.com/nvim-neorg/neorg/issues/1579 fixed
            }
        },
    },
    {
        'sphamba/smear-cursor.nvim',
        enabled = false,
        lazy = false,
        opts = {
            smear_between_buffers = true,
            smear_between_neighbor_lines = true,
            scroll_buffer_space = true,
            legacy_computing_symbols_support = false,
            -- cursor_color = '#ffffff',
            -- gradient_exponent = 0,
            -- particles_enabled = true,
            -- particle_spread = 1,
            -- particles_per_second = 100,
            -- particles_per_length = 50,
            -- particle_max_lifetime = 1500,
            -- particle_max_initial_velocity = 10,
            -- particle_velocity_from_cursor = 0,
            -- particle_random_velocity = 300,
            -- particle_damping = 0.1,
            -- particle_gravity = 50,
        },
    },
    { 'kevinhwang91/nvim-bqf',    ft = 'qf' },
    {
        'ThePrimeagen/refactoring.nvim',
        keys = {
            {
                '<leader>re',
                mode = 'x',
                desc = 'Extract function',
                function() require('refactoring').refactor('Extract Function') end
            },
            {
                '<leader>rf',
                mode = 'x',
                desc = 'Extract function to file',
                function() require('refactoring').refactor('Extract Function To File') end
            },
            {
                '<leader>rv',
                mode = 'x',
                desc = 'Extract variable',
                function() require('refactoring').refactor('Extract Variable') end
            },
            {
                '<leader>rI',
                mode = 'n',
                desc = 'Inline function',
                function() require('refactoring').refactor('Inline Function') end
            },
            {
                '<leader>ri',
                mode = { 'n', 'x' },
                desc = 'Inline variable',
                function() require('refactoring').refactor('Inline Variable') end
            },
            {
                '<leader>rb',
                mode = 'n',
                desc = 'Extract block',
                function() require('refactoring').refactor('Extract Block') end
            },
            {
                '<leader>rbf',
                mode = 'n',
                desc = 'Extract block to file',
                function() require('refactoring').refactor('Extract Block To File') end
            }
        }

    },
    {
        'vyfor/cord.nvim',
        build = ':Cord update',
        event = 'VeryLazy',
        opts = {
            display = {
                theme = 'atom',
                flavor = 'dark',
                view = 'full',
                swap_fields = false,
                swap_icons = false,
            },
            text = {
                editing = function(opts)
                    return string.format('Editing %s:%s:%s', opts.filename, opts.cursor_line, opts.cursor_char)
                end
            }
        },
    },
    {
        'marcussimonsen/let-it-snow.nvim',
        cmd = 'LetItSnow', -- Wait with loading until command is run
        opts = {},
    },
    {
        'chrisgrieser/nvim-rulebook',
        keys = {
            {
                '<leader>lri',
                desc = 'Ignore rule',
                function() require('rulebook').ignoreRule() end,
            },
            {
                '<leader>lrl',
                desc = 'Lookup rule',
                function() require('rulebook').lookupRule() end,
            },
        }
    },
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        keys = {
            { '<leader><space>', function() Snacks.picker.smart() end,                desc = 'Smart Find Files' },
            { '<leader>/',       function() Snacks.picker.grep() end,                 desc = 'Grep' },
            { '<leader>:',       function() Snacks.picker.command_history() end,      desc = 'Command History' },
            { '<leader>e',       function() Snacks.explorer() end,                    desc = 'File Explorer' },
            { '<leader>fb',      function() Snacks.picker.buffers() end,              desc = 'Buffers' },
            { '<leader>ff',      function() Snacks.picker.files() end,                desc = 'Find Files' },
            { '<leader>fl',      function() Snacks.picker.lazy() end,                 desc = 'Search for Plugin Spec' },
            { '<leader>fr',      function() Snacks.picker.resume() end,               desc = 'Resume' },
            { '<leader>fu',      function() Snacks.picker.undo() end,                 desc = 'Undo History' },
            { '<leader>fd',      function() Snacks.picker.diagnostics() end,          desc = 'Diagnostic' },

            -- git
            { '<leader>gb',      function() Snacks.picker.git_branches() end,         desc = 'Git Branches' },
            { '<leader>gl',      function() Snacks.picker.git_log() end,              desc = 'Git Log' },
            { '<leader>gL',      function() Snacks.picker.git_log_line() end,         desc = 'Git Log Line' },
            { '<leader>gs',      function() Snacks.picker.git_status() end,           desc = 'Git Status' },
            { '<leader>gS',      function() Snacks.picker.git_stash() end,            desc = 'Git Stash' },
            { '<leader>gd',      function() Snacks.picker.git_diff() end,             desc = 'Git Diff (Hunks)' },
            { '<leader>gf',      function() Snacks.picker.git_log_file() end,         desc = 'Git Log File' },

            -- LSP
            { 'gd',              function() Snacks.picker.lsp_definitions() end,      desc = 'Goto Definition' },
            { 'gD',              function() Snacks.picker.lsp_declarations() end,     desc = 'Goto Declaration' },
            { 'gr',              function() Snacks.picker.lsp_references() end,       nowait = true,                  desc = 'References' },
            { 'gI',              function() Snacks.picker.lsp_implementations() end,  desc = 'Goto Implementation' },
            { 'gy',              function() Snacks.picker.lsp_type_definitions() end, desc = 'Goto T[y]pe Definition' },
            { '<leader>ss',      function() Snacks.picker.lsp_symbols() end,          desc = 'LSP Symbols' },
        },
        opts = {
            bigfile = { enabled = true },
            indent = {
                enabled = true,
                char = '▏',
                scope = {
                    enabled = true, -- enable highlighting the current scope
                    char = '▏',
                    treesitter = { enabled = true },
                    underline = true, -- underline the start of the scope
                },
            },
            image = { enabled = true },
            input = { enabled = true, },
            quickfile = { enabled = true },
            scroll = { enabled = true },
            picker = { enabled = true }
        },
    },
    {
        'chrisgrieser/nvim-lsp-endhints',
        event = 'LspAttach',
        opts = {},
    },
    {
        'zeioth/garbage-day.nvim',
        event = 'VeryLazy',
        opts = {}
    },
    {
        'yorickpeterse/nvim-tree-pairs',
        lazy = false,
        opts = {}
    },
    {
        'Darazaki/indent-o-matic',
        lazy = false,
        opts = {}
    },
    {
        'kawre/neotab.nvim',
        event = 'InsertEnter',
        opts = {}
    },
    {
        'b0o/incline.nvim',
        event = 'VeryLazy',
        config = function()
            local helpers = require 'incline.helpers'
            local devicons = require 'nvim-web-devicons'
            require('incline').setup {
                window = {
                    padding = 0,
                    margin = { horizontal = 0 },
                },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
                    if filename == '' then
                        filename = '[No Name]'
                    end
                    local ft_icon, ft_color = devicons.get_icon_color(filename)
                    local modified = vim.bo[props.buf].modified
                    return {
                        ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or
                        '',
                        ' ',
                        { filename, gui = modified and 'bold,italic' or 'bold' },
                        ' ',
                        guibg = '#44406e',
                    }
                end,
            }
        end,
    },
    { 'ravibrock/spellwarn.nvim', event = 'VeryLazy', opts = {} },
    {
        'sahaj-b/brainrot.nvim',
        event = 'VeryLazy',
        enabled = false,
        opts = {
            image_enabled = false,
            block_input = false,
            dim_level = 0,
        },
    }
}
