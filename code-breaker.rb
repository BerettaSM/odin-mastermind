class CodeBreaker
    def initialize
    end

    def guess
        raise NotImplementedError
    end
end

class HumanCodeBreaker < CodeBreaker
    def guess
        print "Enter your guess: "
        gets.chomp
    end
end
