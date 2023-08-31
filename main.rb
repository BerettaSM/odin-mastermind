require './mastermind.rb'
require './code-breaker.rb'

breaker = HumanCodeBreaker.new
game = MastermindGame.new breaker, nil

game.start
