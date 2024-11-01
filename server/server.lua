local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("giftbox", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player.Functions.RemoveItem('giftbox', 1) then
        return
    end

    TriggerClientEvent('vx-giftbox:Client:OpenGiftBox', src)
end)

RegisterNetEvent('vx-giftbox:Server:GiftBoxRewards', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local MaxRewards = Config.MaxRewards
    local RewardsTable = {}
    local TrackRewards = {}

    while #RewardsTable < MaxRewards do
        local Reward = Config.Rewards[math.random(#Config.Rewards)]
        if not TrackRewards[Reward.Name] then
            TrackRewards[Reward.Name] = true
            RewardsTable[#RewardsTable + 1] = { Name = Reward.Name, Amount = Reward.Amount }
        end
    end

    for _, Reward in ipairs(RewardsTable) do
        Player.Functions.AddItem(Reward.Name, Reward.Amount)
        local RewardData = QBCore.Shared.Items[Reward.Name]

        TriggerClientEvent('inventory:client:ItemBox', src, RewardData, 'add', Reward.Amount)

        TriggerClientEvent('QBCore:Notify', src, 'You received ' .. Reward.Amount .. 'x ' .. RewardData.label, 'success')
    end
end)
