buckets = {}

function SetRoutingBucket(source)
	-- print("setting bucket")
	local bucket = nil
	for i = 101, 200 do
		if buckets[i] == nil then
			bucket = i
			break
		end
	end
	buckets[bucket] = source

	SetPlayerRoutingBucket(source, bucket)
end

function GetRoutingBucket(source)
	for i = 101, 200 do
		if buckets[i] == source then
			return buckets[i]
		end
	end
end

function ResetRoutingBucket(source)
	for i = 101, 200 do
		if buckets[i] == source then
			buckets[i] = nil
			SetPlayerRoutingBucket(source, 0)
			break
		end
	end
end

AddEventHandler("playerDropped", function(reason)
	ResetRoutingBucket(source)
end)

AddEventHandler("esx:playerLogout", function(reason)
	ResetRoutingBucket(source)
end)
AddEventHandler("onResourceStop", function(resourceName)
	if GetCurrentResourceName() == resourceName then
		for i = 101, 200 do
			if buckets[i] then
				SetPlayerRoutingBucket(buckets[i], 0)
			end
		end
	end
end)

exports("SetRoutingBucket", SetRoutingBucket)
exports("ResetRoutingBucket", ResetRoutingBucket)
exports("GetRoutingBucket", GetRoutingBucket)

RegisterNetEvent("Ludaro_Garage:ResetRoutingBucket", function()
	ResetRoutingBucket(source)
end)
RegisterNetEvent("Ludaro_Garage:SetRoutingBucket", function()
	SetRoutingBucket(source)
end)

RegisterNetEvent("Ludaro_Garage:GetRoutingBucket", function()
	GetRoutingBucket(source)
end)

RegisterCommand("getroutingbucket", function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getGroup() == "admin" and args[1] then
		xPlayer.showNotification(GetRoutingBucket(args[1]))
	elseif args[1] == nil then
		xPlayer.showNotification("Du hast keine ID angegeben")
	end
end)
RegisterCommand("setroutingbucket", function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == "admin" and args[1] and args[2] then
		SetPlayerRoutingBucket(args[1], args[2])
		xPlayer.showNotification("Die person mit der id " .. args[1] .. " ist jetzt im routing bucket " .. args[2])
	elseif args[1] == nil or args[2] == nil then
		xPlayer.showNotification("Du hast keine ID angegeben (oder keinen bucket)")
	end
end)
