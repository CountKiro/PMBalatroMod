SMODS.Joker {
	key = 'shiHuazhen',
	name = "Shi Huazhen",
	pronouns = "he_him",
	config = { extra = {mult_mod = 1 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 4, y = 4 },
	attributes = {'mult', 'scaling', 'joker'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.mult_mod } }
	end,
	calculate = function(self, card, context)
		local my_pos = nil
		if context.joker_main then
			for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
			if my_pos >= 2 then
				return {
					--print(string.len(localize{type="name_text", set="Joker", key = G.jokers.cards[my_pos-1].config.center.key} or "")),
					mult = card.ability.extra.mult_mod * (string.len((localize{type="name_text", set="Joker", key = G.jokers.cards[my_pos-1].config.center.key} or "") or 0))
				}
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_shiFamily'), HEX("8a753f"), HEX('2e4a37'), 1.2 )
 	end,
}