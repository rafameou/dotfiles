local handle = io.popen("swaymsg -rt get_outputs | jq -r '.[0].scale'")
if handle ~= nil then
	local scale = tonumber(handle:read("*a"))
	handle:close()
	if scale ~= nil then
		os.execute("swaymsg output '*' scale 1");
		os.execute("flameshot gui");
		os.execute("swaymsg output '*' scale " .. scale);
	end
end
