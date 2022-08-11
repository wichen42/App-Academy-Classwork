require "problems"
require 'rspec'

describe "Remove dups" do
  let(:array1) { [1, 2, 1, 3, 3]}
  let(:array2) { [1, 2, 3, 4]}

  it "accept an array as an argument" do
    expect{my_uniq(array1)}.to_not raise_error
  end

  it "should have no dups" do
    expect(my_uniq(array1)).to eq (array1.uniq)
  end

  it "should not equal old array" do
    expect(my_uniq(array1)).to_not be (array1)
  end

  it "should not use .uniq" do
    expect(array1).to_not receive(:uniq)
    my_uniq(array1)
  end
end


describe "Two Sum" do
  let(:array1) {[-1, 0, 2, -2, 1]}

  it "accepts an array as an argument" do
    expect{array1.two_sum}.to_not raise_error
  end
  
  it "should return an array of pairs of indexes in the order they appear" do 
    expect(array1.two_sum).to eq ([[0, 4], [2, 3]])
  end

end

describe "My Transpose" do
  let (:matrix1) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}

  it "accepts a matrix as an argument" do
    expect{my_transpose(matrix1)}.to_not raise_error
  end

  it "should return a matrix where the rows and columns are switched" do
    expect(my_transpose(matrix1)).to eq ([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end

  it "should not equal old matrix" do
    expect(my_transpose(matrix1)).to_not be (matrix1)
  end

  it "should not use transpose" do
    expect(matrix1).to_not receive(:transpose)
    my_transpose(matrix1)
  end
end

describe "Stock Picker" do 

  let(:arr1) {[10, 100, 5, 250, 50, 3]}
  let(:arr2) {[]}

  it "accepts an array as an argument" do
    expect{stock_picker(arr1)}.to_not raise_error
  end

  it "should return a pair of numbers" do 
    expect(stock_picker(arr1).length).to eq (2)
  end

  it "should return the correct indexes of the pair" do 
    expect(stock_picker(arr1)).to eq ([2,3])
  end

  it "should return an empty array if no stock prices are passed" do
    expect(stock_picker(arr2)).to eq ([])
  end

end