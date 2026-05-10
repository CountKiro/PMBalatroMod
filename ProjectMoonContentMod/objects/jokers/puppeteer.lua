SMODS.Joker {
	key = 'puppeteer',
	name = "Puppeteer",
	pronouns = "he_him",
	config = { extra = { mult = 0 } },
    unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
    blueprint_compat = true,
	rarity = 3,
    cost = 10,
	atlas = 'ModdedProjectMoonTrue',
	pos = { x = 2, y = 8 },
	attributes = {'mult', 'summoning'},
	pools =
	{
        
 	},
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.mult }}
	end,
	calculate = function(self, card, context)

		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end

		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_puppetA" and not context.blueprint then
--			print("Testing destruction")
--			print(context.card.config.center.key)
			card.ability.extra.mult = card.ability.extra.mult + 7.5
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
				message_card = card
			}
		end

		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_puppetB" and not context.blueprint then
			card.ability.extra.mult = card.ability.extra.mult + 15
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
				message_card = card
			}
		end

		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_puppetC" and not context.blueprint then
			card.ability.extra.mult = card.ability.extra.mult + 25
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
				message_card = card
			}
		end

		if context.setting_blind and not context.blueprint then

			if context.setting_blind then

				local acceptableJokers = {}
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i] ~= card and not G.jokers.cards[i].getting_sliced and not
					(G.jokers.cards[i].config.center.key == "j_pmcmod_puppetA") and not
					(G.jokers.cards[i].config.center.key == "j_pmcmod_puppetB") and not
					(G.jokers.cards[i].config.center.key == "j_pmcmod_puppetC") and not
					(G.jokers.cards[i].config.center.key == "j_pmcmod_puppetAngelica")
					then acceptableJokers[#acceptableJokers+1] = G.jokers.cards[i] end
				end

				local joker_to_transform = #acceptableJokers > 0 and pseudorandom_element(acceptableJokers, pseudoseed('puppeteer')) or nil

				if #acceptableJokers > 0 then
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 0.15,
						func = function()
							joker_to_transform:flip()
							play_sound('card1', percent)
							joker_to_transform:juice_up(0.3, 0.3)
							return true
						end,
					}))

					if joker_to_transform.config.center.key == "j_pmcmod_angelica" or joker_to_transform.config.center.key == "j_half" then
					G.E_MANAGER:add_event(Event({
						delay = 0.5,
						func = function()
							joker_to_transform:set_ability(G.P_CENTERS["j_pmcmod_puppetAngelica"])
							return true
						end
					}))
					elseif joker_to_transform.config.center.rarity == 1 then
						G.E_MANAGER:add_event(Event({
							delay = 0.5,
							func = function()
								joker_to_transform:set_ability(G.P_CENTERS["j_pmcmod_puppetA"])
								return true
							end
						}))
					elseif joker_to_transform.config.center.rarity == 2 then
						G.E_MANAGER:add_event(Event({
							delay = 0.5,
							func = function()
								joker_to_transform:set_ability(G.P_CENTERS["j_pmcmod_puppetB"])
								return true
							end
						}))
					elseif joker_to_transform.config.center.rarity == 3 then
						G.E_MANAGER:add_event(Event({
							delay = 0.5,
							func = function()
								joker_to_transform:set_ability(G.P_CENTERS["j_pmcmod_puppetC"])
								return true
							end
						}))
					end
				end
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_puppets'), G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_onyx_agate" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}