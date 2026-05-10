SMODS.Joker {
	key = 'voiceOfTheCity',
	name = "Voice of the City",
	pronouns = "it_its",
	config = { extra = { prescriptListShuffled = {}, prescriptActive = false, currentPrescript = 0} },
	no_collection = true, 
	perishable_compat = true,   
	eternal_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.prescriptActive } }
	end,
	add_to_deck = function(self, card, from_debuff)
        local prescriptListUnshuffled = {"j_pmcmod_prescript1", "j_pmcmod_prescript2", "j_pmcmod_prescript3", "j_pmcmod_prescript4", "j_pmcmod_prescript5", "j_pmcmod_prescript6", "j_pmcmod_prescript7", "j_pmcmod_prescript8", "j_pmcmod_prescript9", "j_pmcmod_prescript10", "j_pmcmod_prescript11"}
		
		card.ability.extra.prescriptListShuffled = Shuffle(prescriptListUnshuffled)
    end,
	calculate = function(self, card, context)

		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then	
			card.ability.extra.currentPrescript = card.ability.extra.currentPrescript + 1
			card.ability.extra.prescriptActive = false

			if card.ability.extra.currentPrescript >= 12 then
				card.ability.extra.currentPrescript = 1
			end
		end

		if context.ending_shop and card.ability.extra.prescriptActive == false and G.GAME.round_resets.ante > 1 and card.ability.extra.currentPrescript <= 11 then
			SMODS.add_card({ key = card.ability.extra.prescriptListShuffled[card.ability.extra.currentPrescript], stickers = {"eternal"}, force_stickers = true })
			card.ability.extra.prescriptActive = true
		end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_index'), HEX('e0e0e0'), HEX('59a5e3'), 1.2 )
 	end
}