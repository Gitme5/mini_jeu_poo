require 'rubygems'
require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


enemies = []
input = ""

puts "-------------------------------------------------" 
puts "|  Bienvenue sur 'ILS VEULENT TOUS MA POO' !    |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------\n"


#Initialisation du joueur humain
puts "Quel est ton prénom ?"
print "> "
human_name = gets.chomp.to_s

user = HumanPlayer.new(human_name)

#Initialisation des bots ennemis
player1 = Player.new("Josiane")
enemies << player1 #on entre les bots enemis dans un tableau
player2 = Player.new("José")
enemies << player2



# On joue tant que Human player est en vie ou que les bots sont en vie
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
	
	puts ""
	puts user.show_state
	puts player1.show_state
	puts player2.show_state

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

	input = gets.chomp.to_s
	#Récupération et Vérification de la saisie utilisateur
	while !(input == "a" || input == "s" || input == "0" || input == "1") 
		input = gets.chomp.to_s
		puts "Veuillez entrer les lettres proposées dans le menu"
	end
	
	#Test en fonction de la saisie utilisateur
	if input == "a"
		puts "\n==================Recherche d'arme en cours\n=================" 
		user.search_weapon 
	elsif input == "s"
		puts "\n==================Recherche de soins en cours\n===============" 
		user.search_health_pack
	elsif input == "0"
		puts "\n==================#{user.name} attaque #{player1.name}\n======"
		user.attacks(player1)
	elsif input == "1"
		puts "\n==================#{user.name} attaque #{player2.name}\n======"
		user.attacks(player2)
	end

	puts "\n========== BIM * BAM ============="
	puts "Les autres joueurs t'attaquent !!!"
	puts "==================================\n"


	#Boucle pour gérer plusieurs ennemis
	enemies.each do |player|
		if player.life_points <=0
			break
		else
			player.attacks(user)
		end
	end
end

puts "\nLa partie est finie" 

if user.life_points > 0
	puts "\nBRAVO ! TU AS GAGNE !"
else
	puts "\nLoser ! Tu as perdu"
end

#binding.pry
