module HomeHelper
  def chart_data(data)
    @min = data.pluck(:mid).min
    @max = data.pluck(:mid).max
    @avg = (@max - @min).abs

    @helper_chart_values = {
      :min => @min - @avg,
      :max => @max + @avg
    }
  end
end