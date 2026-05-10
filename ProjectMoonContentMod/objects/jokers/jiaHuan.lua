SMODS.Joker {
	key = 'jiaHuan',
	name = "Jia Huan",
	pronouns = "he_him",
	config = { extra = {mult = 0} },
	no_collection = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 2, y = 1 },
	attributes = {'mult'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)

		
		if context.modify_hand and not context.blueprint and G.GAME.current_round.hands_played == 0 then

			if card.ability.extra.mult < mult then
				card.ability.extra.mult = card.ability.extra.mult + mult
			end

        end

		if context.before and context.main_eval and G.GAME.hands[context.scoring_name].level > 1 and not context.blueprint and G.GAME.current_round.hands_played == 0 then
			return {
				level_up = -(G.GAME.hands[context.scoring_name].level - 1),
			}
    	end

		if context.joker_main then
			return{
				mult = card.ability.extra.mult
			}
		end

    end,
	in_pool = function(self, args)

    end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_erratic') > 5
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_newLeagueOfNine'), HEX('242b45'), HEX('d5001e'), 1.2 )
 	end
}