SMODS.Joker {
	key = 'censored',
	name = "[CENSORED]",
	pronouns = "it_its",
	config = { extra = {} },
	no_collection = true,    
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 8, y = 14 },
	attributes = {'obfuscation', 'gimmick'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,
	calculate = function(self, card, context)


    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}