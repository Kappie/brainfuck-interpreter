module Brainfuck
  class Evaluator
    CELL_SIZE = 256

    attr_reader :pointer_position

    def self.run(interpreter)
      evaluator = new
      loop do
        if operation = interpreter.next_operation(evaluator.cell_value)
          evaluator.send(operation)
        end
      end
    end

    def initialize
      @tape = []
      @pointer_position = 0
    end

    def cell_value
      @tape[pointer_position] ||= 0
    end

    def cell_value=(value)
      raise InvalidValue unless valid_cell_value?(value)
      @tape[pointer_position] = value
    end

    def increment_cell_value
      self.cell_value = (cell_value + 1).modulo(CELL_SIZE)
    end

    def decrement_cell_value
      self.cell_value = (cell_value - 1).modulo(CELL_SIZE)
    end

    def increment_pointer
      @pointer_position += 1
    end

    def decrement_pointer
      raise PointerBoundaryError if pointer_position == 0
      @pointer_position -= 1
    end

    def input_cell_value
      value = $stdin.getch.ord
      return if value.zero?
      self.cell_value = value
    end

    def output_cell_value
      putc(cell_value)
    end

    private

    def valid_cell_value?(value)
      value.between?(0, CELL_SIZE - 1) && value.is_a?(Integer)
    end
  end
end