class Order

  POSSIBLE_WISHES = { :rat_kebab => 5,
    :tarantula_fries => 4,
    :bogey_burger => 11,
    :crispy_bat_wings => 3,
    :strong_french_gallwasp => 1,
    :CHEEZBURGER => 11 }

  attr_reader :list, :expected_price

  def initialize(list = generate_list)
    @list = list
    @expected_price = calculate_cost
  end 

  def order_randomizer
    POSSIBLE_WISHES.keys.sample
  end 

  def generate_list
    [order_randomizer, order_randomizer]
  end

  def calculate_cost
    POSSIBLE_WISHES[@list[0]] + POSSIBLE_WISHES[@list[1]]
  end

end