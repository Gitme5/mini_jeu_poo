class Game
	attr_accessor :human_player, :enemies


	def initialize(name) #Initialisation.
		@life_points = 10
		@name = name
		
		enemies  = []
		#Création des ennemis à l'initialisation
		#ennemies = [player1 = Player.new("Josiane"), player2 = Player.new("José"), player3 = Player.new("Josy"), player4 = Player.new("Jojo")]
		enemies << player1 = Player.new("Josiane")
		enemies << player2 = Player.new("José")
		enemies << player3 = Player.new("Josy")
		enemies << player4 = Player.new("Jojo")
		
		user = HumanPlayer.new(name)
	end



	def kill_player(player)
		
	end
end