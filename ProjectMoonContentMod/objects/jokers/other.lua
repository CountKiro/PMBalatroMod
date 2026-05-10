-- Dummy Ricardo
SMODS.Joker {
	key = 'dummyRicardo',
	name = "Dummy Ricardo",
	pronouns = "it_its",
	config = { extra = { ricardoDefeatCounter = 0, canSpawnRicardo = false, baseChance = 1, maxChance = 3} },
	no_collection = true,
	perishable_compat = true,
	eternal_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 4 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'wernerChance')
		return { vars = { card.ability.extra.ricardoDefeatCounter, card.ability.extra.canSpawnRicardo, new_numerator, new_denominator } }
	end,
	calculate = function(self, card, context)

		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_ricardo" then
--			print("Testing Ricardo increment")
			card.ability.extra.ricardoDefeatCounter = card.ability.extra.ricardoDefeatCounter + 1
			card.ability.extra.canSpawnRicardo = true
		end

		if context.ending_shop and not context.blueprint and G.jokers and card.ability.extra.canSpawnRicardo == true then
			SMODS.add_card({ key = "j_pmcmod_ricardo" })
			if SMODS.pseudorandom_probability(card, 'seed', card.ability.extra.baseChance, card.ability.extra.maxChance, 'wernerChance') then
				SMODS.add_card({ key = "j_pmcmod_werner" })
			end
			card.ability.extra.canSpawnRicardo = false
		end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}