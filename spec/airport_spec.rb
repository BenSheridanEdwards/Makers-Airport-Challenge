require 'airport'

describe Airport do 

  let(:airport) { Airport.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  context "taking off in clear weather conditions" do 
    before(:each) do 
      allow(airport).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:landed).and_return(true)
      allow(plane).to receive(:in_the_air).and_return(true)
      airport.land(plane)
    end

    it "should allow a plane in the hanger to take off" do
      expect(airport.take_off(plane)).to eq(plane)
    end

    it "should not raise an error when a plane attempts to take off" do 
      expect { airport.take_off(plane) }.not_to raise_error
    end
  end

  context "landing in clear weather conditions" do 
    before(:each) do
      allow(airport).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:in_the_air).and_return(true)
      allow(plane).to receive(:landed).and_return(true)
    end

    it "should allow a plane to land and park in the hanger" do 
      airport.land(plane)
      expect(airport.hanger).to include plane
    end

    it "should raise an error if the user tries to land the same plane twice" do
      airport.land(plane)
      message = 'That plane is already here'
      expect { airport.land(plane) }.to raise_error message
    end
  end

  context "landing in a full hanger in clear weather conditions" do 
    before(:each) do
      allow(airport).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:in_the_air).and_return(true)
      allow(plane).to receive(:landed).and_return(true)
    end

    it "should raise an error if a plane tries to land when the hanger is over the default capacity" do
      Airport::DEFAULT_CAPACITY.times { airport.land(double :plane, landed: true) }
      message = 'Hanger full, abort landing!'
      expect { airport.land(plane) }.to raise_error message
    end

    it "should raise an error if a plane tries to land when the hanger is over a given capacity" do
      airport5 = Airport.new(:sunny, 5)
      airport5.capacity.times { airport.land(double :plane, landed: true) }
      message = 'Hanger full, abort landing!'
      expect { airport.land(plane) }.to raise_error message
    end 
  end

  context "when in stormy weather conditions" do
    before(:each) do 
    allow(airport).to receive(:stormy?).and_return(false)
    allow(plane).to receive(:landed).and_return(true)
    allow(plane).to receive(:in_the_air).and_return(true)
    airport.land(plane)
    allow(airport).to receive(:stormy?).and_return(true)
    end

    it "should raise an error if a plane tries to take off" do
      message = "Stormy weather, cannot take off"
      expect { airport.take_off(plane) }.to raise_error message
    end

    it "should raise an error if a plane tries to land" do
      message = 'Stormy weather, abort landing!'
      expect { airport.land(double :plane, landed: false) }.to raise_error message
    end
  end
end
