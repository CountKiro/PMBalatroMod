SMODS.Joker {
	key = 'queequeg',
	name = "Queequeg",
	pronouns = "she_her",
	config = { extra = { dollars = 3} },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 3 },
	attributes = {'economy', 'pallid'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pmcmod_pallid
		local pallid_card_tally = 0
		if G.playing_cards then
			for _, playing_card in ipairs(G.playing_cards) do
				if SMODS.has_enhancement(playing_card, 'm_pmcmod_pallid') then pallid_card_tally = pallid_card_tally + 1 end
			end
		end

		if pallid_card_tally >= 5 then
			tempKey = self.key..'_alt'
			card.children.center:set_sprite_pos({x = 2 , y = 10})
		else 
			tempKey = self.key
			card.children.center:set_sprite_pos({x = 9 , y = 3})
		end
		return { vars = { card.ability.extra.dollars, key = tempKey  } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_pmcmod_pallid') then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
    end,
	in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_pmcmod_pallid') then
                return true
            end
        end
        return false
    end,
	get_weight = function(self, weight)
		local pallid_card_tally = 0
		if G.GAME.blind then
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if SMODS.has_enhancement(playing_card, 'm_pmcmod_pallid') then pallid_card_tally = pallid_card_tally + 1 end
				end
			end
		end
    	return weight*(2^(pallid_card_tally + 1))
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_pequod'), HEX('c9c9c9'), HEX('c20a0a'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_ahab" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}