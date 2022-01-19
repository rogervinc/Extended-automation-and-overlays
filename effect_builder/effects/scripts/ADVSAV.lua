function createEffectString()
    local effectString = parentcontrol.window.advantage.getStringValue() .. "SAV"
    local save = save.getStringValue()
    if save ~= "" then
        effectString = effectString .. ": " .. save
    end

    return effectString
end
