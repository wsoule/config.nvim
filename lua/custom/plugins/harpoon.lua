return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Harpoon [a]dd.' })
    -- Open Harpoon menu.
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon [m]enu.', noremap = true })

    vim.keymap.set('n', '<leader>Hpr', function()
      local fileIndex = vim.fn.input 'Harpoon Index: '
      harpoon:list():replace_at(tonumber(fileIndex))
    end, { noremap = true, desc = '[H]ar[p]oon [r]eplace.' })

    for i = 1, 4 do
      vim.keymap.set('n', '<leader>' .. i, function()
        harpoon:list():select(i)
      end, { desc = 'Harpoon get index ' .. i })
    end

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<C-}>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<C-{>', function()
      harpoon:list():next()
    end)

    -- configure telescope to work with harpoon
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end
      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end
    vim.keymap.set('n', '<leader>sp', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open harpoon window' })
  end,
}
