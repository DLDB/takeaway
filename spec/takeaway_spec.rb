require 'takeaway'

describe Takeaway do

  let(:bogeybar) { Takeaway.new }

  it 'can return a price for "rat kebab"' do
    expect(bogeybar.menu['rat kebab']).to eq 5
  end




end