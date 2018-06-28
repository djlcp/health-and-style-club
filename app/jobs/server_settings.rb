serversettings = Serversetting.all
setting1 = serversettings.find_by(task_name: params["sign_up"])
if setting1
	@hey = "hey"
else
	@hey = "hey"
end
@hey