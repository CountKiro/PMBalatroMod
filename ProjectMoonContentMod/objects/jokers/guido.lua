SMODS.Joker {
    key = "guido",
	name = "Guido",
	pronouns = "he_him",
	config = { extra = { mult = 3 }},
	unlocked = false,
    eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
    rarity = 2,
    cost = 6,
    atlas = 'ModdedProjectMoon',
    pos = { x = 9, y = 2 },
	attributes = {'mult', 'scaling', 'seals'},
    pools =
	{
        ["NCorp"] = true,
 	},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.red_seal

        local red_seal_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card.seal == "Red" then red_seal_tally = red_seal_tally + 1 end
            end
        end
        return { vars = { card.ability.extra.mult, card.ability.extra.mult * red_seal_tally } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local red_seal_tally = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card.seal == "Red" then red_seal_tally = red_seal_tally + 1 end
            end
            return {
                mult = card.ability.extra.mult * red_seal_tally
            }
        end
		if context.first_hand_drawn and not context.blueprint then
            local _card = create_playing_card({
                front = pseudorandom_element(G.P_CARDS, pseudoseed('guido')),
                center = G.P_CENTERS.c_base
            }, G.discard, true, nil, { G.C.SECONDARY_SET.Enhanced }, true)
            _card:set_seal('Red', true)
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.hand:emplace(_card)
                            _card:start_materialize()
                            G.GAME.blind:debuff_card(_card)
                            G.hand:sort()
                            if context.blueprint_card then
                                context.blueprint_card:juice_up()
                            else
                                card:juice_up()
                            end
                            return true
                        end
                    }))
                    SMODS.calculate_context({ playing_card_added = true, cards = { _card } })
                end
            }
        end
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if playing_card.seal == "Red" then
                return true
            end
        end
        return false
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_NCorpInquisition'), G.C.RED, G.C.WHITE, 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_erratic') > 1
    end
	
}