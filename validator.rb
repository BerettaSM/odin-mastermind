class Validator
    def validate guess
        guess.length == 4 && guess.split('').all? { |c| is_number c }
    end

    private

    def is_number num
        num.to_i.to_s == num
    end
end
