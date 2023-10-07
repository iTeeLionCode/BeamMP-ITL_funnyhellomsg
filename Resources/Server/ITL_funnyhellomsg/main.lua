pluginName = "ITL_funnyhellomsg"
pluginVersion = "0.0.1"

CFG = require("cfg")

function sleep(seconds)
    os.execute("sleep " .. tonumber(seconds))
end

function sendMessage(playerId)
    local playerName = MP.GetPlayerName(playerId)
    local messageTemplate = pluginConfig.messages[math.random(1, #pluginConfig.messages)]
    local message = string.format(messageTemplate, playerName)
    sleep(5)
    MP.SendChatMessage(-1, message)
end

function onInit()

    pluginConfig = CFG.getLocal("main")

    function onPlayerJoinHandler(playerId)
        sendMessage(playerId)
    end
    MP.RegisterEvent("onPlayerJoin", "onPlayerJoinHandler")
    
end
