class Bienvenido < Chingu::GameState

	def initialize
		super
		self.input = {:escape => :exit}
		@parallax = Chingu::Parallax.create(:x => 400, :y => 400, :rotation_center => :top_left)
		@parallax << Chingu::ParallaxLayer.new(:image => "welcome.png")
		self.input = {:escape => :exit}
		self.input = [:return => Via]

	end


end
