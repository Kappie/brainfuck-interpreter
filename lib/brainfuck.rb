require "io/console"

require_relative "brainfuck/interpreter"
require_relative "brainfuck/evaluator"

module Brainfuck
  PointerBoundaryError = Class.new(StandardError)
  InvalidValue         = Class.new(StandardError)
end