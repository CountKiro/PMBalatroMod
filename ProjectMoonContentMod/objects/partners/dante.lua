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