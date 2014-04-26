class Takeaway

  MENU = { :rat_kebab => 5,
    :tarantula_fries => 4,
    :bogey_burger => 11,
    :crispy_bat_wings => 3,
    :strong_french_gallwasp => 2 }

  def menu
    MENU
  end

  def validate(order)
    rejected_order = order.list.reject {|item| MENU.keys.include?(item)}
    raise "Yuck. Fungus doesn't serve that." if !rejected_order.empty?
    true
  end


end