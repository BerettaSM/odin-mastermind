class MastermindGame
    def initialize breaker, maker
        @breaker = breaker
        @maker = maker
        @guesses = 12
        @is_correct_guess = false
    end

    def start
        until @guesses == 0
            guess = @breaker.guess
            
            if @maker.is_correct guess
                @is_correct_guess = true
                break
            end

            hints = @maker.ask_hints guess

            puts hints

            @guesses -= 1
        end

        if @is_correct_guess
            puts "You guessed it right!"
        else
            puts "Close, but no cigar..."
        end
    end
end
