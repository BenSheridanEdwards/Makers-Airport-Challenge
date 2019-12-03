require 'plane'

describe Plane do 

  let(:plane) { Plane.new }

  describe '#in_the_air' do
    it "should be in the air after take off" do
      plane.in_the_air
      expect(plane.airborn?).to eq true
    end
  end

  describe '#landed' do
    it "should be landed after landing" do
      plane.landed
      expect(plane.airborn?).to eq false
    end
  end
end