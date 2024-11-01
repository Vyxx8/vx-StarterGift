-- QBCore Exports --
local QBCore = exports['qb-core']:GetCoreObject()

-- Gift Box Progress Bar On-Opening --
RegisterNetEvent('vx-giftbox:Client:OpenGiftBox', function(source)
    -- Play opening sound effect
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "Stash", 0.25)

    -- Show the progress bar while opening the gift box
    QBCore.Functions.Progressbar('unwrapping_present', 'Unwrapping present', Config.ProgressBarInteger, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@gangops@facility@servers@',
        anim = 'hotwire',
        flags = 17,
    }, {}, {}, function() -- Success - On completion of the progress bar
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('vx-giftbox:Server:GiftBoxRewards') -- Trigger server rewards
    end, function() -- Cancel - If the action is canceled
        ClearPedTasks(PlayerPedId())
    end)
end)
