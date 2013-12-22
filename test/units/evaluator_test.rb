require_relative "../helper"

describe "Evaluator" do
  it "has an initial cell value of 0" do
    evaluator = Brainfuck::Evaluator.new
    evaluator.cell_value.must_equal(0)
  end

  it "is able to set the cell value at the current position" do
    evaluator = Brainfuck::Evaluator.new
    evaluator.cell_value = 20
    evaluator.cell_value.must_equal(20)
  end

  it "restricts cell values to integers between 0 and 255" do
    evaluator = Brainfuck::Evaluator.new
    insist { evaluator.cell_value = 1.5 }.must_raise(Brainfuck::InvalidValue)
    insist { evaluator.cell_value = -1 }.must_raise(Brainfuck::InvalidValue)
    insist { evaluator.cell_value = 256 }.must_raise(Brainfuck::InvalidValue)
  end

  it "is able to increment the cell value at the current position" do
    evaluator = Brainfuck::Evaluator.new
    evaluator.increment_cell_value
    evaluator.cell_value.must_equal(1)
    evaluator.increment_cell_value
    evaluator.cell_value.must_equal(2)
  end

  it "is able to decrement the cell value at the current position" do
    evaluator = Brainfuck::Evaluator.new
    5.times { evaluator.increment_cell_value }
    2.times { evaluator.decrement_cell_value }
    evaluator.cell_value.must_equal(3)
    evaluator.decrement_cell_value
    evaluator.cell_value.must_equal(2)
  end

  it "has an initial pointer position of 0" do
    evaluator = Brainfuck::Evaluator.new
    evaluator.pointer_position.must_equal(0)
  end

  it "is able to increment pointer position" do
    evaluator = Brainfuck::Evaluator.new
    evaluator.increment_pointer
    evaluator.pointer_position.must_equal(1)
    evaluator.increment_pointer
    evaluator.pointer_position.must_equal(2)
  end

  it "is able to decrement the pointer position" do
    evaluator = Brainfuck::Evaluator.new
    3.times { evaluator.increment_pointer }
    evaluator.decrement_pointer
    evaluator.pointer_position.must_equal(2)
    evaluator.decrement_pointer
    evaluator.pointer_position.must_equal(1)
  end

  it "raises an error if decrementing when pointer position is 0" do
    evaluator = Brainfuck::Evaluator.new
    insist { evaluator.decrement_pointer }.must_raise(Brainfuck::PointerBoundaryError)
  end

  it "treats cell values independently" do
    evaluator = Brainfuck::Evaluator.new
    evaluator.increment_cell_value
    evaluator.cell_value.must_equal(1)
    evaluator.increment_pointer
    evaluator.cell_value.must_equal(0)
    4.times { evaluator.increment_cell_value }
    evaluator.cell_value.must_equal(4)
    evaluator.decrement_pointer
    evaluator.cell_value.must_equal(1)
  end

  it "overflows the cell value gracefully" do
    evaluator = Brainfuck::Evaluator.new
    evaluator.decrement_cell_value
    evaluator.cell_value.must_equal(255)
    evaluator.increment_cell_value
    evaluator.cell_value.must_equal(0)
  end
end