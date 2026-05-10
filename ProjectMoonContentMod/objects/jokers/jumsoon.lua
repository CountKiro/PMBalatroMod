SMODS.Joker {
	key = 'jumsoon',
	name = "Jumsoon",
	pronouns = "he_him",
	config = { extra = { type = "Full House" } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,	
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 2, y = 2 },
	attributes = {'hand_type', 'modify_card'},
    pools =
	{
		["Ring"] = true,
 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { localize(card.ability.extra.type, 'poker_hands') } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and not context.blueprint and next(context.poker_hands[card.ability.extra.type]) and G.GAME.current_round.hands_played == 0 then

			local my_pos = nil

			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					my_pos = i
					break
				end
			end

			for i = 1, (my_pos - 1) do

				G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 0.15,
						func = function()
							G.jokers.cards[i]:flip()
							play_sound('card1', percent)
							G.jokers.cards[i]:juice_up(0.3, 0.3)
							return true
						end,
					}))
					

				local rarity = G.jokers.cards[i].config.center.rarity
				
				if rarity <= 3 then
						G.E_MANAGER:add_event(Event({
						delay = 0.5,
						func = function()
							G.jokers.cards[i]:set_ability(pseudorandom_element(G.P_JOKER_RARITY_POOLS[rarity], 'seed').key)
							return true
						end
					}))
				end
			
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_ring'), HEX('474747'), HEX('c4c4c4'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_garnet" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}