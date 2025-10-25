SMODS.Atlas {
    key = 'projectMoonPartnersDante',
    path = "modCompat/projectMoonPartnersDante.png",
    px = 46,
    py = 58,
}

SMODS.Atlas {
    key = 'projectMoonPartnersNetz',
    path = "modCompat/projectMoonPartnersNetz.png",
    px = 46,
    py = 58,
}

SMODS.Atlas {
    key = 'projectMoonPartnersRoland',
    path = "modCompat/projectMoonPartnersRoland.png",
    px = 46,
    py = 58,
}

SMODS.Atlas {
    key = 'projectMoonPartnersAngela',
    path = "modCompat/projectMoonPartnersAngela.png",
    px = 46,
    py = 58,
}

-- Dante
Partner_API.Partner{
    key = "dante",
    unlocked = false,
    discovered = true,
    pos = {x = 0, y = 0},
    individual_quips = true,
    atlas = "projectMoonPartnersDante",
    config = {extra = {mult = 1, mult_mod = 1, timer = 0, counter = 0}},
    link_config = {j_ride_the_bus = 1},
    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local benefits = 1
        if link_level == 1 then benefits = 2 end
        return { vars = {card.ability.extra.mult, card.ability.extra.mult_mod*benefits} }
    end,
    update = function (self, card, context)
				self.config.extra.timer = self.config.extra.timer + G.real_dt
				if self.config.extra.timer >= 0.2 then
					--self.config.extra.selectedFace = pseudorandom_element(faceTemp, pseudoseed('netz'))
                    if self.config.extra.counter < 2  then
                        card.children.center:set_sprite_pos({x = 0 , y = 0})
                        self.config.extra.counter = self.config.extra.counter + 1
                    end	
                    if self.config.extra.counter >= 2 and self.config.extra.counter < 4  then
                        card.children.center:set_sprite_pos({x = 1 , y = 0})
                        self.config.extra.counter = self.config.extra.counter + 1
                    end	
                    if self.config.extra.counter >= 4 and self.config.extra.counter < 6  then
                        card.children.center:set_sprite_pos({x = 2 , y = 0})
                        self.config.extra.counter = self.config.extra.counter + 1
                    end	
                    if self.config.extra.counter >= 6 and self.config.extra.counter < 8  then
                        card.children.center:set_sprite_pos({x = 3 , y = 0})
                        self.config.extra.counter = self.config.extra.counter + 1
                    end	
                    if self.config.extra.counter >= 8  then
                        card.children.center:set_sprite_pos({x = 4 , y = 0})
                        self.config.extra.counter = 0
                    end

					self.config.extra.timer = 0
				end			
	end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                message = localize{type = "variable", key = "a_mult", vars = {card.ability.extra.mult}},
                mult_mod = card.ability.extra.mult,
                colour = G.C.MULT
            }
        end
        if context.before and not context.blueprint then
            local link_level = self:get_link_level()
            local benefits = 1
            if link_level == 1 then benefits = 2 end
            local faces = false
            for _, playing_card in ipairs(context.scoring_hand) do
                if playing_card:is_face() then
                    faces = true
                    break
                end
            end
            if faces then
                local last_mult = card.ability.extra.mult
                card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_mod
                if last_mult > 0 then
                    return {
                        message = localize { type = 'variable', key = 'a_mult_minus', vars = { card.ability.extra.discard_sub } },
                        colour = G.C.RED
                    }
                end
            else
                -- See note about SMODS Scaling Manipulation on the wiki
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod*benefits
                card_eval_status_text(card, "extra", nil, nil, nil, {message = localize("k_upgrade_ex"), colour = G.C.MULT})
            end
        end
    end,
    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_ride_the_bus" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end,
}

