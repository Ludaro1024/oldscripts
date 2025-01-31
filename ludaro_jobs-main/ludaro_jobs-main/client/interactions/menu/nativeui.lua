if Config.Menu == "NativeUI" then
    function openInteractionsMenu(job)
        interactions = lib.callback.await('ludaro_jobs:getinteractions', false, job)

        if tonumber(interactions) == 0 or interactions == false or interactions == true then
            Config.Notify(framework_Locale("nointeractions"))
        else
            interactions = interactions
            mainmenu = NativeUI.CreateMenu(framework_Locale("interactions") .. " | " .. job, "")
            _menuPool:Add(mainmenu)
            _menuPool:RefreshIndex()
            _menuPool:MouseControlsEnabled(false)
            _menuPool:MouseEdgeEnabled(false)
            _menuPool:ControlDisablingEnabled(false)
            mainmenu:Visible(true)
            local sortedInteractions = {}
            for k, v in pairs(interactions) do
                table.insert(sortedInteractions, v)
            end
            table.sort(sortedInteractions, function(a, b)
                return getInteractionPrio(a) < getInteractionPrio(b)
            end)
            for k, v in ipairs(sortedInteractions) do
                local item = NativeUI.CreateItem(getInteractionName(v) or v, "")
                mainmenu:AddItem(item)
                item:SetRightBadge(tonumber(getInteractionIcon(v)) or 0)
                item.Activated = function()
                    if getInteractionEventType(v) == true then
                        TriggerEvent(getInteractionEventName(v) or "ludaro_jobs:interactionserror", getEventArgs(v) or {})
                    else
                        TriggerServerEvent(getInteractionEventName(v) or "ludaro_jobs:interactionserror",
                            getEventArgs(v) or {})
                    end
                end
            end
        end
    end
end
