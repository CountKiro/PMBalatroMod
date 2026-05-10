SMODS.Joker {
	key = 'paula',
	name = "Paula",
	pronouns = "she_her",
	config = { extra = { currentScale = 0} },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 6 },
	attributes = {},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
		
    end,
	add_to_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.scaling and G.GAME.modifiers.scaling >= 2 then
			card.ability.extra.currentScale = G.GAME.modifiers.scaling
			G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) - 1
		end
    end,
    remove_from_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.scaling and G.GAME.modifiers.scaling >= 1 then
            G.GAME.modifiers.scaling = card.ability.extra.currentScale
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_zwei'), HEX('23306e'), HEX('ab851d'), 1.2 )
 	end,
}