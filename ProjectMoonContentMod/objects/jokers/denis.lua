SMODS.Joker {
    key = "denis",
	name = "Denis",
	pronouns = "he_him",
	config = {extra = { mult = 5, extraMult = 1, suit = 'Spades' }},
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
	atlas = 'ModdedProjectMoonTrue',
    pos = { x = 8, y = 1 },
	attributes = {'mult', 'spades'},
    pools =
	{
 		["Thumb"] = true,
 	},
    loc_vars = function(self, info_queue, card)
		local wildCardsTally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_wild') then wildCardsTally = wildCardsTally + 1 end
            end
        end
		info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
        return {vars = { card.ability.extra.extraMult, card.ability.extra.mult + card.ability.extra.extraMult * wildCardsTally, localize(card.ability.extra.suit, 'suits_plural') } }
    end,
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
			local wildCardsTally = 0
			for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_wild') then wildCardsTally = wildCardsTally + 1 end
            end
            return {
                mult = card.ability.extra.mult + card.ability.extra.extraMult * wildCardsTally
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_thumb'), G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_wrathful_joker" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}