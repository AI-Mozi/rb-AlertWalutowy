module LoggedUserHelper
  def logged_user_chart_data(user_currency)
    @posts = []
    user_currency.each do |past|
      @post = {}
      @post[:id] = past[0]
      @post[:min] = past[1].pluck(:mid).min
      @post[:max] = past[1].pluck(:mid).max
      @post[:chart] = past[1].pluck(:day, :mid)
      @post[:avg] = (@post[:max] - @post[:min]).abs
      @post[:name] = Currency.find(past[0]).name.upcase
      @posts.append(@post)
    end
    @posts
  end

  def logged_user_currencies_info(currency)
    currency.reverse!
    @first = currency.first[1]
    @second = currency.second[1]
    @last = currency.last[1]
    @last_difference = @first - @second
    @week_difference = @first - @last

    {
      :current => @first,
      :last => @last_difference,
      :week => @week_difference
    }
  end
end
