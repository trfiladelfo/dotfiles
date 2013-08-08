-----------------------------------
-- "Tomorrow Night" awesome theme--
-----------------------------------

-- {{{ Main
theme = {}
theme.icons = os.getenv("HOME") .. "/.awesome/icons"
-- }}}

-- {{{ Styles
theme.font      = "Envy Code R 8"
theme.tasklist_disable_icon = true

-- {{{ Colors
theme.fg_grey = "#c5c8c6"
theme.fg_black = "#1d1f21"
theme.fg_red = "#cc6666"
theme.fg_green = "#b5bd68"
theme.fg_yellow = "#f0c674"
theme.fg_blue = "#81a2be"
theme.fg_magenta = "#94738c"
theme.fg_cyan = "#8abeb7"
theme.fg_white = "#aaaaaa"

theme.fg_normal = "#DCDCCC"
theme.fg_focus  = "#F0DFAF"
theme.fg_urgent = "#CC9393"
theme.bg_normal = "#3F3F3F"
theme.bg_focus  = "#1E2320"
theme.bg_urgent = "#3F3F3F"
-- }}}

-- {{{ Borders
theme.border_width  = "2"
theme.border_normal = "#c5c8c6"
theme.border_focus  = "#81a2be"
theme.border_marked = "#de935f"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#cc6666"
theme.titlebar_bg_normal  = "#cc6666"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#de935f"
-- }}}

-- {{{ Menu
theme.menu_height = "15"
theme.menu_width  = "100"
-- }}}

-- {{{ Icons
theme.widget_arch = theme.icons .. "/blue/arch.png"
theme.widget_pac = theme.icons .. "/yellow/pacman.png"
theme.widget_mail = theme.icons .. "/red/mail.png"
theme.widget_mem = theme.icons .. "/magenta/mem.png"
theme.widget_cpu = theme.icons .. "/magenta/cpu.png"
theme.widget_mpd = theme.icons .. "/blue/play.png"
theme.widget_netup = theme.icons .. "/yellow/net_up_03.png"
theme.widget_netdown = theme.icons .. "/green/net_down_03.png"
theme.widget_tag_black = theme.icons .. "/black/fs_01.png"
theme.widget_tag_red = theme.icons .. "/red/fs_01.png"
theme.widget_tag_magenta = theme.icons .. "/magenta/fs_01.png"
theme.widget_tag_yellow = theme.icons .. "/yellow/fs_01.png"
theme.widget_tag_green = theme.icons .. "/green/fs_01.png"
theme.widget_spkr = theme.icons .. "/blue/spkr_01.png"
-- }}}

-- {{{ Taglist
theme.taglist_squares_sel   = "/usr/share/awesome/themes/zenburn/taglist/squarefz.png"
theme.taglist_squares_unsel = "/usr/share/awesome/themes/zenburn/taglist/squarez.png"
-- }}}

-- {{{ Misc
theme.awesome_icon           = "/usr/share/awesome/themes/zenburn/awesome-icon.png"
theme.menu_submenu_icon      = "/usr/share/awesome/themes/default/submenu.png"
theme.tasklist_floating_icon = "/usr/share/awesome/themes/default/tasklist/floatingw.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = "/usr/share/awesome/themes/zenburn/layouts/tile.png"
theme.layout_tileleft   = "/usr/share/awesome/themes/zenburn/layouts/tileleft.png"
theme.layout_tilebottom = "/usr/share/awesome/themes/zenburn/layouts/tilebottom.png"
theme.layout_tiletop    = "/usr/share/awesome/themes/zenburn/layouts/tiletop.png"
theme.layout_fairv      = "/usr/share/awesome/themes/zenburn/layouts/fairv.png"
theme.layout_fairh      = "/usr/share/awesome/themes/zenburn/layouts/fairh.png"
theme.layout_spiral     = "/usr/share/awesome/themes/zenburn/layouts/spiral.png"
theme.layout_dwindle    = "/usr/share/awesome/themes/zenburn/layouts/dwindle.png"
theme.layout_max        = "/usr/share/awesome/themes/zenburn/layouts/max.png"
theme.layout_fullscreen = "/usr/share/awesome/themes/zenburn/layouts/fullscreen.png"
theme.layout_magnifier  = "/usr/share/awesome/themes/zenburn/layouts/magnifier.png"
theme.layout_floating   = "/usr/share/awesome/themes/zenburn/layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/zenburn/titlebar/close_focus.png"
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/zenburn/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme
