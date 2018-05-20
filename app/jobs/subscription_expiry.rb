subscriptions = Subscription.all
time = Time.now
subscriptions.each do |s|
  expiry = s.expiry_date
  if time > expiry
    s.paid_for = false
    s.save
  end
end