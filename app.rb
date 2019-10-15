require 'rubygems'
require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

a = 0

	player1 = Player.new("USA")
	puts "PLAYER 1 ! >>>>> #{player1.name} !!\n"
	sleep(a)

	player2 = Player.new("CHINA")
	puts "PLAYER 2 ! >>>>> #{player2.name} !!\n"
	sleep(a)

	while player1.life_points > 0 && player2.life_points > 0

		puts "\n\nVoici l'état de chaque Joueur :"
		puts "#{player1.show_state}"
		sleep(a)
		puts "#{player2.show_state}"
		sleep(a)

		print "\n            Noooooow "
		sleep(a)
		puts " FIGHT !!!\n\n"
		sleep(a) 


		puts "\nBIM !!!"
		player1.attacks(player2)
		sleep(a)
		puts "\nBAM !!!"
		player2.attacks(player1)
		sleep(a)

		if player1.life_points <= 0 || player2.life_points <= 0
			break
		end

	end

	puts "\nRESULTAT sur #{fight_count} combats"
	puts "#{player1.name} = #{one} points"
	puts "#{player2.name} = #{two} points"
end



#binding.pry