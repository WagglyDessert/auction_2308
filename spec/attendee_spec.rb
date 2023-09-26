require './lib/item'
require './lib/attendee'

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
  end

  it 'can initialize' do
    expect(@attendee1).to be_an_instance_of(Attendee)
    expect(@attendee2).to be_an_instance_of(Attendee)
    expect(@attendee3).to be_an_instance_of(Attendee)
  end

  it 'has attributes' do
    expect(@attendee1.name).to eq("Megan")
    expect(@attendee2.name).to eq("Bob")
    expect(@attendee3.name).to eq("Mike")
    expect(@attendee1.budget).to eq(50)
    expect(@attendee2.budget).to eq(75)
    expect(@attendee3.budget).to eq(100)
  end

end