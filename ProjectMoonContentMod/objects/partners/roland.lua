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