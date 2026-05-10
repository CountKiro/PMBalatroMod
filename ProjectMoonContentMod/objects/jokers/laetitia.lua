SMODS.Joker {
	key = 'laetitia',
	name = "Laetitia",
	pronouns = "they_them",
	config = { extra = {baseChance = 1, maxChance = 10} },
	no_collection = true,    
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 6, y = 14 },
	attributes = {'chance', 'seals', 'mult', 'tags'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local gift_tally = 0
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if playing_card.seal == "pmcmod_gift" then gift_tally = gift_tally + 1 end
				end
			end
		return { vars = { gift_tally, card.ability.extra.baseChance, card.ability.extra.maxChance } }
	end,
	calculate = function(self, card, context)

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then

			local gift_tally = 0
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if playing_card.seal == "pmcmod_gift" then gift_tally = gift_tally + 1 end
				end
			end

			if G.GAME.round_resets.ante > 1 then

				if gift_tally > 0 then
					ease_dollars(-gift_tally*10)
				else  
					G.E_MANAGER:add_event(Event({
					func = (function()
						add_tag(Tag('tag_standard'))
						play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
						play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
						return true
					end)
					}))
					G.E_MANAGER:add_event(Event({
					func = (function()
						add_tag(Tag('tag_charm'))
						play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
						play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
						return true
					end)
					}))
					G.E_MANAGER:add_event(Event({
					func = (function()
						add_tag(Tag('tag_meteor'))
						play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
						play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
						return true
					end)
					}))
					G.E_MANAGER:add_event(Event({
					func = (function()
						add_tag(Tag('tag_buffoon'))
						play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
						play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
						return true
					end)
					}))
				end
			end

			for i = 1, #G.playing_cards do
				G.playing_cards[i]:set_seal()
			end

			for i = 1, #G.playing_cards do
				if SMODS.pseudorandom_probability(card, 'seed', card.ability.extra.baseChance, card.ability.extra.maxChance, 'laetitiaChance') then
					G.playing_cards[i]:set_seal('pmcmod_gift', true)
				end
			end
		end

    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}