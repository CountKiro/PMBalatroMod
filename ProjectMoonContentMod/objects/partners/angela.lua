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