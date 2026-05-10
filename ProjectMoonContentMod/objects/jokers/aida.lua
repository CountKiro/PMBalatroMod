SMODS.Joker {
	key = 'aida',
	name = "Aida",
	pronouns = "she_her",
    config = { chipsValue1 = 1000, chipsValue2 = 100, chipsValue3 = 10, chipsValue4 = 1, chipsValue5 = -10, chipsValue6 = -100 },
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 6, y = 2 },
	attributes = {'chips', 'random'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.chipsValue1, card.ability.chipsValue2, card.ability.chipsValue3, card.ability.chipsValue4, card.ability.chipsValue5, card.ability.chipsValue6 } }
	end,
	calculate = function(self, card, context)
		local choosenValue = math.random(0, 5)

		if context.joker_main then
			if choosenValue == 5 then
			
				return {
					chips = card.ability.chipsValue1,
				}
			end
			if choosenValue == 4 then
			
				return {
					chips = card.ability.chipsValue2,
				}
			end
			if choosenValue == 3 then
			
				return {
					chips = card.ability.chipsValue3,
				}
			end
			if choosenValue == 2 then
			
				return {
					chips = card.ability.chipsValue4,
				}
			end
			if choosenValue == 1 then
				return {
					chips = card.ability.chipsValue5,
				}
			end
			if choosenValue == 0 then
				return {
					chips = card.ability.chipsValue6,
				}
			end
		end

	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_mariachis'), G.C.YELLOW, G.C.GREEN, 1.2 )
 	end
}