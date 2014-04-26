require 'takeaway'

describe Takeaway do

  let(:bogeybar) { Takeaway.new }
  let(:good_order) {double :order, list: [:bogey_burger, :tarantula_fries], expected_price: 15}
  let(:bad_item_order) {double :order, list: [:CHEEZBURGER, :tarantula_fries]}
  let(:bad_maths_order) {double :order, list: [:bogey_burger, :strong_french_gallwasp], expected_price: 12 }

  context 'checking the menu' do

    it 'can return a price for a rat kebab' do
      expect(bogeybar.menu[:rat_kebab]).to eq 5
    end
  end

  context 'when validating an order,' do

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

  context 'when submitting a valid order,' do
    before :each do 
      bogeybar.stub(:send!).and_return(true)
      bogeybar.stub(:calculate_delivery_time).and_return("18.30")
      expect(good_order).to receive(:expected_price)
    end

    it 'the order will be processed' do
      expect(bogeybar.submit(good_order)).to be_true
    end

    it 'calculates delivery time' do
      expect(bogeybar).to receive(:calculate_delivery_time)
      bogeybar.submit(good_order)
    end

    it 'will send a text' do
      expect(bogeybar).to receive(:send!)
      bogeybar.submit(good_order)
    end
  end

    context 'when submitting a non-valid order' do

      it 'will not calculate a delivery time' do
        expect{bogeybar.submit(bad_item_order)}.to raise_error
        expect(bogeybar).not_to receive(:calculate_delivery_time)
      end

      it 'will not send a text' do
      expect{bogeybar.submit(bad_item_order)}.to raise_error
      expect(bogeybar).not_to receive(:send!)
      end
    end
end