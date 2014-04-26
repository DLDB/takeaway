require 'order'

describe Order do

  let(:order) {Order.new}
  before :each do
    order.stub(:generate_list).and_return([:bogey_burger, :tarantula_fries])
  end
  
  it 'generates order with list of 2 customer wishes' do
    expect(order.list.count).to eq 2
  end

  it 'calculates expected price' do
    expect(order.expected_price).to eq 15
  end


end