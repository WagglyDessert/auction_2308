require './lib/item'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
  end

  it 'can initialize' do
    expect(@item1).to be_an_instance_of(Item)
    expect(@item2).to be_an_instance_of(Item)
    expect(@item3).to be_an_instance_of(Item)
    expect(@item4).to be_an_instance_of(Item)
    expect(@item5).to be_an_instance_of(Item)
  end

  it 'has a name' do
    expect(@item1.name).to eq('Chalkware Piggy Bank')
    expect(@item2.name).to eq('Bamboo Picture Frame')
    expect(@item3.name).to eq('Homemade Chocolate Chip Cookies')
    expect(@item4.name).to eq('2 Days Dogsitting')
    expect(@item5.name).to eq('Forever Stamps')
  end

end