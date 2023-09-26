class Item
  attr_reader :name, :bids, :bidding_window
  def initialize(name)
    @name = name
    @bids = {}
    @bidding_window = "open"
  end

  def add_bid(attendee, bid)
    if @bidding_window == "open"
      @bids[attendee] = bid
    else
      p "The bidding window has closed for this item."
    end
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    winning_bid = current_high_bid
    index = @bids.values.find_index(winning_bid)
    winner = @bids.keys[index].name
    @bidding_window = "closed"
    pp "The bidding has closed. The winner of this item is #{winner}!"
  end
    
end