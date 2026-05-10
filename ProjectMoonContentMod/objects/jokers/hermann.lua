SMODS.Joker {
    key = "hermann",
	name = "Hermann",
	pronouns = "she_her",
	config = {extra = {odds_seal = 2, odds_edition = 4}},
	eternal_compat = true,
	perishable_compat = true,
    blueprint_compat = false,
    rarity = 3,
    cost = 9,
	atlas = 'ModdedProjectMoon',
    pos = { x = 0, y = 1 },
	attributes = {'chance', 'enhancements', 'seals', 'editions', 'modify_card'},
    pools = 
	{
 		["NewLeagueOfNine"] = true,
 	},
    loc_vars = function(self, info_queue, card)
        return {vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds_seal, card.ability.extra.odds_edition } }
    end,
	calculate = function(self, card, context)
		if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
		if context.before and context.main_eval and not context.blueprint and G.GAME.current_round.hands_played == 0 then
			for _, scored_card in ipairs(context.scoring_hand) do
				local possible_enhancements = {'m_bonus', 'm_mult', 'm_wild', 'm_glass', 'm_steel', 'm_stone', 'm_gold', 'm_lucky', 'm_pmcmod_burn', 'm_pmcmod_bleed', 'm_pmcmod_rupture', 'm_pmcmod_poise', 'm_pmcmod_tremor'}
				local possible_seals = {"Red", "Purple", "Blue", "Gold", "pmcmod_markofcain"}
				local possible_editions = {'e_foil', 'e_holo', 'e_polychrome'}
                    scored_card:set_ability(pseudorandom_element(possible_enhancements, pseudoseed('hermann')), nil, true)
					if (pseudorandom('hermann_seal') < G.GAME.probabilities.normal / card.ability.extra.odds_seal) then
						scored_card:set_seal(pseudorandom_element(possible_seals, pseudoseed('hermann')), nil, true)
					end

					if (pseudorandom('hermann_edition') < G.GAME.probabilities.normal / card.ability.extra.odds_edition) then
						scored_card:set_edition(pseudorandom_element(possible_editions, pseudoseed('hermann')), nil, true)
					end
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            return true
                        end
                    }))
            end
		end

	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_erratic') > 5
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_newLeagueOfNine'), HEX('242b45'), HEX('d5001e'), 1.2 )
 	end
}