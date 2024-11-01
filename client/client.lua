local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('vx-giftbox:Client:OpenGiftBox', function(source)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "Stash", 0.25)

    QBCore.Functions.Progressbar('unwrapping_present', 'Unwrapping present', Config.ProgressBarInteger, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@gangops@facility@servers@',
        anim = 'hotwire',
        flags = 17,
    }, {}, {}, function() 
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('vx-giftbox:Server:GiftBoxRewards')
    end, function() 
        ClearPedTasks(PlayerPedId())
    end)
end)
