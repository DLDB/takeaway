require 'order'

describe Order do

  let(:order) {Order.new [:bogey_burger, :tarantula_fries]}
  let(:random_order){Order.new}
  
  it 'by default generates order with list of 2 customer wishes' do
    expect(random_order.list.count).to eq 2
  end

  it 'calculates expected price' do
    expect(order.expected_price).to eq 15
  end
end