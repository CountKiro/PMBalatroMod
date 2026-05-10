SMODS.Joker {
	key = 'papaBongy',
	name = "Papa Bongy",
	pronouns = "he_him",
	config = { extra = { chips = 0, mult = 0, xmult = 1, dollars = 0, totalChickensSpawned = 0, chips_mod = 10, mult_mod = 5, xmult_mod = 0.1, dollars_mod = 1 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = false,
	rarity = 3,
	cost = 9,
    atlas = 'ModdedProjectMoon',
	pos = { x = 4, y = 14 },
	attributes = {'mult', 'chips', 'xmult', 'economy', 'scaling', 'summoning'},
    pools =
	{
        ["KCorp"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.xmult, card.ability.extra.dollars, card.ability.extra.chips_mod, card.ability.extra.mult_mod,
		card.ability.extra.xmult_mod, card.ability.extra.dollars_mod, card.ability.extra.totalChickensSpawned } }
	end,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
		local chickenPresent = false
		local possibleSpawns = {'j_pmcmod_chickenA', 'j_pmcmod_chickenB', 'j_pmcmod_chickenC', 'j_pmcmod_chickenD'}
		for i = 1, #G.jokers.cards do
			for j = 1, #G.P_CENTER_POOLS.HellsKitchen do
				if G.jokers.cards[i] ~= card and (G.P_CENTER_POOLS.HellsKitchen[j].key == G.jokers.cards[i].config.center.key) then 
					chickenPresent = true
					break
				end
			end
        end

		if G.jokers and chickenPresent == false then
			local totalChickensThatCanSpawn = G.jokers.config.card_limit - #G.jokers.cards
			if totalChickensThatCanSpawn == 1 then 
				SMODS.add_card({ key = pseudorandom_element(possibleSpawns, 'bongy') })
				card.ability.extra.totalChickensSpawned = card.ability.extra.totalChickensSpawned + 1
			end
			if totalChickensThatCanSpawn == 2 then 
				SMODS.add_card({ key = pseudorandom_element(possibleSpawns, 'bongy') })
				SMODS.add_card({ key = pseudorandom_element(possibleSpawns, 'bongy') })
				card.ability.extra.totalChickensSpawned = card.ability.extra.totalChickensSpawned + 2
			end
			if totalChickensThatCanSpawn == 3 then 
				SMODS.add_card({ key = pseudorandom_element(possibleSpawns, 'bongy') })
				SMODS.add_card({ key = pseudorandom_element(possibleSpawns, 'bongy') })
				SMODS.add_card({ key = pseudorandom_element(possibleSpawns, 'bongy') })
				card.ability.extra.totalChickensSpawned = card.ability.extra.totalChickensSpawned + 3
			end
			if totalChickensThatCanSpawn == 4 then 
				SMODS.add_card({ key = pseudorandom_element(possibleSpawns, 'bongy') })
				SMODS.add_card({ key = pseudorandom_element(possibleSpawns, 'bongy') })
				SMODS.add_card({ key = pseudorandom_element(possibleSpawns, 'bongy') })
				SMODS.add_card({ key = pseudorandom_element(possibleSpawns, 'bongy') })
				card.ability.extra.totalChickensSpawned = card.ability.extra.totalChickensSpawned + 4
			end
				return true
			end
		end

		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_chickenA" and not context.blueprint then
			card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
			return {
				message = 'Upgraded!',
				colour = G.C.MULT,
				card = card
			}
		end
		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_chickenB" and not context.blueprint then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
			return {
				message = 'Upgraded!',
				colour = G.C.CHIPS,
				card = card
			}
		end
		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_chickenC" and not context.blueprint then
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
			return {
				message = 'Upgraded!',
				colour = G.C.MULT,
				card = card
			}
		end
		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_chickenD" and not context.blueprint then
			card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollars_mod
			return {
				message = 'Upgraded!',
				colour = G.C.MONEY,
				card = card
			}
		end

		if context.joker_main and not context.blueprint then
			return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
				xmult  = card.ability.extra.xmult,
				--message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.xmult } }
            }
		end
    end,
	calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_plasma') > 2
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_citizen'), HEX('828282'), HEX('ebebeb'), 1.2 )
 	end
}