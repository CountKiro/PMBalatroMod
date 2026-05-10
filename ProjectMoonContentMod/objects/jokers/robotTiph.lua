SMODS.Joker {
    key = "robotTiph",
	name = "Tiph A (Robot)",
	pronouns = "she_her",
	config = {extra = {enochDeathCounter = 0, aceMult = 5, aceMult_mod = 3, aceChip = -10}},
	eternal_compat = false,
	perishable_compat = false,
    blueprint_compat = true,
	--no_collection = true,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 12 },
	attributes = {'mult', 'ace', 'chips', 'scaling'},
    pools = 
	{
 		["Heretics"] = true,
 	},
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.enochDeathCounter, card.ability.extra.aceMult, card.ability.extra.aceMult_mod, card.ability.extra.aceChip } }
    end,

    calculate = function(self, card, context)
		if context.setting_blind then
		local robotEnochPresent = false

			for i=1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.key == "j_pmcmod_robotEnoch" then
					robotEnochPresent = true
					break
				end
			end
		
			if G.jokers and robotEnochPresent == false and card.ability.extra.enochDeathCounter >= 1 then
				SMODS.add_card({ key = "j_pmcmod_robotEnoch" })
			end
			
		end
		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_robotEnoch" then
--			print("Testing destruction")
			card.ability.extra.enochDeathCounter = card.ability.extra.enochDeathCounter + 1
			card.ability.extra.aceMult = card.ability.extra.aceMult + card.ability.extra.aceMult_mod
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
				message_card = card
			}
		end
		if context.individual and context.cardarea == G.play and
            context.other_card:get_id() == 14 then
            return {
                mult = card.ability.extra.aceMult,
				chips = card.ability.extra.aceChip
            }
        end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_LCorp'), G.C.RED, HEX('f2e396'), 1.2 )
 	end
}