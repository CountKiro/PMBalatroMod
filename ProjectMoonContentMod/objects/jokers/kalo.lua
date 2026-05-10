SMODS.Joker {
    key = "kalo",
	name = "Kalo",
	pronouns = "he_him",
	config = {extra = { mult = 10, extraMult = 5, suit = 'Diamonds', odds = 5, extraMultValue = 0, quantityOfThumbMembers = 0 }},
	unlocked = false,
    blueprint_compat = true,
    eternal_compat = true,
	perishable_compat = true,
    rarity = 3,
    cost = 10,
	atlas = 'ModdedProjectMoonTrue',
    pos = { x = 6, y = 1 },
	attributes = {'mult', 'scaling', 'diamonds', 'chance', 'modify_card'},
    pools =
	{
 		["Thumb"] = true,
 	},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
        return {vars = { card.ability.extra.mult + card.ability.extra.extraMultValue, card.ability.extra.extraMult, 
		localize(card.ability.extra.suit, 'suits_plural'), (G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)


		if context.setting_blind and not context.blueprint then
		card.ability.extra.quantityOfThumbMembers = 0
			for i = 1, #G.jokers.cards do
				for j = 1, #G.P_CENTER_POOLS.Thumb do
					if G.jokers.cards[i] ~= card and (G.P_CENTER_POOLS.Thumb[j].key == G.jokers.cards[i].config.center.key)
					then card.ability.extra.quantityOfThumbMembers = card.ability.extra.quantityOfThumbMembers + 1 end
				end
			end
			card.ability.extra.extraMultValue = card.ability.extra.quantityOfThumbMembers * card.ability.extra.extraMult
		end


		if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
			if pseudorandom('kalo') < G.GAME.probabilities.normal / card.ability.extra.odds then
				local _card = context.other_card
					G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.1,
					func = function()
						_card:juice_up()
						_card:set_ability(G.P_CENTERS['m_wild'])
						return true
					end
				}))
			end
            return {
                mult = card.ability.extra.mult + card.ability.extra.extraMultValue
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_thumb'), G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_greedy_joker" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}