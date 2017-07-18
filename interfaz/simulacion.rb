require 'chingu'
include Gosu
require 'gosu_tiled'
require_relative '../clases/via'
require_relative 'bienvenido'



class Simulacion < Chingu::Window

			$verticales = 0
			$horizontales = 0

	def initialize

		super(800, 800, false)
		self.input = {:escape => :exit}
		self.caption = "#{Gosu.fps} FPS. Simulación de semaforos"
		switch_game_state(Bienvenido)
		self.input = {:escape => :exit}

	end

	def parametros(v, h)
		$verticales = v
		$horizontales = h
	end
end
