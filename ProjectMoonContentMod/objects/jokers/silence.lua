SMODS.Joker {
	key = 'silence',
	name = "Time Flowing",
	pronouns = "it_its",
	config = { extra = { current_timer = 0, total_timer = 30 } },
	no_collection = true,
	eternal_compat = true,
	perishable_compat = false,
	blueprint_compat = false,
	rarity = 3,
	cost = 8,
	atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 15 },
	attributes = {'timer', 'game_over'},
	loc_vars = function (self, info_queue, card)
	local main_end = nil
    local random_mult = tostring(math.floor(card.ability.extra.current_timer)) or 1
		main_end = {
			{n=G.UIT.T, config={text = localize('pmcmod_elapsedTime')..":",colour = G.C.MULT, scale = 0.32}},
			{n=G.UIT.O, config={object = DynaText({string = random_mult, colours = {G.C.RED}, pop_in_rate = 9999999, silent = true, pop_delay = 0.2011, scale = 0.32, min_cycle_time = 0})}},
			{n=G.UIT.T, config={text = localize('pmcmod_seconds'),colour = G.C.MULT, scale = 0.32}} or nil,
		}
    	return {main_end = main_end, vars = { card.ability.extra.current_timer, card.ability.extra.total_timer }}
	end,
	update = function (self, card, dt)
			if G.GAME.blind and G.GAME.blind.in_blind then
				card.ability.extra.current_timer = card.ability.extra.current_timer + G.real_dt
				--print("Increment test")
				--card.children.center:set_sprite_pos({x = card.ability.extra.current_timer , y = 1})
			end

			if card.ability.extra.current_timer < 7 then
				card.children.center:set_sprite_pos({x = 5 , y = 15})
			end

			if card.ability.extra.current_timer >= 7 and card.ability.extra.current_timer < 14 then
				card.children.center:set_sprite_pos({x = 6 , y = 15})
			end

			if card.ability.extra.current_timer >= 14 and card.ability.extra.current_timer < 21 then
				card.children.center:set_sprite_pos({x = 7 , y = 15})
			end

			if card.ability.extra.current_timer >= 21 and card.ability.extra.current_timer < 29 then
				card.children.center:set_sprite_pos({x = 8 , y = 15})
			end

			if card.ability.extra.current_timer >= 29 and card.ability.extra.current_timer <= 30 then
				card.children.center:set_sprite_pos({x = 9 , y = 15})
			end
			
			if G.shop or not G.GAME.blind.in_blind then
				card.ability.extra.current_timer = 0
			end
			if G.GAME.blind and G.GAME.blind.in_blind and card.ability.extra.current_timer >= card.ability.extra.total_timer then
				card.ability.extra.current_timer = 0
				G.E_MANAGER:add_event(Event({
                func = function()
                    G.STATE = G.STATES.GAME_OVER
                    G.STATE_COMPLETE = false
--                    print("[DEBUG] game over triggered")
                    return true
                end
            }))
				
			end
	end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_silent_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_abnormality'), G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end
}