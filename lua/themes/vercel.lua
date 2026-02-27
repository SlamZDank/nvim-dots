-- inspired by https://github.com/SwiftlyDaniel/vercel-carbon
local M = {}

M.base_30 = {
  black = "#000000",
  darker_black = "#050505",
  white = "#ededed",
  black2 = "#1f1f1f",
  one_bg = "#111111",
  one_bg2 = "#1a1a1a",
  one_bg3 = "#222222",
  grey = "#555555",
  grey_fg = "#666666",
  grey_fg2 = "#777777",
  light_grey = "#c1c1ca",
  red = "#f4a0a0",
  baby_pink = "#f7b8b8",
  pink = "#FF4C8D",
  line = "#1a1a1a",
  green = "#00CA51",
  vibrant_green = "#4ade80",
  nord_blue = "#a8c8f8",
  blue = "#b0d0f8",
  yellow = "#E5B800",
  sun = "#fbbf24",
  purple = "#C372FC",
  dark_purple = "#a78bfa",
  teal = "#4CC0BA",
  orange = "#f59e0b",
  cyan = "#06b6d4",
  statusline_bg = "#080808",
  lightbg = "#1a1a1a",
  pmenu_bg = "#b0d0f8",
  folder_bg = "#a8c8f8",
}

M.base_16 = {
  base00 = "#000000",
  base01 = "#0a0a0a",
  base02 = "#1a1a1a",
  base03 = "#c0c0c8",
  base04 = "#a1a1aa",
  base05 = "#ededed",
  base06 = "#f5f5f5",
  base07 = "#ffffff",
  base08 = "#FF4C8D",
  base09 = "#E5B800",
  base0A = "#E5B800",
  base0B = "#00CA51",
  base0C = "#4CC0BA",
  base0D = "#C372FC",
  base0E = "#a8c8f8",
  base0F = "#f4a0a0",
}

M = require("base46").override_theme(M, "vercel")
M.type = "dark"
return M
