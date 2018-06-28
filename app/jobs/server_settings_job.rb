serversettings = Serversetting.all
serversettings.each do |i|


  if i.active == false

    if i.recactivation_date.present?

      if Time.now.day >= i.recactivation_date.day
        i.active = true
        i.save
      end

    end

  end


end
