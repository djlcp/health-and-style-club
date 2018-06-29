Serversetting.all.each do |i|

  if i.active != true
    if Time.now.day >= i.reactivation_date.day
      i.active = true
      i.save
    end
  end
end
