SMODS.Joker {
	key = 'ahab',
	name = "Ahab",
	pronouns = "she_her",
	config = { extra = { xmult = 1, xmult_mod = 0.05} },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 3 },
	attributes = {'xmult', 'scaling', 'pallid', 'spectral'},
    pools =
	{
		["Heretics"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		local pallid_card_tally = 0
		if G.playing_cards then
			for _, playing_card in ipairs(G.playing_cards) do
				if SMODS.has_enhancement(playing_card, 'm_pmcmod_pallid') then pallid_card_tally = pallid_card_tally + 1 end
			end
		end

		if pallid_card_tally >= 5 then
			tempKey = self.key..'_alt'
			card.children.center:set_sprite_pos({x = 1 , y = 10})
		else 
			tempKey = self.key
			card.children.center:set_sprite_pos({x = 8 , y = 3})
		end
		
		info_queue[#info_queue + 1] = G.P_CENTERS.c_pmcmod_hunt

        local pallid_card_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_pmcmod_pallid') then pallid_card_tally = pallid_card_tally + 1 end
            end
        end
        return { vars = { card.ability.extra.xmult_mod, 1 + (card.ability.extra.xmult_mod * pallid_card_tally), key = tempKey } }
    end,
    calculate = function(self, card, context)
		if context.setting_blind and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card {
                                set = 'Spectral',
								key = "c_pmcmod_hunt",
                                key_append = 'hunt'
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = localize('k_plus_spectral'), colour = G.C.PURPLE },
                        context.blueprint_card or card)
                    return true
                end)
            }))
            return nil, true
        end

        if context.joker_main then
            local pallid_card_tally = 0
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if SMODS.has_enhancement(playing_card, 'm_pmcmod_pallid') then pallid_card_tally = pallid_card_tally + 1 end
				end
			end
            return {
                Xmult = 1 + (card.ability.extra.xmult_mod * pallid_card_tally),
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_newLeagueOfNine'), HEX('242b45'), HEX('d5001e'), 1.2 )
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
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_midas_mask" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}