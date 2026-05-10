SMODS.Joker {
	key = 'childrenOfTheGalaxy',
	name = "Children of The Galaxy",
	pronouns = "they_them",
	config = { extra = {baseChance = 1, maxChance = 4, priceIncrease = 20} },
	no_collection = true,    
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 14 },
	attributes = {'chance', 'seals', 'economy'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.baseChance, card.ability.extra.maxChance} }
	end,
	calculate = function(self, card, context)

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
			
			for i = 1, #G.playing_cards do
				G.playing_cards[i]:set_seal()
			end

			for i = 1, #G.playing_cards do
				if SMODS.pseudorandom_probability(card, 'seed', card.ability.extra.baseChance, card.ability.extra.maxChance, 'galaxyChance') then
					G.playing_cards[i]:set_seal('pmcmod_pebble', true)
				end
			end
		end

    end,
	add_to_deck = function(self, card, from_debuff)
        G.GAME.discount_percent = G.GAME.discount_percent - card.ability.extra.priceIncrease
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.discount_percent = G.GAME.discount_percent + card.ability.extra.priceIncrease
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}