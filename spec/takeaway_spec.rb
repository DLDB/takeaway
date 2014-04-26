require 'takeaway'

describe Takeaway do

  let(:bogeybar) { Takeaway.new }
  let(:good_order) {double :order, list: [:bogey_burger, :tarantula_fries], expected_price: 15}
  let(:bad_item_order) {double :order, list: [:CHEEZBURGER, :tarantula_fries]}
  let(:bad_maths_order) {double :order, list: [:bogey_burger, :strong_french_gallwasp], expected_price: 12 }

  it 'can return a price for a rat kebab' do
    expect(bogeybar.menu[:rat_kebab]).to eq 5
  end

  it 'can check if every item on a valid order is valid' do
    expect(good_order).to receive(:expected_price)
    expect(bogeybar.validate(good_order)).to be_true
  end

  it 'raises an error if a requested item is not for sale' do
    expect{bogeybar.validate(bad_item_order)}.to raise_error "Yuck. Fungus doesn't serve that."
  end

  it 'can calculate and verify the total price of the order' do
    expect(bogeybar.calculate_cost(good_order)).to eq 15
  end

  it 'can raise an error for an incorrect price' do
    expect(bad_maths_order).to receive(:expected_price)
    expect{bogeybar.validate(bad_maths_order)}.to raise_error "Wrong price!"
  end




end