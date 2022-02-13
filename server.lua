local webhook = "https://discord.com/api/webhooks/935377118383177749/rnbJ8dpx3ubS7f3P9mDPwXhqglKNsPNLX_PwbAMKP5-VwZcUcFFrZ9YcprLg6ktr4CJE" --modify, also set in your gateway config!

RegisterCommand("911", function(source, name, msg)
	TriggerClientEvent('chatMessage', -1, "^8(911) | ^0" .. GetPlayerName(source) .."^0", { 30, 144, 255 }, string.sub(msg, 5)) -- Edit col 44-56 to edit the prefix of the chat message EX: (911) | 
	CancelEvent()

	-- Webhook Message --
	local len = string.len(msg)
	local msg2 = string.sub(msg, 5, len)
	local wh_content = "**[911]: (CALLER ID: "..GetPlayerName(source)..")** "..msg2 -- Edit the contents of the webhook message
	PerformHttpRequest(webhook, process, "POST", "content="..wh_content.."&tts=false")
	function process(statusCode, text, headers)
		--done
	end

end)