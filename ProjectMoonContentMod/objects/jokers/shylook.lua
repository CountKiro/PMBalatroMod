SMODS.Joker {
	key = 'shylook',
	name = "Today's Shy Look",
	pronouns = "it_its",
	config = { extra = { randomValue = 4, timer = 0, selectedFace = 0, xmult = 1 } },
	no_collection = true,
	eternal_compat = true,
	perishable_compat = false,
	blueprint_compat = false,
	rarity = 3,
	cost = 8,
	atlas = 'ModdedProjectMoon',
	pos = { x = 2, y = 15 },
	attributes = {'random', 'xmult'},
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.randomValue, card.ability.extra.timer }}
	end,
	update = function (self, card, dt)
			if G.GAME.blind and G.GAME.blind.in_blind then
				card.ability.extra.timer = card.ability.extra.timer + G.real_dt
				if card.ability.extra.timer >= 2 then
					local faceTemp = {0, 1, 2, 3, 4}
					card.ability.extra.selectedFace = pseudorandom_element(faceTemp, pseudoseed('shy'))

					if card.ability.extra.selectedFace == 0 then
						card.ability.extra.xmult = 2
					end
					if card.ability.extra.selectedFace == 1 then
						card.ability.extra.xmult = 1.5
					end
					if card.ability.extra.selectedFace == 2 then
						card.ability.extra.xmult = 1
					end
					if card.ability.extra.selectedFace == 3 then
						card.ability.extra.xmult = 0.5
					end
					if card.ability.extra.selectedFace == 4 then
						card.ability.extra.xmult = 0
					end

					card.children.center:set_sprite_pos({x = card.ability.extra.selectedFace , y = 15})
					card.ability.extra.timer = 0
				end
			end
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				Xmult_mod = card.ability.extra.xmult,
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
			}
		end
	end,
	in_pool = function(self, args) -- equivalent to `yes_pool_flag = 'vremade_gros_michel_extinct'`
        return G.GAME.pool_flags.fake_shy_look_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_abnormality'), G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end
}