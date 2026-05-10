SMODS.Joker {
	key = 'hohenheim',
	name = "Hohenheim",
	pronouns = "he_him",
	config = { cardsDestroyed = {}, extra = {  } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 10 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
    	return {vars = { }}
	end,
	calculate = function(self, card, context)
		
		if context.joker_type_destroyed then
			if context.card.config.center.key == "j_pmcmod_johann" then
--				print("COMPILING FAILURE")
			else
--				print("COMPILED SUCCESSFULLY")
				card.ability.cardsDestroyed[#card.ability.cardsDestroyed + 1] = context.card.config.center.key
			end
		end

		if #card.ability.cardsDestroyed > 0 and context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
					local joker_to_revive = pseudorandom_element(card.ability.cardsDestroyed, pseudoseed('hohenheim'))
					G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            		G.E_MANAGER:add_event(Event({
						func = function()
--							print(joker_to_revive)
								SMODS.add_card {
									set = 'Joker',
									key_append = "hohenheim",
									key = joker_to_revive,
									edition = 'e_negative',
									stickers = {"perishable"},
									force_stickers = true
								}
								G.GAME.joker_buffer = 0
							return true
						end
					}))
		end

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_limbus'), G.C.BLACK, G.C.RED, 1.2 )
 	end,
}