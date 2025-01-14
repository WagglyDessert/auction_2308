require './lib/item'
require './lib/attendee'
require './lib/auction'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    @auction = Auction.new
  end

  it 'can initialize' do
    expect(@auction).to be_an_instance_of(Auction)
  end

  it 'has attributes' do
    expect(@auction.items).to eq([])
  end

  it 'can add items' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    expect(@auction.items).to eq([@item1, @item2])
  end

  it 'can read item names' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
  end

  it 'can find unpopular items(aka items without bids)' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    expect(@item1.bids).to eq({})
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    expect(@item1.bids).to eq({@attendee2 => 20, @attendee1 => 22})
    expect(@item1.current_high_bid).to eq(22)
    @item4.add_bid(@attendee3, 50)
    expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])
    @item3.add_bid(@attendee2, 15)
    expect(@auction.unpopular_items).to eq([@item2, @item5])
  end

  it 'has potential revenue' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)
    #require 'pry'; binding.pry
    expect(@auction.potential_revenue).to eq(87)
  end

  it 'can create an array of people who have placed bids' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee2, 20)
    expect(@auction.bidders).to eq(["Bob"])
    @item1.add_bid(@attendee1, 22)
    expect(@auction.bidders).to eq(["Bob", "Megan"])
    @item4.add_bid(@attendee3, 50)
    expect(@auction.bidders).to eq(["Bob", "Megan", "Mike"])
    @item3.add_bid(@attendee2, 15)
    expect(@auction.bidders).to eq(["Bob", "Megan", "Mike"])
  end

  it 'can create a hash of bidder info' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee2, 20)
    expect(@auction.bidder_info).to eq({@attendee2 => {:budget => 75, :items => [@item1]}})
    @item1.add_bid(@attendee1, 22)
    expect(@auction.bidder_info).to eq({@attendee2 => {:budget => 75, :items => [@item1]}, @attendee1 => {:budget => 50, :items => [@item1]}})
    @item3.add_bid(@attendee2, 15)
    expect(@auction.bidder_info).to eq({@attendee2 => {:budget => 75, :items => [@item1, @item3]}, @attendee1 => {:budget => 50, :items => [@item1]}})
  end

  it "returns the date I was born" do
    date = Date.today.strftime("%d/%m/%y")
    # THIS STUB DOESN'T WORK BUT WHY??!?!
    # IT DIDN'T WORK LAST NIGHT WHEN GOING OVER WK5 IC EITHER?!
    #allow(date).to receive(:today).and_return(Date.new(1992, 1, 18))
    #expect(@auction.date).to eq("18/1/1992")
    expect(@auction.date).to eq(date)
  end

  it 'can close the auction' do
    
  end
end