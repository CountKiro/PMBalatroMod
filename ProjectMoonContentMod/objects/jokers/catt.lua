SMODS.Joker {
	key = 'catt',
	name = "Catt",
	pronouns = "they_them",
	config = { extra = {exhausted = false, rarity = 2, rarityName = "Hardcover"} },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = false,
	rarity = 3,
	cost = 12,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 4, y = 2 },
	attributes = {'selling_card', 'blind'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		if card.ability.extra.rarity == 2 then
			card.ability.extra.rarityName = localize('k_uncommon')
		elseif card.ability.extra.rarity == 3 then
			card.ability.extra.rarityName = localize('k_rare')
		else
			card.ability.extra.rarityName = localize('k_legendary')
		end

        return {vars = { card.ability.extra.rarityName, card.ability.extra.exhausted } }
	end,
	calculate = function(self, card, context)

		if context.end_of_round and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss then
				card.ability.extra.exhausted = false
		end

		if context.end_of_round and context.game_over and context.main_eval and card.ability.extra.exhausted == false then
			local destructable_jokers = {}
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal and G.jokers.cards[i].config.center.rarity == card.ability.extra.rarity then
					destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i]
				end
			end
			local joker_to_destroy = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('catt')) or nil
			if joker_to_destroy then
				card.ability.extra.exhausted = true
				if card.ability.extra.rarity <= 3 then
					card.ability.extra.rarity = card.ability.extra.rarity + 1
				end
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand_text_area.blind_chips:juice_up()
                        G.hand_text_area.game_chips:juice_up()
                        play_sound('tarot1')
                        joker_to_destroy:start_dissolve()
                        return true
                    end
                }))
                return {
                    message = localize('k_saved_ex'),
                    saved = 'pmcmod_ph_catt', --kiro -- check this later
                    colour = G.C.RED
                }
			end
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_LCorp'), G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_mr_bones" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}