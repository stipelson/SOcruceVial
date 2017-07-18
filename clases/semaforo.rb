class Semaforo < Chingu::GameObject
	traits :collision_detection, :bounding_box
	attr_accessor :last_x, :last_y

	def initialize(options = {})
		super
		@sem1 = options[:uno]
		@sem3 = options[:dos]
		@vertical = options[:vertical]
		@sem2 = 1
		self.zorder = 1000
		self.scale = 1

		@animations = Chingu::Animation.new(:file => "semaforo_40x40.png")
		@animations.frame_names = {:verde => 0..0, :amarillo => 1..1, :rojo => 2..2}
		@animation = @animations[:rojo]
	end

	def cambiarRojo
		@animation = @animations[:rojo]
	end

	def cambiarVerde
		@animation = @animations[:verde]
	end

	def cambiarAmarillo
		@animation = @animations[:amarillo]
	end


	def update
    @image = @animation.next

    Thread.new{

			if @sem1 == 1 and @sem2 == 0 and @sem3 == 0

				if @vertical == 0
					$semaforoHpermiso = 0
				end
				if @vertical == 1
					$semaforoVpermiso = 0
				end
        @animation = @animations[:rojo]
        sleep 3
				@sem1 = 0
				@sem2 = 1
				@sem3 = 1
        sleep 3

			end

			if (@sem1 == 0 and @sem2 == 1 and @sem3 == 1) or (@sem1 == 1 and @sem3 == 0 and @sem2 == 1)

				if @vertical == 0
					$semaforoHpermiso = 0
				end
				if @vertical == 1
					$semaforoVpermiso = 0
				end
        @animation = @animations[:amarillo]
        sleep 3
				@sem2 = 0
        sleep 3

			end

			if @sem3 == 1 and @sem2 == 0 and @sem1 == 0

				if @vertical == 0
					$semaforoHpermiso = 1
				end
				if @vertical == 1
					$semaforoVpermiso = 1
				end
        @animation = @animations[:verde]
        sleep 3
				@sem1 = 1
				@sem2 = 1
				@sem3 = 0
        sleep 3
			end

			@last_x, @last_y = @x, @y
    }

	end
end
