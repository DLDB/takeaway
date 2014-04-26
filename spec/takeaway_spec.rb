require 'takeaway'

describe Takeaway do

  let(:bogeybar) { Takeaway.new }

  it 'can return a price for a rat kebab' do
    expect(bogeybar.menu[:rat_kebab]).to eq 5
  end

  xit 'can check if every item on an order is valid' do
  end

  xit 'can calculate and verify the total price of the order' do
  end

  xit 'can raise an error for an invalid item' do
  end

  xit 'can raise an error for an incorrect price' do
  end




end