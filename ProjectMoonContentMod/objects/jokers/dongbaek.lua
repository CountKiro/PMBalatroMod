SMODS.Joker {
	key = 'dongbaek',
	name = 'Dongbaek',
	pronouns = "she_her",
	config = { extra = { Xmult = 1.15 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,	
	rarity = 2,
	cost = 9,
    atlas = 'ModdedProjectMoon',
	pos = { x = 1, y = 3 },
	attributes = {'xmult', 'nine', 'rank'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult } }
	end,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 9 then
                return {
                    Xmult = card.ability.extra.Xmult,
                }
            end
        end
    end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_plasma') > 3
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_TLA'), HEX('c28f29'), HEX('992118'), 1.2 )
 	end
}