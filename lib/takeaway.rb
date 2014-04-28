require 'twilio-ruby'

class Takeaway

  MENU = { :rat_kebab => 5,
    :tarantula_fries => 4,
    :bogey_burger => 11,
    :crispy_bat_wings => 3,
    :strong_french_gallwasp => 2 }

  def menu
    MENU
  end

  def submit(order)
    validate(order)
    delivery_time = calculate_delivery_time
    sms = textmessage(delivery_time)
    send!(sms)
  end

  def send!(sms)
    account_sid = "AC6dc2accfba14a5404cdc7a64d7bbbb87"
    auth_token = "3eb8d527bcfb9cb64abd7dac507e06a9"
    client = Twilio::REST::Client.new account_sid, auth_token
    from = "+441202 562999" 
    client.account.messages.create(
    :from => from,
    :to => "+447539008999",
    :body => sms)
  end

  def validate(order)
    rejected_order = order.list.reject {|item| menu.keys.include?(item)}
    raise "Yuck. Fungus doesn't serve that." if !rejected_order.empty?
    raise "Wrong price!" if calculate_cost(order) != order.expected_price
    true
  end

  def calculate_cost(order)
    costs = order.list.map {|item| menu[item] }
    costs.inject(&:+)
  end

  def calculate_delivery_time
    time = [Time.now.hour + 1, Time.now.min]
    "#{time[0]}.#{time[1]}"
  end

  

  def textmessage(time)
    "Fungus T. Bogeyman tanks you for order. Will be delivered before #{time}"
  end

end