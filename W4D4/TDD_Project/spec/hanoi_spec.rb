require "rspec"
require "hanoi"

describe "Tower of Hanoi" do
    subject(:tower) {Tower.new(4)}
    
    describe "Initialize" do 
        context "with valid arguments" do
            it "instantiates the game correctly" do 
                expect(tower.peg1).to be_a(Array)
                expect(tower.peg2).to be_a(Array)
                expect(tower.peg3).to be_a(Array)
                expect(tower.peg1.length).to eq (4)
                expect(tower.peg2.length).to eq (0)
                expect(tower.peg3.length).to eq (0)
            end
        end

        context "with invalid arguments" do 
            it "raises an error when provided with no arguments" do 
                expect{Tower.new}.to raise_error(ArgumentError)
            end
            it "raises an error when not provided with an integer" do 
                expect{Tower.new("a")}.to raise_error("Invalid number")
            end
        end
    end

    describe "#Pick Peg" do
        it "raise an error if an argument is not a number" do
            expect{tower.pick_peg("a")}.to raise_error(ArgumentError)
        end

        it "should return the correct peg" do
            expect(tower.pick_peg(1)).to eq (tower.peg1)
            expect(tower.pick_peg(2)).to eq (tower.peg2)
            expect(tower.pick_peg(3)).to eq (tower.peg3)
        end
    end

    describe "#Won?" do 
        it "should return true if player won" do 
            tower.peg1 = []
            tower.peg2 = []
            tower.peg3 = [4,3,2,1]
            expect(tower.won?).to be true
        end

        it "should return false if player did not win" do
            expect(tower.won?).to be false
        end
    end

    describe "#Move" do
    
        context "When the player moves 2 from peg1 to peg 3"
        it "should remove the correct element from peg1, add to peg3 but not change peg2" do
            tower.peg1 = [4,3,2]
            tower.peg2 = [1]
            tower.peg3 = []
            tower.move(1, 3)
            expect(tower.peg1).to eq ([4, 3])
            expect(tower.peg2).to eq ([1])
            expect(tower.peg3).to eq ([2])
        end

        # it "should call on #won?" do 
        #     expect(tower).to receive(:won?)
        # end

        # it "should call on #pick_peg" do
            # tower.move(1, 3)
            # expect(tower).to receive(:pick_peg)
        # end
    
        # context "If the player makes an invalid move"
        # it "should not change any of the pegs" do
        #     tower.peg1 = [4,3,2]
        #     tower.peg2 = [1]
        #     tower.peg3 = []
        #     tower.move(1, 2)
        #     expect(tower.peg1).to eq ([4, 3, 2])
        #     expect(tower.peg2).to eq ([1])
        #     expect(tower.peg3).to eq ([])
        # end

        # it "should call on #pick_peg" do
        #     expect(tower).to receive(:valid_move?)
        # end
    end

    describe "#Valid Move?" do 

        it "should accept an optional amount of numbers as an argument" do 
            expect{tower.valid_move?(1)}.to_not raise_error
            expect{tower.valid_move?(1,2)}.to_not raise_error
        end
        
        it "should return false if first chosen peg's element is greater than the other two peg's elements" do 
            tower.peg1 = [4,3]
            tower.peg2 = [1]
            tower.peg3 = [2]
            expect(tower.valid_move?(1)).to be false

        end

        it "should return false if second chosen peg's last element is smaller than the chosen element" do 
            tower.peg1 = [4]
            tower.peg2 = [1]
            tower.peg3 = [3,2]
            expect(tower.valid_move?(3,2)).to be false
        end

        it "should return true if it is a valid move" do 
            tower.peg1 = [4]
            tower.peg2 = [1]
            tower.peg3 = [3,2]
            expect(tower.valid_move?(3,1)).to be true
        end
    end
end
