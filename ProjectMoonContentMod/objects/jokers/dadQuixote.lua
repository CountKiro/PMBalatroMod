SMODS.Joker {
	key = 'dadQuixote',
	name = "Don Quixote",
	pronouns = "he_him",
	config = { extra = { mult = 0 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 3, y = 6 },
	attributes = {'mult', 'perma_bonus'},
    pools =
	{
        ["Bloodfiends"] = true,
 	},
	loc_vars = function (self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_perma"}
    	return {vars = { card.ability.extra.mult }}
	end,
	calculate = function(self, card, context)
		
		local accumulatedMult = 0

		if G.playing_cards then
			for _, playing_card in ipairs(G.playing_cards) do
				accumulatedMult = accumulatedMult + playing_card.ability.perma_mult
			end
		end

		card.ability.extra.mult = accumulatedMult

		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_lamanchaland'), HEX('400a18'), HEX('c7285f'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_seeing_double" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}