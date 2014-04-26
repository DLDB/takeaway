require 'takeaway'

describe Takeaway do

  let(:bogeybar) { Takeaway.new }
  let(:goodorder) {double :order, list: [:bogey_burger, :tarantula_fries]}
  let(:badorder) {double :order, list: [:I_CAN_HAZ_CHEEZBURGER, :tarantula_fries]}
  let(:badmathsorder) {double :order, list: [:bogey_burger, :strong_french_gallwasp], expected_price: 12 }

  it 'can return a price for a rat kebab' do
    expect(bogeybar.menu[:rat_kebab]).to eq 5
  end

  it 'can check if every item on a valid order is valid' do
    expect(bogeybar.validate(goodorder)).to be_true
  end

  it 'raises an error if a requested item is not for sale' do

    expect{bogeybar.validate(badorder)}.to raise_error "Yuck. Fungus doesn't serve that."
  end

  xit 'can calculate and verify the total price of the order' do
  end

  xit 'can raise an error for an invalid item' do
  end

  xit 'can raise an error for an incorrect price' do
  end




end