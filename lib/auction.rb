require "date"
class Auction
  attr_reader :items, :date
  def initialize
    @items = []
    @date = Date.today.strftime("%d/%m/%y")
  end
  def add_item(item)
    @items << item
  end

  def item_names
    item_name_array = @items.map do |item|
      item.name
    end
    item_name_array
  end

  def unpopular_items
    @items.select { |item| item.bids.empty? }
  end

  def potential_revenue
    bid_array = @items.map do |item|
      item.bids.values
    end
    high_bid_only_array = bid_array.map do |a|
      a.max
    end
    high_bid_only_array.compact.sum
  end

  def bidders
    bidder_names = []
    @items.each do |item|
      item.bids.keys.each do |k|
        bidder_names << k.name
      end
    end
    bidder_names.uniq
  end

  def bidder_info
    #hash = { attendee => {:budget => value, :items => arrayofitemsateendeebidon}}
    #ADD to subhash items, others stay stagnant
    bidder_info = Hash.new{|h,k| h[k] = {budget: 0, items: []}}
    @items.each do |item|
      #items is what they have bid on
      items = item
      item.bids.keys.each do |k|
        #attendee key thru item bids
        k = k
      #budget from attendee attribute
        budget = k.budget.to_i
        bidder_info[k][:budget] = budget
        bidder_info[k][:items] << items
        #require 'pry'; binding.pry
      end
    end
    bidder_info
  end

  def close_auction
    #close bidding
    @items.each do |item|
      item.close_bidding
    end
    #sell items to attendees
      #take winner from close_bid method, deduct item bid from their budget
    #return hash with items as keys, purchaser as values
    #only purchase items they can afford
    #wil purchase most expenssive first, etc.
    #if not enough money, next highest bidder will buy item
  end
    
end