
data.component_register_filters["resource_only"] = function(def: CompDef, _: any): boolean return def.tag == "resource" end

local type ExtraData = record
    fill_level: integer
end

local type CustomUI = record
    progress: number
    tt: Widget
    update: function(self: CustomUI)
end

local c_silo = Comp:RegisterComponent("c_silo", {
    name = "Silo Storage",
    desc = "Just a big pile",
    texture = "Main/textures/icons/values/resource.png",
    power = 0,
    race = "robot",
    activation = "OnAnyItemSlotChange",
    attachment_size = "Large",
    non_removable = true,
    registers = {
        { type = "resource", tip = "Resource to store", ui_apply = "Resource to store", ui_icon = "icon_context", filter = "resource_only" },
    },
})

function c_silo:get_ui(comp: Component): Widget
    return UI.New([[<Progress height=56 width=56 color=blue angle=270/>]], {
        update = function(w: CustomUI)
            -- bars
            if not comp or not comp.exists then return end
            local ed = comp.extra_data as ExtraData
            local fill_level = (ed.fill_level or 0)
            w.progress = fill_level/2000
            if w.tt then
                w.tt.text = string.format("%s: %.0f/2000", "Fill Level", ed.fill_level)
            end
        end,
        tooltip = function(w: CustomUI): Widget
            w.tt = UI.New("<Box bg=popup_box_bg padding=12 blur=true><Text/></Box>", { destruct = function() w.tt = nil end })
            w:update()
            return w.tt.parent
        end
    })
end

function c_silo:on_update(comp: Component, _: any)
    --print("[" .. comp.id .. ":on_update] cause: " .. comp:CauseToString(cause) .. " - comp.is_working: " .. tostring(comp.is_working) .. " - has_power: " .. tostring(comp.owner.has_power))
    local owner = comp.owner
    local ed = comp.extra_data as ExtraData
    local resType = comp:GetRegisterId(1)
    local reserveQty = comp:GetRegisterNum(1)
    local fill_level = (ed.fill_level or 0)
    local reg = comp:GetRegister(1)

    if resType then
        if not (data.items[resType].tag == "resource") then
            print("Not a resource!")
            comp:SetRegisterId(1, nil)
            return
        end
        if reserveQty == 0 then
            local maxStack = data.items[resType].stack_size
            comp:SetRegisterNum(1, maxStack)
            reserveQty = maxStack
        end
        
        if (fill_level > 0) and not (reg.def.read_only) then
            print("Setting Read-only")
            reg.def.read_only = true;
            comp:SetRegister(1, reg.def)
        end

        local currentQty = owner:CountItem(resType)
        if currentQty > reserveQty then
            local maxStoreQty =  currentQty - reserveQty
            owner:AutoMergeSlots(resType)
            local slot = owner:FindSlot(resType)
            local storeQty = math.max(slot.stack, maxStoreQty)
            slot:RemoveStack(storeQty)
            ed.fill_level = fill_level + storeQty
        elseif currentQty < reserveQty and fill_level > 0 then
            local decantQty = math.min(fill_level, reserveQty - currentQty) as integer
            if reg.def.read_only and decantQty == fill_level then
                print("Unsetting Read-only")
                reg.def.read_only = false;
                comp:SetRegister(1, reg.def)
            end
            owner:AddItem(resType, decantQty)
            ed.fill_level = fill_level - decantQty
        end
    end
end
