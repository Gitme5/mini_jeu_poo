require_relative 'player'


class Game
	attr_accessor :human_player, :enemies


	def initialize(name) #Initialisation du jeu / création des joueurs
		#Création des ennemis à l'initialisation
		@enemies = [player1 = Player.new("Josiane"), player2 = Player.new("José"), player3 = Player.new("Josy"), player4 = Player.new("Jojo")]
		@user = HumanPlayer.new(name)
	end


	#Suppression de joueur du array enemies
	def kill_player(player)
		@enemies.keep_if { |enemy|  enemy.singleton_class  != player.singleton_class }
	end

	#Vérifie s'il y a encore des joueurs disponibles
	def is_still_ongoing?
		if @user.life_points > 0 && @enemies.size != 0
			return true
		else 
			return false
		end
	end

	#Affiche les participants à la partie
	def show_players
		puts @user.show_state
		puts "Il y a #{@enemies.size} ennemis"
	end

	#Menu de choix pour joueur humain
	def menu
		puts "\nQuelle action veux-tu effectuer ?"
		puts "a - chercher une meilleure arme"
		puts "s - chercher à se soigner\n"

		puts "\nattaquer un joueur en vue :"
		if player1.life_points > 0 
			puts "0 - Josiane a #{player1.life_points} points de vie"
		end
		if player2.life_points > 0
			puts "1 - José a #{player2.life_points} points de vie"
		end
		if player3.life_points > 0
			puts "2 - José a #{player3.life_points} points de vie"
		end
		if player4.life_points > 0
			puts "3 - José a #{player4.life_points} points de vie"
		end
	end

	def menu_choice(input)
		if input == "a"
			puts "\n================= Recherche d'arme en cours\n=================" 
			user.search_weapon 
		elsif input == "s"
			puts "\n================= Recherche de soins en cours\n===============" 
			user.search_health_pack
		else
			user.attacks(@enemies[input.to_i]) #Attack the bot
			if @enemies[input.to_i].life_points <=0
				kill_player(@enemies[input.to_i]) #Kill him it there is no life point left
			end
		end
		
	end

	def enemies_attack

		puts "\n========== BIM * BAM ============="
		puts "Les autres joueurs t'attaquent !!!"
		puts "==================================\n"

		#Boucle pour gérer plusieurs ennemis
		@enemies.each do |player|
			if player.life_points <=0
				break
			else
				player.attacks(user)
			end
		end
	end


	def end
		puts "\nLa partie est finie" 

		if user.life_points > 0
			puts "\nBRAVO ! TU AS GAGNE !"
		else
			puts "\nLoser ! Tu as perdu"
		end	
		
	end


end