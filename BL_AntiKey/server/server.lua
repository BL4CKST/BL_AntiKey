ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

idioma                   = {}

if Config.language == "en" then idioma = Config.LangEN 
elseif Config.language == "es" then idioma = Config.LangES 
else print("BL_ANTIKEY : IDIOMA INVALIDO") end

function AntiKeyL(xPlayer, text, xTarget, source, to, amount)
    local discord_webhook = Configsv.WebbhookLog
    if discord_webhook == '' then
      return
    end
    local headers = {
      ['Content-Type'] = 'application/json'
    }
    local data = {
      ["username"] = "BL_ANTIKEY",
      ["avatar_url"] = "https://i.imgur.com/go4moGp.gif",
      ["embeds"] = {{
        ["author"] = {
        ["name"] = idioma.MessageNoAu
        },		
        ["color"] = 1942002,
        ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
      }}
    }
    data['embeds'][1]['description'] = text
    PerformHttpRequest(discord_webhook, function(err, text, headers) end, 'POST', json.encode(data), headers)
	
end
function Sanitize(str)
    local replacements = {
        ['&' ] = '&amp;',
        ['<' ] = '&lt;',
        ['>' ] = '&gt;',
        ['\n'] = '<br/>'
    }

    return str
        :gsub('[&<>\n]', replacements)
        :gsub(' +', function(s)
            return ' '..('&nbsp;'):rep(#s-1)
        end)
end

RegisterServerEvent("BL_BL4CK:NoAutorizacion")
AddEventHandler("BL_BL4CK:NoAutorizacion", function(key)
	local name = GetPlayerName(source)	
	local steamID  = "Unknown"
	local license  = "Unknown"
	local discord  = "Unknown"
	local playerip = "Unknown"
	for k,v in ipairs(GetPlayerIdentifiers(source))do
		if string.sub(v, 1, string.len("steam:")) == "steam:" then 
			steam = string.sub(v, 7) steamID = "" .. steam .. ""
			elseif string.sub(v, 1, string.len("license:")) == "license:" then
			lice = string.sub(v, 9) license = "" .. lice .. ""
			elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
			ip = string.sub(v, 4) playerip = "" .. ip .. ""
			elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
			id = string.sub(v, 9) discord = "<@" .. id .. ">" 
		end
	end	
	if Config.WebhookEnable then
	AntiKeyL(source,idioma.Reason..key.." \n "..idioma.SteamName..name.." \n "..idioma.PlayerIP..playerip.." \n "..idioma.SteamID..steamID.." \n "..idioma.Rockstar..license.." \n "..idioma.Discord..discord.." \n "..idioma.KickYesNo..tostring(Config.KickEnable))
	end
	if Config.KickEnable then
	DropPlayer(source,name.." "..idioma.MessageKick)
	end
end)