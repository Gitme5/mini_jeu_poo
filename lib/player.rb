class Player
	attr_accessor :name, :life_points

	def initialize(name) #Initialisation. Points de vie par défaut et Nom en paramètre
		@life_points = 10
		@name = name

	end


	def show_state
		return puts "#{@name} a #{@life_points} points de vie"
		
	end


	def gets_damage(damage) #On indique les dommages subis en paramètre. On recalcule le nouveau niveau de vie. Si on a plus de point de vie le joueur a perdu
		if @life_points > 0 #Pour ne pas continuer de retirer des points vie si on en a déjà plus
			#puts "Vous venez de prendre #{damage} points de damage"
			@life_points -= damage
			if @life_points <= 0
				puts "Le joueur #{@name} a été tué! GAME OVER!"
			else
				return @life_points
			end
		else
			puts "Vous êtes mort on a dit ! GAME OVER!"
		end
	end


	def attacks(player_attacked) #Attaque d'un joueur. Le joueur attaqué est en paramètre de cette méthode
		puts "Le joueur #{@name} attaque le joueur #{player_attacked.name}"
		damage = compute_damage #Calcul des dommages
		puts "il lui inflige #{damage} points de dommages"
		player_attacked.gets_damage(damage) #On retire les points de vie au joueur attaqué
	end


	def compute_damage #Lancé de dés pour déterminer les dommages reçus
		return rand(1..6)
	end

end


class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(name)
		@life_points = 100
		@weapon_level = 1
		super (name)
	end


	def show_state
		return puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
	end


	def compute_damage
		return rand(1..6) * @weapon_level	
	end


	def search_weapon
		# Recherche d'une arme
		weapon_found = rand(1..6)
		puts "Tu as trouvé une arme de niveau #{weapon_found}"
		if weapon_found > @weapon_level
			@weapon_level = weapon_found
			puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends"
		else
			puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."	
		end
		return @weapon_level

	end


	def search_health_pack # Recherche de pack de vie
		health_pack_found = rand(1..6)
		if health_pack_found == 1
			puts "Tu n'as rien trouvé"
		elsif health_pack_found >= 2 && health_pack_found <= 5
			@life_points += 50
			if @life_points > 100
				@life_points = 100
			end
			return puts "Bravo, tu as trouvé un pack de +50 points de vie"
		else
			@life_points += 80
			if @life_points > 100
				@life_points = 100
			end
			return puts "Waow, tu as trouvé un pack de +80 points de vie !"
		end	
	end

end









