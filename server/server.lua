-- QBCore Exports --
local QBCore = exports['qb-core']:GetCoreObject()

-- Gift Box Useable Item Event --
QBCore.Functions.CreateUseableItem("giftbox", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    -- Check if the player has the gift box and remove it
    if not Player.Functions.RemoveItem('giftbox', 1) then
        return
    end

    -- Trigger the client event to open the gift box
    TriggerClientEvent('vx-giftbox:Client:OpenGiftBox', src)
end)

-- Gift Box Rewards --
RegisterNetEvent('vx-giftbox:Server:GiftBoxRewards', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    -- Define how many rewards the player will receive
    local MaxRewards = Config.MaxRewards
    local RewardsTable = {}
    local TrackRewards = {}

    -- Generate random rewards
    while #RewardsTable < MaxRewards do
        local Reward = Config.Rewards[math.random(#Config.Rewards)]
        if not TrackRewards[Reward.Name] then
            TrackRewards[Reward.Name] = true
            RewardsTable[#RewardsTable + 1] = { Name = Reward.Name, Amount = Reward.Amount }
        end
    end

    -- Give the rewards to the player and notify them
    for _, Reward in ipairs(RewardsTable) do
        Player.Functions.AddItem(Reward.Name, Reward.Amount)
        local RewardData = QBCore.Shared.Items[Reward.Name]

        -- Notify the player about the items they received
        TriggerClientEvent('inventory:client:ItemBox', src, RewardData, 'add', Reward.Amount)

        -- Optionally, you can also send a text notification for more clarity
        TriggerClientEvent('QBCore:Notify', src, 'You received ' .. Reward.Amount .. 'x ' .. RewardData.label, 'success')
    end
end)
