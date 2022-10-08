class InputReader
  class << self
    def read_input
      gets.chomp
    end

    def read_integer
      read_input.to_i
    end
  end
end
