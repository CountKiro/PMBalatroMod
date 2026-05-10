SMODS.Joker {
    key = "benjamin",
	name = "Benjamin",
	pronouns = "he_him",
	config = {extra = {current_timer = 0, total_timer = 0, xmult = 1, xmult_mod = 0.2, consumablesUsed = 0, lastConsumable = "", roundCount = 0, time_limit = 400}},
	unlocked = false,
	perishable_compat = false,
    blueprint_compat = true,
	eternal_compat = false,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 11 },
	attributes = {'tarot', 'spectral', 'xmult', 'scaling', 'timer', 'meltdown', 'gimmick'},
    pools = 
	{
 		["Heretics"] = true,
 	},
    loc_vars = function (self, info_queue, card)
	local main_end = nil
    local random_mult = tostring(math.floor(card.ability.extra.total_timer)) or 1
		main_end = {
			{n=G.UIT.T, config={text = localize('pmcmod_elapsedTime')..":",colour = G.C.MULT, scale = 0.32}},
			{n=G.UIT.O, config={object = DynaText({string = random_mult, colours = {G.C.RED}, pop_in_rate = 9999999, silent = true, pop_delay = 0.2011, scale = 0.32, min_cycle_time = 0})}},
			{n=G.UIT.T, config={text = localize('pmcmod_seconds'),colour = G.C.MULT, scale = 0.32}} or nil,
		}
		info_queue[#info_queue+1] = {set = "Other", key = "effect_meltdown"}
    	return {main_end = main_end, vars = { card.ability.extra.current_timer, card.ability.extra.total_timer, card.ability.extra.xmult + (card.ability.extra.xmult_mod * card.ability.extra.consumablesUsed), card.ability.extra.xmult_mod, card.ability.extra.roundCount, card.ability.extra.time_limit }}
	end,
	update = function (self, card, dt)
			if G.GAME.blind and G.GAME.blind.in_blind then
				card.ability.extra.current_timer = card.ability.extra.current_timer + G.real_dt
			end
	end,
    calculate = function(self, card, context)

		if context.using_consumeable and (context.consumeable.ability.set == "Tarot" or context.consumeable.ability.set == "Spectral") and not context.blueprint then

			card.ability.extra.consumablesUsed = 0
			for k, v in pairs(G.GAME.consumeable_usage) do
				if v.set == 'Tarot' then 
					card.ability.extra.consumablesUsed = card.ability.extra.consumablesUsed + 1 
				end
				if v.set == 'Spectral' then
					card.ability.extra.consumablesUsed = card.ability.extra.consumablesUsed + 1
				end
			end
		end

		if context.after and context.main_eval and not context.blueprint then
			card.ability.extra.total_timer = card.ability.extra.total_timer + card.ability.extra.current_timer
			card.ability.extra.current_timer = 0
		end

		if context.after and context.main_eval and card.ability.extra.total_timer >= card.ability.extra.time_limit and not context.blueprint then
			local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_robotHokma"])
					card:set_eternal(true)
                    return true
                end
            }))
		end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
			card.ability.extra.roundCount = card.ability.extra.roundCount + 1
				if card.ability.extra.roundCount >= 4 then
					local percent = 1.15
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.15,
					func = function()
						card:flip()
						play_sound('card1', percent)
						card:juice_up(0.3, 0.3)
						return true
					end,
				}))

				G.E_MANAGER:add_event(Event({
					delay = 0.5,
					func = function()
						card:set_ability(G.P_CENTERS["j_pmcmod_sephirahHokma"])
						card:set_eternal(true)
						return true
					end
				}))
			end
		end
		if context.joker_main then
			return {
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
				xmult = card.ability.extra.xmult + (card.ability.extra.xmult_mod * card.ability.extra.consumablesUsed)
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_LCorp'), G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_anaglyph') > 6
    end
}