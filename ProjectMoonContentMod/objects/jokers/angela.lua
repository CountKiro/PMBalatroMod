SMODS.Joker {
    key = "angela",
	name = "Angela",
	pronouns = "she_her",
	config = {extra = {current_day = 1, resetCounter = 0}},
	unlocked = false,
	eternal_compat = true,
	perishable_compat = false,
    blueprint_compat = false,
    rarity = 3,
    cost = 10,
	atlas = 'ModdedProjectMoon',
    pos = { x = 0, y = 0 },
	attributes = {'ante_reset'},
    pools =
	{
 		["Heretics"] = true,
 	},
    set_ability = function(self, card, initial, delay_sprites) card:set_eternal(true) end,
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.current_day } }
    end,
    calculate = function(self, card, context)
		if G.shop then
			card.ability.extra.current_day = G.GAME.round_resets.ante
		end

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then

			
			local necessary_blind_reset = G.GAME.round_resets.ante

			if G.GAME.round_resets.ante >= 6 then
				local counter = 0
        		ease_ante(-necessary_blind_reset)
        		G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
        		G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - necessary_blind_reset

				G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 3

				for i=1, #G.jokers.cards do
					if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.rental then
						local currentKeypage = G.jokers.cards[i]
						currentKeypage:add_sticker('eternal',true)
						counter = counter + 1
						card.ability.extra.resetCounter = card.ability.extra.resetCounter + 1
					end
				end

				if counter >= 1 then
					G.jokers:change_size(counter)
				end

				if card.ability.extra.resetCounter >= 3 then
					card:remove_sticker('eternal')
				end

			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_LCorp'), G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_anaglyph') > 7
    end
}