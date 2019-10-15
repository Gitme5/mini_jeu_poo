require 'rubygems'
require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'




puts "\n-------------------------------------------------" 
puts "|  Bienvenue sur 'ILS VEULENT TOUS MA POO' !    |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------\n"


#Initialisation du joueur humain
puts "Quel est ton prénom ?"
print "> "
human_name = gets.chomp.to_s


my_game = Game.new(human_name)



while Game.is_still_ongoing? == true #Play until players are dead

	Game.show_players #Show players status
	Game.menu #Show menu to player
	input = gets.chomp #Get user input
	Game.menu_choice(input) #Choice selection
	Game.enemies_attack #Enemies attack turn

end

Game.end #The END

#binding.pry
