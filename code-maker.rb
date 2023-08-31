class CodeMaker
    def is_correct guess
        raise NotImplementedError
    end

    def ask_hints guess
        raise NotImplementedError
    end
end

class ComputerCodeMaker < CodeMaker
    def initialize
        @code = generate_code
    end

    def is_correct guess
        @code == guess
    end

    def ask_hints guess
        correct_placements = 0
        correct_numbers = 0

        @code.each_with_index do |num, index|
            if num == guess[index]
                correct_placements += 1
            elsif 
            end
        end
    end

    private

    def generate_code
        Array.new(4).collect { rand_number(1, 6) }
    end

    def rand_number min, max
        min + (rand * (max - min + 1)).floor
    end
end
