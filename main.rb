require "gtk3"
require_relative 'interfaz/menuPrincipal'

menu = MenuPrincipal.new
menu.move(5, 10)
Gtk.main
