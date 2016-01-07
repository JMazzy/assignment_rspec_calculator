require 'calculator'

describe Calculator do

  let( :calculator ) { Calculator.new }
  let( :string_calculator ) { Calculator.new(true) }

  describe "#initialize" do
    it "sets stringify to false by default" do
      expect(calculator.stringify).to eq(false)
    end

    it "properly sets stringify to true if parameter is set" do
      expect(string_calculator.stringify).to eq(true)
    end

    it "tests that initial memory is nil" do
      expect(calculator.memory).to eq(nil)
    end
  end

  describe "#add" do
    it "sum of positive integers" do
      expect(calculator.add(2, 3)).to eq(5)
    end

    it "sum of negative integers" do
      expect(calculator.add(-2, -3)).to eq(-5)
    end

    it "sum of positive and negative integers" do
      expect(calculator.add(2, -3)).to eq(-1)
    end

    it "sum of floats" do
      expect(calculator.add(2.1, 3.1)).to eq(5.2)
    end

    it "sum of float and int" do
      expect(calculator.add(2, 3.0)).to eq(5.0)
    end

    it "sum of negative float and positive int" do
      expect(calculator.add(-2.0, 3)).to eq(1.0)
    end

  end

  describe "#subtract" do
    it "difference of positive integers" do
      expect(calculator.subtract(2, 3)).to eq(-1)
    end

    it "difference of negative integers" do
      expect(calculator.subtract(-2, -3)).to eq(1)
    end

    it "difference of positive and negative integers" do
      expect(calculator.subtract(2, -3)).to eq(5)
    end

    it "difference of floats" do
      expect(calculator.subtract(2.0, 3.0)).to eq(-1.0)
    end

    it "difference of float and int" do
      expect(calculator.subtract(2, 3.0)).to eq(-1.0)
    end

    it "difference of negative float and positive int" do
      expect(calculator.subtract(-2.0, 3)).to eq(-5.0)
    end

  end

  describe "#multiply" do
    it "multiply positive integers" do
      expect(calculator.multiply(2, 3)).to eq(6)
    end

    it "multiply negative integers" do
      expect(calculator.multiply(-2, -3)).to eq(6)
    end

    it "multiply a positive and negative integer" do
      expect(calculator.multiply(2, -3)).to eq(-6)
    end

    it "multiply floats" do
      expect(calculator.multiply(2.0, 3.0)).to eq(6.0)
    end

    it "multiply float and int" do
      expect(calculator.multiply(2, 3.0)).to eq(6.0)
    end

    it "multiply negative float and positive int" do
      expect(calculator.multiply(2, -3.0)).to eq(-6.0)
    end

  end

  describe "#divide" do
    it "divides two positive integers" do
      expect(calculator.divide(2, 4)).to eq(0.5)
    end

    it "divides two negative integers" do
      expect(calculator.divide(-2, -4)).to eq(0.5)
    end

    it "divides a positive and a negative integer" do
      expect(calculator.divide(2, -4)).to eq(-0.5)
    end

    it "divides floats" do
      expect(calculator.divide(6.0,7.0)).to be_within(0.01).of(0.85)
    end

    it "divides float and int" do
      expect(calculator.divide(4.0, 2)).to eq(2.0)
    end

    it "divides negative float by positive int" do
      expect(calculator.divide(-9.0, 3)).to eq(-3.0)
    end

    it "divides by zero raises error" do
      expect{calculator.divide(3, 0)}.to raise_error(ArgumentError)
    end

  end

  describe "#pow" do
    it "raises one int to the power of another int" do
      expect(calculator.pow(2, 3)).to eq(8)
    end

    it "raises one negative int to the power of a negative, odd int" do
      expect(calculator.pow(-2, -3)).to eq(-0.125)
    end

    it "raises one negative int to the power of a negative, even int" do
      expect(calculator.pow(-2, -2)).to eq(0.25)
    end

    it "raises a positive int to a negative int" do
      expect(calculator.pow(2, -3)).to eq(0.125)
    end

    it "raises a positive float to the power of a positive float" do
      expect(calculator.pow(4.0, 2.0)).to eq(16.0)
    end

    it "raises a float to the power of an int" do
      expect(calculator.pow(5.0, 3)).to eq(125.0)
    end

    it "raises a negative float to the power of a positive odd int" do
      expect(calculator.pow(-3.0, 3)).to eq(-27.0)
    end

    it "raises a negative float to the power of a positive even int" do
      expect(calculator.pow(-3.0, 2)).to eq(9.0)
    end

    it "raises a positive int to the power of 0" do
      expect(calculator.pow(9, 0)).to eq(1)
    end

    it "raises 0 to the power of a float" do
      expect(calculator.pow(0, 9)).to eq(0)
    end

    it "raises 0 to the power of 0" do
      expect(calculator.pow(0, 0)).to eq(1)
    end

  end

  describe "#sqrt" do
    it "takes square root of positive int" do
      expect(calculator.sqrt(16)).to eq(4)
    end

    it "square root of negative int raises error" do
      expect{calculator.sqrt(-64)}.to raise_error(ArgumentError)
    end

    it "takes square root of float" do
      expect(calculator.sqrt(36.0)).to eq(6.0)
    end

    it "square root of negative float raises error" do
      expect{calculator.sqrt(-49.0)}.to raise_error(ArgumentError)
    end

    it "rounds square root of int to two decimal places" do
      expect(calculator.sqrt(74)).to eq(8.60)
    end

  end

  describe "#memory=" do
    it "stores a value in memory" do
      calculator.memory = 3
      expect(calculator.instance_variable_get(:@memory)).to eq(3)
    end
  end

  describe "#memory" do
    it "retrieves a value from memory" do
      calculator.instance_variable_set(:@memory,3)
      expect(calculator.memory).to eq(3)
    end

    it "resets memory after retrieval" do
      calculator.memory = 3
      calculator.memory
      expect(calculator.memory).to eq(nil)
    end
  end

  describe "#stringify" do
    it "properly stringifies the output" do
      expect(string_calculator.add(2, 3)).to eq("5")
    end
  end
end