-- Roland
Partner_API.Partner{
    key = "roland",
    unlocked = false,
    discovered = true,
    pos = {x = 0, y = 0},
    individual_quips = true,
    atlas = "projectMoonPartnersRoland",
    config = {extra = {joker_slots = 1, effectApplied = 0, timer = 0, counter = 0, gloveCounter = 0, breathCounter = 0}},
    link_config = {j_stencil = 1},
    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local benefits = 1
        if link_level == 1 then benefits = 2 end
        return { vars = {card.ability.extra.joker_slots, card.ability.extra.joker_slots*benefits} }
    end,
    update = function (self, card, context)
				self.config.extra.timer = self.config.extra.timer + G.real_dt

				if self.config.extra.timer >= 0.2 then
                    if self.config.extra.counter < 20 and self.config.extra.gloveCounter < 5  then
                        card.children.center:set_sprite_pos({x = 0 , y = 0})
                        self.config.extra.counter = self.config.extra.counter + 1
                    end	
					if self.config.extra.counter >= 20 and self.config.extra.gloveCounter < 5 then
                        card.children.center:set_sprite_pos({x = 1 , y = 0})
                        self.config.extra.counter = 0
                        self.config.extra.gloveCounter = self.config.extra.gloveCounter + 1
					end

                    if self.config.extra.counter <3 and self.config.extra.gloveCounter >= 5 and self.config.extra.breathCounter < 3 then
                        card.children.center:set_sprite_pos({x = 1 , y = 1})
                        self.config.extra.counter = self.config.extra.counter + 1
                    end

                    if self.config.extra.counter <10 and self.config.extra.gloveCounter >= 5 and self.config.extra.breathCounter < 3 then
                        card.children.center:set_sprite_pos({x = 2 , y = 0})
                        self.config.extra.counter = self.config.extra.counter + 1
                    end
                    if self.config.extra.counter >=10 and self.config.extra.gloveCounter >= 5 and self.config.extra.breathCounter < 3 then
                        card.children.center:set_sprite_pos({x = 3 , y = 0})
                        self.config.extra.counter = 3
                        self.config.extra.breathCounter = self.config.extra.breathCounter + 1
                    end

                    if self.config.extra.counter < 8 and self.config.extra.gloveCounter >= 5 and self.config.extra.breathCounter >= 3 then
                        self.config.extra.counter = self.config.extra.counter + 1
                        card.children.center:set_sprite_pos({x = 4 , y = 0})
                    end

                    if self.config.extra.counter >= 8 and self.config.extra.gloveCounter >= 5 and self.config.extra.breathCounter >= 3 then
                        self.config.extra.counter = self.config.extra.counter + 1
                        card.children.center:set_sprite_pos({x = 0 , y = 1})
                    end

                    if self.config.extra.counter >= 15 and self.config.extra.gloveCounter >= 5 and self.config.extra.breathCounter >= 3 then
                        card.children.center:set_sprite_pos({x = 1 , y = 0})
                        self.config.extra.counter = 0
                        self.config.extra.breathCounter = 0
                        self.config.extra.gloveCounter = 0
                    end

					self.config.extra.timer = 0
				end
	end,
    calculate_begin = function(self, card)
        if G.jokers then G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots end
    end,
    calculate = function(self, card, context)
        local link_level = self:get_link_level()
        local effectApplied
        if link_level == 1 and card.ability.extra.effectApplied == 0 then
            if G.jokers then 
                G.jokers.config.card_limit = G.jokers.config.card_limit + 1 
                card.ability.extra.effectApplied = 1
            end
        end
        if link_level == 0 and card.ability.extra.effectApplied == 1 then
            if G.jokers then 
                G.jokers.config.card_limit = G.jokers.config.card_limit - 1
                card.ability.extra.effectApplied = 0
            end
        end
    end,
    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_stencil" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end,
}

