require_relative 'numberinputentry'
require_relative 'botonInicio'

class MenuPrincipal < Gtk::Window
  def initialize
    super
    self.title = "Simulacion semaforos"
    signal_connect("destroy") do
      Gtk.main_quit

    end

    iniciarInterfaz #llamado que declara el boton e inputs
    show_all  #metodo de la clase window que refresca y muestra todo lo que se haya incluido en el contructor

  end

  def iniciarInterfaz
    set_border_width 15
      botonIniciar = BotonInicio.new
      panelVertical = Gtk::Box.new(:vertical)
      add(panelVertical)
      botonIniciar.set_size_request 80,35
      panelVertical.add(botonIniciar)
      panelVertical.add(NumberInputEntry.new(botonIniciar, "vehiculos_Vertical", 5))
      panelVertical.add(NumberInputEntry.new(botonIniciar, "vehiculos_Horizontal", 5))
      # bonotinIniciar es quien recibe los parametros para los autos
  end



end
