SMODS.Joker {
	key = 'sanson',
	name = 'Sanson',
	pronouns = "he_him",
	config = { extra = { multiplied_value = 5 } },
	eternal_compat = false,
	perishable_compat = true,
	blueprint_compat = false,
	rarity = 2,
	cost = 6,
	atlas = 'ModdedProjectMoon',
	pos = { x = 6, y = 1 },
	attributes = {'passive', 'mod_chance'},
    pools =
	{
        ["Bloodfiends"] = true,
        ["DemiansGroup"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.multiplied_value } }
	end,
	calculate = function(self, card, context)
        if context.hand_drawn and not context.blueprint then
			local any_forced = nil
			for _, playing_card in ipairs(G.hand.cards) do
				if playing_card.ability.forced_selection then
					any_forced = true
				end
			end
			if not any_forced then
				G.hand:unhighlight_all()
				local forced_card = pseudorandom_element(G.hand.cards, 'vremade_cerulean_bell')
				forced_card.ability.forced_selection = true
				G.hand:add_to_highlighted(forced_card)
			end
		end
		if context.modify_hand and not context.blueprint then
                mult = math.max(math.floor(mult * card.ability.extra.multiplied_value), 1)
                hand_chips = math.max(math.floor(hand_chips * card.ability.extra.multiplied_value), 0)
                update_hand_text({ sound = 'chips2', modded = true }, { chips = hand_chips, mult = mult })
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_sovereigns'), HEX('d61f11'), HEX('470d09'), 1.2 )
 	end
}