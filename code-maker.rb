class CodeMaker
    def initialize
        @code = generate_code
    end

    def is_correct guess
        @code == guess
    end

    def ask_hints guess
        correct_placements = get_correct_placements guess, @code

        correct_numbers = get_correct_numbers_quantity guess

        {
            correct_placements: correct_placements.filter { |x| x }.length,
            correct_numbers: correct_numbers
        }
    end

    def generate_code
        raise NotImplementedError
    end

    private

    def get_correct_placements arr_1, arr_2
        arr_1.each_index.collect { |i| arr_1[i] == arr_2[i] }
    end

    def get_correct_numbers_quantity guess
        incorrect_placements = get_correct_placements(guess, @code).map { |n| !n }

        arr_1 = @code.each_index.filter_map { |i| @code[i] if incorrect_placements[i] }
        arr_2 = guess.each_index.filter_map { |i| guess[i] if incorrect_placements[i] }

        arr_1.intersection(arr_2).length
    end

    def rand_number min, max
        min + (rand * (max - min + 1)).floor
    end
end

class ComputerCodeMaker < CodeMaker
    def initialize
        @code = generate_code
    end

    def generate_code
        Array.new(4).collect { rand_number(1, 6) }
    end
end
