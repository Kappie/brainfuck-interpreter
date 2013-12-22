module Brainfuck
  class Interpreter
    FORWARD_JUMP = "["
    BACKWARD_JUMP = "]"
    OPERATIONS = 
      {
        "+" => :increment_cell_value,
        "-" => :decrement_cell_value,
        "<" => :decrement_pointer,
        ">" => :increment_pointer,
        "." => :output_cell_value,
        "," => :input_cell_value
      }

    def initialize(source_code)
      @source_code = source_code
      @index = -1
    end

    def next_operation(cell_value)
      increment_index
      handle_loops(cell_value)
      OPERATIONS[current_char]
    end

    private

    def increment_index
      raise StopIteration if arrived_at_last_index?
      @index += 1
    end

    def decrement_index
      @index -= 1
    end

    def current_char
      @source_code[@index]
    end

    def handle_loops(cell_value)
      while current_char == FORWARD_JUMP do
        cell_value.zero? ? jump_over_loop : increment_index
      end
      while current_char == BACKWARD_JUMP do
        cell_value.zero? ? increment_index : jump_to_begin_of_loop
      end
    end

    def jump_over_loop
      nesting_depth = 1
      until nesting_depth.zero? do
        increment_index
        nesting_depth += 1 if current_char == FORWARD_JUMP
        nesting_depth -= 1 if current_char == BACKWARD_JUMP
      end
      increment_index
    end

    def jump_to_begin_of_loop
      nesting_depth = 1
      until nesting_depth.zero? do
        decrement_index
        nesting_depth += 1 if current_char == BACKWARD_JUMP
        nesting_depth -= 1 if current_char == FORWARD_JUMP
      end
      increment_index
    end
    
    def arrived_at_last_index?
      @index == @source_code.length - 1
    end
  end
end