luaunit = require('luaunit');
require('manager_effect_35E');
Debug = {}

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end

function Debug.console(...)
    local varargs = {...};
    print(dump(varargs));
end

function test_onEffectAddStart_minute()
    local rEffect = {
        sUnits='minute'

    }
    onEffectAddStart(rEffect);
    luaunit.assertEquals(rEffect.nDuration,10)
end

function test_onEffectAddStart_hour()
    local rEffect = {
        sUnits='hour'

    }
    onEffectAddStart(rEffect);
    luaunit.assertEquals(rEffect.nDuration,0)
end

function test_onEffectAddStart_day()
    local rEffect = {
        sUnits='day'

    }
    onEffectAddStart(rEffect);
    luaunit.assertEquals(rEffect.nDuration,0)
end

StringManager={}
function StringManager.parseWords(rEffectSpell)
    return {'blinded', 'notcondition'};
end
function StringManager.convertStringToDice(sDice)
    return {};
end
function StringManager.isDiceString(sDice)
    return false;
end

function test_checkTagConditional()
    local aConditions = {'blinded', 'stunned'}
    local rEffectSpell = 'blinded notcondition';
    local matchedTags = checkTagConditional(aConditions, rEffectSpell);
    luaunit.assertTrue(matchedTags)
end

DB = {}
function DB.getValue(nodeSpellClass, valueTag, i)
    return 13;
end

function test_evalAbilityHelperTruncatedHCL()
    local sEffectAbility = '[HCL]';
    local rActor={};
    local nodeSpellClass={};
    local effect = evalAbilityHelper(rActor, sEffectAbility, nodeSpellClass);
    luaunit.assertEquals(effect, 6);
end

function test_evalAbilityHelperRoundHCL()
    local sEffectAbility = '[^HCL]';
    local rActor={};
    local nodeSpellClass={};
    local effect = evalAbilityHelper(rActor, sEffectAbility, nodeSpellClass);
    luaunit.assertEquals(effect, 7);
end

function test_evalAbilityHelperRoundNegativeHCL()
    local sEffectAbility = '[^-HCL]';
    local rActor={};
    local nodeSpellClass={};
    local effect = evalAbilityHelper(rActor, sEffectAbility, nodeSpellClass);
    luaunit.assertEquals(effect, -7);
end

function test_evalAbilityHelperNegativeRoundHCL()
    local sEffectAbility = '[-^HCL]';
    local rActor={};
    local nodeSpellClass={};
    local effect = evalAbilityHelper(rActor, sEffectAbility, nodeSpellClass);
    luaunit.assertEquals(effect, -7);
end

abilityEffectBonusToReturn = 5;

ActorManager35E = {}
function ActorManager35E.getAbilityBonus(rActor, sAbility) 
    return 2;
end

function ActorManager35E.getAbilityEffectsBonus(rActor, sAbility) 
    return abilityEffectBonusToReturn;
end

function test_evalAbilityHelperHSTR()
    local sEffectAbility = '[HSTR]';
    local rActor={};
    local nodeSpellClass={};
    local effect = evalAbilityHelper(rActor, sEffectAbility, nodeSpellClass);
    luaunit.assertEquals(effect, 3);
end

function test_evalAbilityHelperRoundHSTR()
    local sEffectAbility = '[^HSTR]';
    local rActor={};
    local nodeSpellClass={};
    local effect = evalAbilityHelper(rActor, sEffectAbility, nodeSpellClass);
    luaunit.assertEquals(effect, 4);
end

function test_evalAbilityHelperRoundHSTRNegativeBonus()
    local sEffectAbility = '[^HSTR]';
    local rActor={};
    local nodeSpellClass={};
    abilityEffectBonusToReturn = -5;
    local effect = evalAbilityHelper(rActor, sEffectAbility, nodeSpellClass);
    luaunit.assertEquals(effect, -2);
end

function test_evalAbilityHelperRoundHSTRZeroBonus()
    local sEffectAbility = '[^HSTR]';
    local rActor={};
    local nodeSpellClass={};
    abilityEffectBonusToReturn = -2;
    local effect = evalAbilityHelper(rActor, sEffectAbility, nodeSpellClass);
    luaunit.assertEquals(effect, -0);
end

os.exit(luaunit.LuaUnit.run());