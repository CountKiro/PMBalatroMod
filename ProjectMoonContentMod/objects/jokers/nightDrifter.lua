SMODS.Joker {
	key = 'nightDrifter',
	name = "Night Drifter",
	pronouns = "he_him",
	config = { extra = { minXMult = 0.8, maxXMult = 2, minXMult_mod = 0.1, maxXMult_mod = 0.5, currentConsumableCount = 0 } },
	unlocked = true,	
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,	
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 2, y = 5 },
	attributes = {'xmult', 'random', 'consumable'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { (card.ability.extra.minXMult - (card.ability.extra.minXMult_mod * card.ability.extra.currentConsumableCount)), (card.ability.extra.maxXMult + (card.ability.extra.maxXMult_mod * card.ability.extra.currentConsumableCount)), card.ability.extra.currentConsumableCount, card.ability.extra.minXMult_mod, card.ability.extra.maxXMult_mod  } }
	end,
	calculate = function(self, card, context)
		if context.using_consumeable and not context.blueprint and card.ability.extra.currentConsumableCount <= 3 then
			card.ability.extra.currentConsumableCount = card.ability.extra.currentConsumableCount + 1
		end

        if context.joker_main then
            local selectedXMult = 1
            local coinToss = math.random(1,2)

            if coinToss == 1 then
                selectedXMult = card.ability.extra.maxXMult + (card.ability.extra.maxXMult_mod * card.ability.extra.currentConsumableCount)
            else
                selectedXMult = card.ability.extra.minXMult - (card.ability.extra.minXMult_mod * card.ability.extra.currentConsumableCount)
            end

			return {
				xmult = selectedXMult
			}
		end

        if context.end_of_round and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then	
            card.ability.extra.currentConsumableCount = 0
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_assassin'), G.C.BLACK, G.C.WHITE, 1.2 )
 	end,
}