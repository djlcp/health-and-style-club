subscriptions = Subscription.all
subscriptions.each do |s|


  if s.paid_for == true

    if s.expiry_date.present?

      if Time.now.day >= s.expiry_date.day
        s.update(paid_for: false)
        s.user.update(role: nil)
        puts "Subscription #{s.id} cancelled. #{Time.now}"
      end

    end

  end

end
