local M = {}

local valid = { en = true, es = true }
local current = vim.env.NVIM_KEYBOARD_LAYOUT or "en"
if not valid[current] then current = "en" end
vim.g.keyboard_layout = current

local function apply_es_aliases()
  -- Aliases pensados para layout español: evitan depender de símbolos menos cómodos.
  -- No modificamos los comandos Vim nucleares; añadimos alternativas.
  vim.keymap.set({ "n", "x" }, "ñ", ";", { remap = true, desc = "Alias ; (ES)" })
  vim.keymap.set({ "n", "x" }, "Ñ", ":", { remap = true, desc = "Alias : (ES)" })
end

local function clear_es_aliases()
  pcall(vim.keymap.del, { "n", "x" }, "ñ")
  pcall(vim.keymap.del, { "n", "x" }, "Ñ")
end

function M.apply(layout)
  if not valid[layout] then
    vim.notify("Keyboard layout must be 'en' or 'es'", vim.log.levels.ERROR)
    return
  end
  clear_es_aliases()
  vim.g.keyboard_layout = layout
  if layout == "es" then apply_es_aliases() end
  vim.notify("Keyboard layout: " .. layout)
end

vim.api.nvim_create_user_command("KeyboardLayout", function(opts)
  M.apply(opts.args)
end, {
  nargs = 1,
  complete = function() return { "en", "es" } end,
})

M.apply(current)
return M
