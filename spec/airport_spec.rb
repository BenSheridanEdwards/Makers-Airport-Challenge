require 'airport'
require 'plane'
require 'weather_spec'

describe Airport do 

  let(:airport) { Airport.new }
  let(:airport_with_plane) { Airport.new(hanger: [plane]) }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }
 
  context "when a plane is landing" do

    it "instructs the plane to land" do
      allow(airport).to receive(:stormy?).and_return(false)
      expect(airport).to receive(:land)
      airport.land(plane)
    end

    it "will have a plane in it's hanger after landing" do
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      expect(airport.hanger).to include plane
    end
  end

  describe '#initialize' do 
  
    it "uses a given capacity and so returns a hanger count over the default capacity of 5" do
      airport10 = Airport.new(Weather.new, 10)
      allow(airport10).to receive(:stormy?).and_return(false)
      6.times { airport10.land(Plane.new) }
      expect(airport10.hanger.count).to eq(6)
    end

    it 'uses a default capacity when no input is given' do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

  end

  describe '#land' do
  
    it "should land a plane when weather conditions are good" do
      allow(airport).to receive(:stormy?).and_return(false)
      expect(airport.land(plane)).to eq([plane])
    end 

    it "should not land a plane when weather conditions are stormy" do
      allow(airport).to receive(:stormy?).and_return(true)
      message = 'Stormy weather, abort landing!'
      expect { airport.land(plane) }.to raise_error message
    end

    it "should not land a plane if the hanger is full" do 
      allow(airport).to receive(:stormy?).and_return(false)
      airport.capacity.times { airport.land(Plane.new) }
      message = 'Hanger full, abort landing!'
      expect { airport.land(Plane.new) }.to raise_error message
    end
  end
  
  describe '#take_off' do

    it "should not release a plane when weather conditions are stormy" do
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      allow(airport).to receive(:stormy?).and_return(true)
      message = "Stormy weather, cannot take off" 
      expect { airport.take_off(plane) }.to raise_error message
    end 

    it "should not raise an error if a plane attempts to take off after the storm has cleared" do
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      allow(airport).to receive(:stormy?).and_return(false)
      expect { airport.take_off(plane) }.not_to raise_error
    end

    it "should release a plane in good weather conditions" do
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      expect(airport.take_off(plane)).to eq(plane)
    end
 
  end 

  it "should return true or false when stormy? is called" do
	  expect(airport.weather.stormy?).to be(true).or be(false)
	end 
end
