require 'order'

describe Order do
  
  it 'generates order with list of 2 customer wishes' do
    expect(order.list.count).to eq 2
  end

  xit 'calculates expected price' do
  end


end