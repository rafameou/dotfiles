local handle = io.popen("swaymsg -rt get_outputs | jq -r '.[0].scale'")
if handle ~= nil then
	local scale = tonumber(handle:read("*a"))
	handle:close()
	if scale ~= nil then
		scale = scale + 0.25;
		if scale > 1.5 then
			scale = 1;
		end
		os.execute("swaymsg output '*' scale " .. scale);
	end
end
