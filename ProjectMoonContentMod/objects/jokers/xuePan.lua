SMODS.Joker {
	key = 'xuePan',
	name = "Xue Pan",
	pronouns = "he_him",
	config = { extra = { } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 8, y = 3 },
	attributes = {'editions', 'destroy_card', 'modify_card'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
		local coinFlip = math.random(1,2)
		if context.setting_blind and not context.blueprint then
			if coinFlip == 1 then
				local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)

				local eligible_card = pseudorandom_element(editionless_jokers, 'xuePan')
				local edition = SMODS.poll_edition { key = "xuePan", guaranteed = true, no_negative = false, options = { 'e_polychrome', 'e_holo', 'e_foil', 'e_negative', 'e_pmcmod_charge' } }
				eligible_card:set_edition(edition, true)
				check_for_unlock({ type = 'have_edition' })
			else
				local destructable_jokers = {}
                for i = 1, #G.jokers.cards do
					if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced and not G.jokers.cards[i].edition then
						 destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i]
					end
                end
                local joker_to_destroy = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('xuePan')) or nil

                if joker_to_destroy and not (context.blueprint_card or self).getting_sliced then
                    joker_to_destroy.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
                        card:juice_up(0.8, 0.8)
                        joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
                end
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_xueFamily'), HEX("f0a3a3"), HEX('c22929'), 1.2 )
 	end,
}