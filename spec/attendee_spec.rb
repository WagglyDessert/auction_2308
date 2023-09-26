require './lib/item'
require './lib/attendee'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
  end

  it 'can initialize' do
    expect(@attendee).to be_an_instance_of(Attendee)
  end

  it 'has attributes' do
    expect(@attendee.name).to eq("Megan")
    expect(@attendee.budget).to eq(50)
  end

end