SMODS.Joker {
	key = 'wangDawei',
	name = "Wang Dawei",
	pronouns = "he_him",
	config = { extra = { counter = 0, permaMult_mod = 7, permaChips_mod = 15 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 0, y = 4 },
	attributes = {'perma_bonus', 'chips', 'mult'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_perma"}
        return {vars = { 8 - card.ability.extra.counter, card.ability.extra.permaMult_mod, card.ability.extra.permaChips_mod } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
            card.ability.extra.counter = card.ability.extra.counter + 1
			if card.ability.extra.counter >= 8 then
				context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) + card.ability.extra.permaMult_mod
				context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +  card.ability.extra.permaChips_mod
				card.ability.extra.counter = 0
				local cardToJuiceUp = context.other_card
				G.E_MANAGER:add_event(Event({
					func = function()
						cardToJuiceUp:juice_up()
						return true
					end
				}))
			end
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_wangFamily'), HEX("525252"), HEX('c2c2c2'), 1.2 )
 	end,
}