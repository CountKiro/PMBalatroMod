SMODS.Joker {
    key = "lisa",
	name = "Lisa",
	pronouns = "she_her",
	config = {extra = {enochDeathCounter = 0, aceMult = 5, aceMult_mod = 10, roundCount = 0}},
	unlocked = false,
	eternal_compat = false,
	perishable_compat = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 0 },
	attributes = {'ace', 'mult', 'scaling', 'meltdown', 'gimmick'},
    pools = 
	{
 		["Heretics"] = true,
 	},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_meltdown"}
        return {vars = { card.ability.extra.enochDeathCounter, card.ability.extra.aceMult, card.ability.extra.aceMult_mod, card.ability.extra.roundCount } }
    end,

    calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint  then
		local enochPresent = false
		local robotEnochPresent = false

			for i=1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.key == "j_pmcmod_enoch" then
					enochPresent = true
					break
				end
			end

			for i=1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.key == "j_pmcmod_robotEnoch" then
					robotEnochPresent = true
					break
				end
			end
		
			if G.jokers and enochPresent == false and card.ability.extra.enochDeathCounter < 1 then
				SMODS.add_card({ key = "j_pmcmod_enoch", stickers = {"eternal"}, force_stickers = true })
			end
			if G.jokers and robotEnochPresent == false and card.ability.extra.enochDeathCounter >= 1 then
				SMODS.add_card({ key = "j_pmcmod_robotEnoch", stickers = {"eternal"}, force_stickers = true })
			end
			
		end
		--if context.joker_type_destroyed then
		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_enoch" and not context.blueprint  then
--			print("Testing destruction")
			card.ability.extra.enochDeathCounter = card.ability.extra.enochDeathCounter + 1
			card.ability.extra.aceMult = card.ability.extra.aceMult + card.ability.extra.aceMult_mod
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
				message_card = card
			}
		end
		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_robotEnoch" and not context.blueprint  then
--			print("Testing destruction")
			card.ability.extra.enochDeathCounter = card.ability.extra.enochDeathCounter + 1
			card.ability.extra.aceMult = card.ability.extra.aceMult + card.ability.extra.aceMult_mod
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
				message_card = card
			}
		end
		if context.individual and context.cardarea == G.play and
            context.other_card:get_id() == 14 then
            return {
                mult = card.ability.extra.aceMult
            }
        end

		if context.after and context.main_eval and card.ability.extra.enochDeathCounter >= 3 and not context.blueprint  then
			local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_robotTiph"])
					card:set_eternal(true)
                    return true
                end
            }))
		end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
			card.ability.extra.roundCount = card.ability.extra.roundCount + 1
				if card.ability.extra.roundCount >= 4 then
					local percent = 1.15
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.15,
					func = function()
						card:flip()
						play_sound('card1', percent)
						card:juice_up(0.3, 0.3)
						return true
					end,
				}))

				G.E_MANAGER:add_event(Event({
					delay = 0.5,
					func = function()
						card:set_ability(G.P_CENTERS["j_pmcmod_sephirahTiphereth"])
						card:set_eternal(true)
						return true
					end
				}))
			end
		end

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_LCorp'), G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_anaglyph') > 3
    end
}