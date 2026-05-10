SMODS.Joker {
    key = "santata",
	name = "Santata",
	pronouns = "it_its",
	config = {},
    unlocked = false,
    blueprint_compat = false,
	perishable_compat = true,
	eternal_compat = true,
    rarity = 3,
    cost = 10,
	atlas = 'ModdedProjectMoon',
    pos = { x = 4, y = 7 },
	attributes = {'voucher'},
    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end,
	check_for_unlock = function(self, args)
        return (args.type == 'continue_game') and (os.date("%m/%d") == "12/25")
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_santata'), HEX('6e0920'), HEX('12c424'), 1.2 )
 	end
}