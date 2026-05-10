SMODS.Joker {
	key = 'angelaLoR',
	name = "Angela",
	pronouns = "she_her",
	config = { extra = { creates = 5, chips = 0, chips_mod = 15} },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,	
    blueprint_compat = false,
	rarity = 3,
	cost = 8,
	atlas = 'ModdedProjectMoonTrue',
	pos = { x = 1, y = 12 },
	attributes = {'chips', 'scaling', 'summoning'},
	loc_vars = function (self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "perishable", set = "Other", vars = { G.GAME.perishable_rounds, G.GAME.perishable_rounds } }
    	return {vars = { card.ability.extra.creates, card.ability.extra.chips, card.ability.extra.chips_mod}}
	end,
	update = function (self, card, dt)

	end,
	calculate = function(self, card, context)
		if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit and not context.blueprint then
            local jokers_to_create = math.min(card.ability.extra.creates,
                G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
            G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
            G.E_MANAGER:add_event(Event({
                func = function()
                    for _ = 1, jokers_to_create do
                        SMODS.add_card {
                            set = 'Joker',
                            key_append = 'vremade_riff_raff',
							stickers = {"perishable"},
							force_stickers = true
                        }
                        G.GAME.joker_buffer = 0
                    end
                    return true
                end
            }))
            return {
                message = localize('k_plus_joker'),
                colour = G.C.BLUE,
            }
        end
		if G.shop and not card.getting_sliced then
--			print("Testing angela entering shop perished")
			local destructable_jokers  = {}
			for i=1, #G.jokers.cards do
--				print("Testing angela entered for loop 1")
				if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced then
--					print("Testing angela condition 1 for loop 1")
					if G.jokers.cards[i].ability.perish_tally then
--						print("Testing angela condition 2 for loop 1")
						if G.jokers.cards[i].ability.perish_tally == 0 then
							destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i]
--							print("Testing angela counting perished")
						end
					end
				end
			end
			for i=1, #destructable_jokers do
--				print("Testing angela condition 2")
				if destructable_jokers[i] and not (context.blueprint_card or self).getting_sliced then
					card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
                    destructable_jokers[i].getting_sliced = true
--					print("Testing angela destroying perished")
                    G.E_MANAGER:add_event(Event({func = function()
                        card:juice_up(0.8, 0.8)
                        destructable_jokers[i]:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
                end
			end
		end
		if context.joker_main then
			return
			{
				chips = card.ability.extra.chips
			}
		end
	end,
	in_pool = function(self, args) 

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_library'), HEX('998350'), HEX('0cf07e'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_riff_raff" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}