SMODS.Joker {
	key = 'alessio',
	name = "Alessio",
	pronouns = "he_him",
	config = { extra = { } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = false,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 6, y = 5 },
	attributes = {'position', 'suit', 'hand_type', 'modify_card'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.poker_hands and next(context.poker_hands["Flush"]) and not context.blueprint then
			for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
			card.ability.extra.curentPosition = my_pos

			if card.ability.extra.curentPosition == 1 then

				local currentCard = context.other_card

				if context.other_card:is_suit("Hearts") then
				G.E_MANAGER:add_event(Event({
					func = function()
						assert(SMODS.change_base(currentCard, "Diamonds"))
						return true
					end
				}))
				elseif context.other_card:is_suit("Diamonds") then
					G.E_MANAGER:add_event(Event({
						func = function()
							assert(SMODS.change_base(currentCard, "Spades"))
							return true
						end
					}))
				elseif context.other_card:is_suit("Spades") then
					G.E_MANAGER:add_event(Event({
						func = function()
							assert(SMODS.change_base(currentCard, "Clubs"))
							return true
						end
					}))
				elseif context.other_card:is_suit("Clubs") then
					G.E_MANAGER:add_event(Event({
						func = function()
							assert(SMODS.change_base(currentCard, "Hearts"))
							return true
						end
					}))
				end
			end

		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_PCorp'), HEX('dbd7c5'), HEX('eb8117'), 1.2 )
 	end,
}