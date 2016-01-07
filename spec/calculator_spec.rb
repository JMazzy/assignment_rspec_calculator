require 'calculator'

describe Calculator do

  let( :calculator ) { Calculator.new }
  
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
  end
end