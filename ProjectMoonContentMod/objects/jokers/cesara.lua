-- Cesara
SMODS.Joker {
	key = 'cesara',
	name = "Cesara",
	pronouns = "she_her",
	config = { extra = { currentPosition = 0 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = false,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 5 },
	attributes = {'position', 'rank', 'hand_type', 'modify_card'},
    pools =
	{
		
 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and next(context.poker_hands["Flush"]) and not context.blueprint then
			for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end

			card.ability.extra.currentPosition = my_pos

			if card.ability.extra.currentPosition == 1 then

				local currentCard = context.other_card
				
				G.E_MANAGER:add_event(Event({
				func = function()
					assert(SMODS.modify_rank(currentCard, 1))
					return true
				end
				}))

			end

		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_PCorp'), HEX('dbd7c5'), HEX('eb8117'), 1.2 )
 	end,
}