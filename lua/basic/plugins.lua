--[[
Author: JackFly
since: 2022-04-14 11:33:55
lastTime: 2022-04-15 10:11:37
文件相对于项目的路径: /nvim/lua/basic/plugins.lua
LastAuthor: Do not edit
message:
--]]
--[[
Author: JackFly
since: 2022-04-14 11:33:55
lastTime: 2022-04-14 15:09:15
文件相对于项目的路径: /nvim/lua/basic/plugins.lua
LastAuthor: Do not edit
message:
--]]
local packer = require("packer")
packer.startup(
  {
    function(use)
      -- Packer 可以管理自己本身
      use 'wbthomason/packer.nvim'
       -- tokyonight
       use("folke/tokyonight.nvim")

        -- 中文文档
        use {
         "yianwillis/vimcdoc",
        }

       -- nvim-tree
      use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            -- 依赖一个图标插件
            "kyazdani42/nvim-web-devicons"
        },
        config = function()
            -- 插件加载完成后自动运行 lua/conf/nvim-tree.lua 文件中的代码
            require("conf.nvim-tree")
        end
      }

      -- 炫酷的状态栏插件
      use {
        "windwp/windline.nvim",
        config = function()
            -- 插件加载完成后自动运行 lua/conf/windline.lua 文件中的代码
            require("conf.windline")
        end
      }

      use {
        "lewis6991/gitsigns.nvim",
        requires = {
            -- 依赖于该插件（一款 Lua 开发使用的插件）
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("gitsigns").setup()
        end
      }

      -- 支持 LSP 状态的 buffer 栏
      use {
        "akinsho/bufferline.nvim",
        requires = {
            "famiu/bufdelete.nvim" -- 删除 buffer 时不影响现有布局
        },
        config = function()
            require("conf.bufferline")
        end
      }

      -- 显示缩进线
      use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("conf.indent-blankline")
        end
      }
      -- 自动匹配括号
      use {
        "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup()
        end
      }

      -- 拼写检查器
      use {
        "lewis6991/spellsitter.nvim",
        config = function()
          require("spellsitter").setup(
              {
                  enable = true
              }
          )
        end
      }

      -- 显示滚动条
      use {
        "petertriho/nvim-scrollbar",
        config = function()
            require("conf.nvim-scrollbar")
        end
      }

      -- 显示网页色
      use {
        "norcalli/nvim-colorizer.lua",
        config = function()
          require("colorizer").setup()
        end
      }

      -- 内置终端
      use {
        "akinsho/toggleterm.nvim",
        config = function()
            require("conf.toggleterm")
        end
      }
     end,
    -- 使用浮动窗口
    config = {
      display = {
          open_fn = require("packer.util").float
      }
    }
  }

)


-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)