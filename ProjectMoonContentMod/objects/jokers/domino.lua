SMODS.Joker {
    key = "domino",
	name = "Domino",
	pronouns = "he_him",
	config = { extra = { baseChance = 1, maxChance = 1 } },
    unlocked = true,
	eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    rarity = 2,
    cost = 6,
	atlas = 'ModdedProjectMoon',
    pos = { x = 6, y = 7 },
	attributes = {'tag', 'economy'},
	loc_vars = function(self, info_queue, card)
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'dominoChance')
		info_queue[#info_queue + 1] = { key = 'tag_coupon', set = 'Tag' }
		return { vars = { localize { type = 'name_text', set = 'Tag', key = 'tag_coupon' } , new_numerator, new_denominator } }
	end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
			if SMODS.pseudorandom_probability(card, 'domino', card.ability.extra.baseChance, card.ability.extra.maxChance, 'dominoChance') then
				G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_coupon'))
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end)
            }))
            return nil, true -- This is for Joker retrigger purposes
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_cloud'), HEX('594237'), HEX('c4bfbc'), 1.2 )
 	end
}