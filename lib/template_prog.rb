#Gems de Scrapping
require 'rubygems'
require 'open-uri'
require 'nokogiri'

#Gems Watir & Co
require 'watir'
require 'launchy'

#Pour les tests
require 'pry'

# Au cas où on a des clés d'API
require 'dotenv'
Dotenv.load('.env') # Ceci appelle le fichier .env (situé dans le même dossier que celui d'où tu exécute app.rb)
# et grâce à la gem Dotenv, on importe toutes les données enregistrées dans un hash ENV
