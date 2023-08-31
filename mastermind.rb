require './validator.rb'

class MastermindGame
    def initialize breaker, maker
        @validator = Validator.new
        @breaker = breaker
        @maker = maker
        @guesses = 12
        @is_correct_guess = false
    end

    def start
        until @guesses <= 0
            guess = get_guess

            if @maker.is_correct guess
                @is_correct_guess = true
                break
            end

            hints = @maker.ask_hints guess

            show_hints hints

            @guesses -= 1
        end

        if @is_correct_guess
            puts "You guessed it right!"
        else
            puts "Close, but no cigar..."
        end
    end

    private

    def show_hints hints
        puts "Correct placements: #{hints[:correct_placements]} | Correct numbers: #{hints[:correct_numbers]}"
    end

    def get_guess
        loop do
            guess = @breaker.guess

            if @validator.validate guess
                return guess.split('').map { |n| n.to_i }
            end

            print "Invalid guess! Try again: "
        end
    end
end
