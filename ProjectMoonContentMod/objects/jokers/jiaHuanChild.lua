SMODS.Joker {
	key = 'jiaHuanChild',
	name = "Jia Huan (Child)",
	pronouns = "he_him",
	config = { extra = { } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = false,
	rarity = 1,
	cost = 2,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 7, y = 3 },
	attributes = {'transform', 'economy'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
		if context.selling_self and not context.blueprint then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                        SMODS.add_card {
                            set = 'Joker',
                            key_append = 'jiaHuan',
                            rarity = 'Uncommon',
                        }
                        G.GAME.joker_buffer = 0
                    return true
                end
            }))
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_jiaFamily'), HEX("b02121"), HEX('140e0e'), 1.2 )
 	end,
}