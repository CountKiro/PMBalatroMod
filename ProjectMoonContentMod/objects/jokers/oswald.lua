SMODS.Joker {
	key = 'oswald',
	name = "Oswald",
	pronouns = "he_him",
	config = { extra = { lastEffect = "None" } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = false,
	rarity = 3,
	cost = 8,
	atlas = 'ModdedProjectMoonTrue',
	pos = { x = 0, y = 0 },
	attributes = {'random'},
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.lastEffect }}
	end,
	update = function (self, card, dt)

	end,
	calculate = function(self, card, context)
		
		if context.joker_main and not context.blueprint then

			local chosenEffect = math.random(1, 18)

			if chosenEffect == 1 then
				card.ability.extra.lastEffect = localize('pmcmod_oswaldEffect1')
				return {
					chips = math.random(1, 100),
				}
			end
			if chosenEffect == 2 then
				card.ability.extra.lastEffect = localize('pmcmod_oswaldEffect2')
				return {
					mult = math.random(1, 100),
				}
			end
			if chosenEffect == 3 then
				card.ability.extra.lastEffect = localize('pmcmod_oswaldEffect3')
				return {
					xmult = math.random(1, 20),
				}
			end
			if chosenEffect == 4 then
				card.ability.extra.lastEffect = localize('pmcmod_oswaldEffect4')
				return {
					xmult = math.random(1, 3),
				}
			end
			if chosenEffect == 5 then
				card.ability.extra.lastEffect = localize('pmcmod_oswaldEffect5')
				return {
					xmult = -1,
				}
			end
			if chosenEffect == 6 then
				card.ability.extra.lastEffect = localize('pmcmod_oswaldEffect6')
				return {
					xmult = math.random(0.5, 1.0),
				}
			end
			if chosenEffect == 7 then
				card.ability.extra.lastEffect = localize('pmcmod_oswaldEffect7')
				return {
					chips = -math.random(1, 100),
				}
			end
			if chosenEffect == 8 then
				card.ability.extra.lastEffect = localize('pmcmod_oswaldEffect8')
				return {
					mult = -math.random(1, 30),
				}
			end
			if chosenEffect == 9 then
				card.ability.extra.lastEffect = localize('pmcmod_oswaldEffect9')
				return {
					dollars = math.random(1, 10)
				}
			end
			if chosenEffect == 10 then
				card.ability.extra.lastEffect = localize('pmcmod_oswaldEffect10')
				return {
					dollars = math.random(10, 50)
				}
			end
			if chosenEffect == 11 then
				card.ability.extra.lastEffect = localize('pmcmod_oswaldEffect11')
				return {
					dollars = -math.random(1, 20)
				}
			end
			if chosenEffect == 12 then
				card.ability.extra.lastEffect = localize('pmcmod_oswaldEffect12')
				return {
					SMODS.add_card {set = 'Joker', key_append = 'oswald', stickers = {"perishable"}, force_stickers = true}
				}
			end
			if chosenEffect == 13 then
				card.ability.extra.lastEffect = localize('pmcmod_oswaldEffect13')
				return {
					SMODS.add_card {set = 'Joker', key_append = 'oswald', stickers = {"rental"}, force_stickers = true}
				}
			end
			if chosenEffect == 14 then
				card.ability.extra.lastEffect = localize('pmcmod_oswaldEffect14')
				return {
					SMODS.add_card {set = 'Joker', key_append = 'oswald', stickers = {"eternal"}, force_stickers = true}
				}
			end
			if chosenEffect == 15 then
				card.ability.extra.lastEffect = localize('pmcmod_oswaldEffect15')
				return {
					SMODS.add_card {set = 'Joker', key_append = 'oswald'}
				}
			end
			if chosenEffect == 16 then
				card.ability.extra.lastEffect = localize('pmcmod_oswaldEffect16')
				return {
					SMODS.add_card {set = 'Tarot', key_append = 'oswald'}
				}
			end
			if chosenEffect == 17 then
				card.ability.extra.lastEffect = localize('pmcmod_oswaldEffect17')
				return {
					SMODS.add_card {set = 'Spectral', key_append = 'oswald'}
				}
			end
			if chosenEffect == 18 then
				card.ability.extra.lastEffect = localize('pmcmod_oswaldEffect18')

				if card.getting_sliced then
					local destructable_jokers = {}
					for i = 1, #G.jokers.cards do
							if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced
							then destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i] end
					end
					local joker_to_destroy = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('oswald')) or nil

					if joker_to_destroy and not (context.blueprint_card or self).getting_sliced then
						joker_to_destroy.getting_sliced = true
						G.E_MANAGER:add_event(Event({func = function()
							card:juice_up(0.8, 0.8)
							joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
						return true end }))
					end
				end
			end
        end
	end,
	in_pool = function(self, args) 

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_circus'), HEX('851734'), HEX('e8e6e3'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_joker" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}