SMODS.Joker {
	key = 'xueBaochai',
	name = "Xue Baochai",
	pronouns = "she_her",
	config = { extra = { percentageToReduce = 0.9 } },
	unlocked = true,
	perishable_compat = true,
	eternal_compat = true,
	blueprint_compat = false,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 8, y = 2 },
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
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_xueFamily'), HEX("f0a3a3"), HEX('c22929'), 1.2 )
 	end,
}