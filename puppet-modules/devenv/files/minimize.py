#!/usr/bin/env python
import wnck
import gtk

screen = wnck.screen_get_default()

while gtk.events_pending():
    gtk.main_iteration()

windows = screen.get_windows()
active = screen.get_active_window()

for w in windows:
    if not w == active:
        w.minimize()
