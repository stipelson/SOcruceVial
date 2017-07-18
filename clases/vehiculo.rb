
class Vehiculo < Chingu::GameObject
	traits :collision_detection, :bounding_box
	attr_accessor :last_x, :last_y, :speed

	def initialize(options = {})
		super
		if $verticales > 5 or $horizontales > 5
			@speed = 5
		else
			@speed = 2

		end
		@tipo = options[:vertical]
    @inicio_x = options[:x]
    @inicio_y = options[:y]
		@image = Image["vehiculo-#{@tipo}.png"]
	end

	def setup

	end

	def update

		if @tipo == 1
			@x += @speed
      if $semaforoHpermiso == 0 and @x == 300
  			@x = @last_x
  		end

		elsif @tipo == 2
			@y += @speed
      if $semaforoVpermiso == 0 and @y == 300
  			@y = @last_y
  		end
		end

		Vehiculo.each_collision(Vehiculo) do |vehiculo, v|
		 	@x = @last_x
       @y = @last_y
		end

		if @x>$window.width
			@x = @inicio_x - 60
		end

		if @y>$window.height
			@y = @inicio_y - 60
		end

		@last_x, @last_y = @x, @y

	end
end
