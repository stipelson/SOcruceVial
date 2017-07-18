require_relative 'simulacion'

class BotonInicio < Gtk::Button
	attr_accessor :vehiculos_Vertical, :vehiculos_Horizontal

	PROPERTIES = [
		"vehiculos_Vertical",
		"vehiculos_Horizontal"
	]

	PROPERTIES.each do |property|
		attr_accessor property
	end

	def initialize
		super(:label => "Inicio - salida")
		signal_connect("clicked") do
			Thread.new do

			@simulacion = Simulacion.new
			@simulacion.parametros(vehiculos_Vertical, vehiculos_Horizontal)
			@simulacion.show

			end

		end
	end
end
