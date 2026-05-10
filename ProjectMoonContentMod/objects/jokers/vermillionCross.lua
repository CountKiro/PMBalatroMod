SMODS.Joker {
	key = 'vermillionCross',
	name = "Vermillion Cross",
	pronouns = "he_him",
	config = { extra = { percentageToReduce = 0.5 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 4,
	cost = 10,
    atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 8 },
	soul_pos = { x = 5, y = 9 },
	attributes = {'score'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { card.ability.extra.percentageToReduce } }
	end,
	calculate = function(self, card, context)

		if context.setting_blind then
			G.E_MANAGER:add_event(Event({func = function()
				G.GAME.blind.chips = math.floor(G.GAME.blind.chips*card.ability.extra.percentageToReduce)
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
				G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
				G.HUD_blind:recalculate() 
				G.hand_text_area.blind_chips:juice_up()
			return true end }))
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_colorFixer'), HEX('2b1313'), HEX('f50000'), 1.2 )
 	end,
}