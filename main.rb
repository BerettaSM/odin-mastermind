require './mastermind.rb'
require './code-breaker.rb'
require './code-maker.rb'

breaker = HumanCodeBreaker.new
maker = ComputerCodeMaker.new
game = MastermindGame.new breaker, maker

game.start
