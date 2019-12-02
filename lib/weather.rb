class Weather

  FORECASTS = [:stormy, :sunny, :sunny, :sunny]

  def stormy?
    forecast == :stormy
  end

  def forecast
    FORECASTS.sample
  end
end