-- Angela
Partner_API.Partner{
    key = "angela",
    unlocked = false,
    discovered = true,
    pos = {x = 0, y = 0},
    individual_quips = true,
    atlas = "projectMoonPartnersAngela",
    config = {extra = {creates = 1, timer = 0, smileCounter = 0, counter = 0}},
    link_config = {j_riff_raff = 1},
    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local benefits = 1
        if link_level == 1 then benefits = 2 end
        return { vars = {card.ability.extra.creates} }
    end,
    update = function (self, card, context)
        self.config.extra.timer = self.config.extra.timer + G.real_dt

				if self.config.extra.timer >= 0.2 then
                    if self.config.extra.counter < 20 and self.config.extra.smileCounter < 5  then
                        card.children.center:set_sprite_pos({x = 0 , y = 0})
                        self.config.extra.counter = self.config.extra.counter + 1
                    end	
					if self.config.extra.counter >= 20 and self.config.extra.smileCounter < 5 then
                        card.children.center:set_sprite_pos({x = 1 , y = 0})
                        self.config.extra.counter = 0
                        self.config.extra.smileCounter = self.config.extra.smileCounter + 1
					end

                    if self.config.extra.counter < 3 and self.config.extra.smileCounter >= 5 then
                        
                        card.children.center:set_sprite_pos({x = 1 , y = 0})
                        self.config.extra.counter = self.config.extra.counter + 1

                    end

                    if self.config.extra.counter >=3 and self.config.extra.counter <=19 and self.config.extra.smileCounter >= 5 then
                        
                        card.children.center:set_sprite_pos({x = 2 , y = 0})
                        self.config.extra.counter = self.config.extra.counter + 1

                    end

                    if self.config.extra.counter >=20 and self.config.extra.counter <=29 and self.config.extra.smileCounter >= 5 then
                        
                        card.children.center:set_sprite_pos({x = 3 , y = 0})
                        self.config.extra.counter = self.config.extra.counter + 1

                    end

                    if self.config.extra.counter >= 30 and self.config.extra.smileCounter >= 5 then
                        card.children.center:set_sprite_pos({x = 1 , y = 0})
                        self.config.extra.counter = 0
                        self.config.extra.smileCounter = 0
                    end

					self.config.extra.timer = 0
				end
	end,
    calculate = function(self, card, context)
        local link_level = self:get_link_level()
        local benefits = 1
        if link_level == 1 then benefits = 2 end

        if context.setting_blind and G.GAME.last_blind and G.GAME.last_blind.boss and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            local jokers_to_create = math.min(card.ability.extra.creates*benefits,
                G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
            G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
            G.E_MANAGER:add_event(Event({
                func = function()
                    for _ = 1, jokers_to_create do
                        SMODS.add_card {set = 'Joker', rarity = 'Common', key_append = 'angela'}
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
    end,
}

-- Netzach
Partner_API.Partner{
    key = "netzach",
    unlocked = false,
    discovered = true,
    pos = {x = 0, y = 0},
    individual_quips = true,
    no_quips = false,
    atlas = "projectMoonPartnersNetz",
    config = {extra = {dollars = 2, timer = 0, counter = 0}},
    link_config = {j_satellite = 1},
    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local benefits = 1
        if link_level == 1 then benefits = 2 end
        return { vars = {card.ability.extra.dollars, card.ability.extra.dollars*benefits} }
    end,
    update = function (self, card, context)
				self.config.extra.timer = self.config.extra.timer + G.real_dt
				if self.config.extra.timer >= 0.2 then
					--self.config.extra.selectedFace = pseudorandom_element(faceTemp, pseudoseed('netz'))
                    if G.GAME.round <= 8 and self.config.extra.counter < 20  then
                        card.children.center:set_sprite_pos({x = 0 , y = 0})
                        self.config.extra.counter = self.config.extra.counter + 1
                    end	
					if G.GAME.round <= 8 and self.config.extra.counter >= 20 then
                        card.children.center:set_sprite_pos({x = 1 , y = 0})
                        self.config.extra.counter = 0
					end
                    if G.GAME.round > 8 and self.config.extra.counter < 20  then
                        card.children.center:set_sprite_pos({x = 3 , y = 0})
                        self.config.extra.counter = self.config.extra.counter + 1
                    end	
					if G.GAME.round > 8 and self.config.extra.counter >= 20 then
                        card.children.center:set_sprite_pos({x = 4 , y = 0})
                        self.config.extra.counter = 0
					end
					self.config.extra.timer = 0
				end
	end,
    calculate = function(self, card, context)
        local link_level = self:get_link_level()

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then        
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            set = 'Planet',
                            key_append = 'netzParner'
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = localize('k_plus_planet'),
                    colour = G.C.SECONDARY_SET.Planet,
                    remove = true
                }
            end
            if link_level == 1 then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then        
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            SMODS.add_card {
                                set = 'Planet',
                                key_append = 'netzParner'
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end)
                    }))
                    return {
                        message = localize('k_plus_planet'),
                        colour = G.C.SECONDARY_SET.Planet,
                        remove = true
                    }
                end
            end
        end
    end,
    calculate_cash  = function(self, card)
            
    end,
    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_satellite" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end,
}