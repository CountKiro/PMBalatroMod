SMODS.Joker {
	key = 'linDaiyu',
	name = "Lin Daiyu",
	pronouns = "she_her",
	config = { extra = { ruptureStack = 0, trigger = false } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = false,
	rarity = 2,
	cost = 7,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 7, y = 2 },
	attributes = {'rupture', 'on_destroy', 'scaling'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.ruptureStack } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.scoring_hand[1]:get_id() == 5 then
				if SMODS.has_enhancement(context.other_card, 'm_pmcmod_rupture') then
					card.ability.extra.ruptureStack = card.ability.extra.ruptureStack + context.other_card.ability.counter
					context.other_card.ability.counter = 0
				end
			end
		end
		if context.joker_main then
			return{
				xmult = 1 + 0.1*(card.ability.extra.ruptureStack / 5)
			}
		end
		if context.after then
			card.ability.extra.ruptureStack = 0
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_xueFamily'), HEX("f0a3a3"), HEX('c22929'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        if args.type == 'modify_deck' then
            local count = 0
            for _, playing_card in ipairs(G.playing_cards or {}) do
                if SMODS.has_enhancement(playing_card, 'm_pmcmod_rupture') then count = count + 1 end
                if count >= 5 then
                    return true
                end
            end
        end
        return false
    end
}