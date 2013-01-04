-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

local awful = require("awful")

-- {{{ Main
theme = {}
theme.wallpaper_cmd = { awful.util.getdir("config") .. "/theme/nasaBackground.sh" }
-- }}}

-- {{{ Xresources
function queryX()
  local xcs = {}
  local h = assert(io.popen("xrdb -query"))
  local line = h:read()
  while line do
    local _,_,key,value = string.find(line,"*.(%w+):%s*(#%x+)")
    if key then
      xcs[key] = value
      line = h:read()
    else
      break
    end
  end
  h:close()
  return xcs
end

xcolors = queryX()
-- }}}


-- {{{ Styles
theme.font      = "sans 10"

-- {{{ Colors
theme.fg_normal = xcolors.foreground
theme.fg_focus  = xcolors.foreground
theme.fg_urgent = xcolors.color1
theme.bg_normal = xcolors.background
theme.bg_focus  = xcolors.color7
theme.bg_urgent = xcolors.background
-- }}}

-- {{{ Borders
theme.border_width  = "2"
theme.border_normal = xcolors.color7
theme.border_focus  = xcolors.color4
theme.border_marked = xcolors.color5
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = xcolors.color7
theme.titlebar_bg_normal = xcolors.background
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
theme.taglist_bg_focus = xcolors.color7
theme.taglist_fg_focus = xcolors.foreground
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = xcolors.color1
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = "15"
theme.menu_width  = "100"
-- }}}



-- {{{ Icons

-- {{{ Generate Icons
awful.util.spawn_with_shell( awful.util.getdir("config") .. "/theme/mkicons --size 24x24 --fg '" .. xcolors.color11  .. "' --bg trans")
-- }}}


-- {{{ Taglist
theme.taglist_squares_sel = "/usr/share/awesome/themes/default/taglist/squarefw.png"
theme.taglist_squares_unsel = "/usr/share/awesome/themes/default/taglist/squarew.png"
-- theme.taglist_squares_sel   = awful.util.getdir("config") .. "theme/taglist/squarefz.png"
-- theme.taglist_squares_unsel = awful.util.getdir("config") .. "theme/taglist/squarez.png"
-- theme.taglist_squares_resize = "true"
-- }}}

-- {{{ Misc
theme.awesome_icon           = awful.util.getdir("config") .. "theme/layouts/awesome.png"
theme.menu_submenu_icon      = awful.util.getdir("config") .. "theme/layouts/awesome.png"
theme.tasklist_floating_icon = awful.util.getdir("config") .. "theme/layouts/floatingw.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = awful.util.getdir("config") .. "/theme/layouts/tile.png"
theme.layout_tileleft   = awful.util.getdir("config") .. "/theme/layouts/tileleft.png"
theme.layout_tilebottom = awful.util.getdir("config") .. "/theme/layouts/tilebottom.png"
theme.layout_tiletop    = awful.util.getdir("config") .. "/theme/layouts/tiletop.png"
theme.layout_fairv      = awful.util.getdir("config") .. "/theme/layouts/fairv.png"
theme.layout_fairh      = awful.util.getdir("config") .. "/theme/layouts/fairh.png"
theme.layout_spiral     = awful.util.getdir("config") .. "/theme/layouts/spiral.png"
theme.layout_dwindle    = awful.util.getdir("config") .. "/theme/layouts/dwindle.png"
theme.layout_max        = awful.util.getdir("config") .. "/theme/layouts/max.png"
theme.layout_fullscreen = awful.util.getdir("config") .. "/theme/layouts/fullscreen.png"
theme.layout_magnifier  = awful.util.getdir("config") .. "/theme/layouts/magnifier.png"
theme.layout_floating   = awful.util.getdir("config") .. "/theme/layouts/floating.png"
-- }}}

return theme
