SMODS.Joker {
	key = 'ran',
	name = "Ran",
	pronouns = "she_her",
	config = { extra = { chips = 120, chips_base = 120 } },
	eternal_compat = false,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 6, y = 3 },
	attributes = {'chips', 'enhancements'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		if G.GAME.blind and G.GAME.blind.in_blind then
		local enhanced_card_tally = 0
		local enhanced_joker_tally = 0
			for _, playing_card in pairs(G.playing_cards or {}) do
				if next(SMODS.get_enhancements(playing_card)) then 
					enhanced_card_tally = enhanced_card_tally + 1 
				end
			end
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].edition then
					if G.jokers.cards[i].ability.set == 'Joker' then
						enhanced_joker_tally = enhanced_joker_tally + 1
					end
				end
			end
		card.ability.extra.chips = card.ability.extra.chips_base - (enhanced_joker_tally * 24) - (enhanced_card_tally * 5)
		end
		return { vars = { card.ability.extra.chips, card.ability.extra.chips_base} }
	end,
	calculate = function(self, card, context)
		if context.joker_main and card.ability.extra.chips >= 0 then
			return {
				chips = card.ability.extra.chips,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
			}
		end
		if context.joker_main and card.ability.extra.chips <= 0 then
		G.E_MANAGER:add_event(Event({
					func = function()
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true

						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true;
							end
						}))
						return true
					end
				}))
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_TLA'), HEX('c28f29'), HEX('992118'), 1.2 )
 	end
}