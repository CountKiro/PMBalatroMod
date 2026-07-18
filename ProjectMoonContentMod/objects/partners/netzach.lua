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