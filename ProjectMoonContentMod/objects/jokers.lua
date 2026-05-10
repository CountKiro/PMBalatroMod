SMODS.Attribute{
	key = "summoning",
}

SMODS.Attribute{
	key = "random",
}

SMODS.Attribute{
	key = "charge",
}

SMODS.Attribute{
	key = "erasing",
}

SMODS.Attribute{
	key = "bleed",
}

SMODS.Attribute{
	key = "rupture",
}

SMODS.Attribute{
	key = "sinking",
}

SMODS.Attribute{
	key = "burn",
}

SMODS.Attribute{
	key = "poise",
}

SMODS.Attribute{
	key = "pallid",
}

SMODS.Attribute{
	key = "ammo",
}

SMODS.Attribute{
	key = "painted",
}

SMODS.Attribute{
	key = "erasing",
}

SMODS.Attribute{
	key = "negative",
}

SMODS.Attribute{
	key = "polychrome",
}

SMODS.Attribute{
	key = "ante_reset",
}

SMODS.Attribute{
	key = "consumable",
}

SMODS.Attribute{
	key = "destroy_itself",
}

SMODS.Attribute{
	key = "position",
}

SMODS.Attribute{
	key = "voucher",
}

SMODS.Attribute{
	key = "selling_card",
}

SMODS.Attribute{
	key = "stickers",
}

SMODS.Attribute{
	key = "on_destroy",
}

SMODS.Attribute{
	key = "debuff",
}

SMODS.Attribute{
	key = "game_over",
}

SMODS.Attribute{
	key = "gimmick",
}

SMODS.Attribute{
	key = "obfuscation",
}


function Card:keypage_add_speech_bubble(text_key, align, loc_vars)
        if self.children.speech_bubble then self.children.speech_bubble:remove() end
        self.config.speech_bubble_align = {align=align or 'bm', offset = {x=0,y=0},parent = self}
        self.children.speech_bubble = 
        UIBox{
            definition = G.UIDEF.speech_bubble(text_key, loc_vars),
            config = self.config.speech_bubble_align
        }
        self.children.speech_bubble:set_role{
            role_type = 'Minor',
            xy_bond = 'Weak',
            r_bond = 'Strong',
            major = self,
        }
        self.children.speech_bubble.states.visible = false
		local hold_time = (G.SETTINGS.GAMESPEED*4) or 4
		G.E_MANAGER:add_event(Event({trigger = "after", delay = hold_time, blockable = false, blocking = false, func = function()
			self.children.speech_bubble:remove()
		return true end}))
    end
function Card:keypage_say_stuff(n, not_first)
    self.talking = true
    if not not_first then 
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                if self.children.speech_bubble then self.children.speech_bubble.states.visible = true end
                self:keypage_say_stuff(n, true)
              return true
            end
        }))
    else
        if n <= 0 then self.talking = false; return end
        local new_said = math.random(1, 11)
        while new_said == self.last_said do 
            new_said = math.random(1, 11)
        end
        self.last_said = new_said
        play_sound('voice'..math.random(1, 11), G.SPEEDFACTOR*(math.random()*0.2+1), 0.5)
        self:juice_up()
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            blockable = false, blocking = false,
            delay = 0.13,
            func = function()
                self:keypage_say_stuff(n-1, true)
            return true
            end
        }), 'tutorial')
		local hold_time = (G.SETTINGS.GAMESPEED*4) or 4
		G.E_MANAGER:add_event(Event({trigger = "after", delay = hold_time, blockable = false, blocking = false, func = function()
			self.children.speech_bubble:remove()
		return true end}))
    end
end

function Shuffle(t)
	local s = {}
	for i = 1, #t do s[i] = t[i] end
	for i = #t, 2, -1 do
		local j = math.random(i)
		s[i], s[j] = s[j], s[i]
	end
	return s
end

