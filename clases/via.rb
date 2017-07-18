require_relative 'vehiculo'
require_relative 'semaforo'

class Via < Chingu::GameState

	$semaforo1 = 1
	$semaforo2 = 0
	$semaforoVpermiso = 1
	$semaforoHpermiso = 1


	def initialize
		super(options = {})
		@vehiculosVerticales = $verticales
		@vehiculosHorizontales = $horizontales

		@parallax = Chingu::Parallax.create(:x => 400, :y => 400, :rotation_center => :top_left)
		@parallax << Chingu::ParallaxLayer.new(:image => "via.png")
		@semaforoVertical = Semaforo.create(:x=> 340, :y =>460, :uno => $semaforo1, :dos => $semaforo2, :vertical => 0)
		@semaforoHorizontal = Semaforo.create(:x=> 460, :y =>340, :uno => $semaforo1 - 1, :dos => $semaforo2 + 1, :vertical => 1)
		@temporal = 0
		@temporal2 = 0

		for i in 1..$horizontales
			Vehiculo.create(:x => @temporal -= 60, :y => 380, :vertical => 1)
		end

		for i in 1..$verticales
			Vehiculo.create(:x => 380, :y => @temporal2 -= 60, :vertical => 2)
		end

	end

	def update
		super		
	end

end
