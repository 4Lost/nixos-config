require("bunny"):setup({
  hops = {
    { key = "/", path = "/", desc = "Root" },
    { key = "n", path = "/nix/store", desc = "Nix store" },
    { key = "~", path = "~", desc = "Home" },
    { key = "r", path = "~/Repos", desc = "Repos" },
    { key = "d", path = "~/Downloads", desc = "Downloads" },
    { key = "D", path = "~/Documents", desc = "Documents" },
    { key = "c", path = "~/.config", desc = "Config files" },
    { key = { "N", "h" }, path = "~/Nextcloud", desc = "Nexctloud root" },
    { key = { "N", "d" }, path = "~/Nextcloud/Data/Documents", desc = "Nextcloud documents" },
    { key = { "N", "u" }, path = "~/Nextcloud/Uni", desc = "Nextcloud uni" },
    -- key and path attributes are required, desc is optional
  },
  desc_strategy = "path", -- If desc isn't present, use "path" or "filename", default is "path"
  ephemeral = true, -- Enable ephemeral hops, default is true
  tabs = true, -- Enable tab hops, default is true
  notify = false, -- Notify after hopping, default is false
  fuzzy_cmd = "fzf", -- Fuzzy searching command, default is "fzf"
})

require("git"):setup({
  -- Order of status signs showing in the linemode
  order = 1500,
})
