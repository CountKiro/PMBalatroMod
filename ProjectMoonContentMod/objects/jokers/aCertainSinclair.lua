SMODS.Joker {
	key = 'aCertainSinclair',
	name = "A Certain Sinclair",
	pronouns = "he_him",
	config = { extra = { counter = 0, currentPosition = 1 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 10,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 7, y = 6 },
	attributes = {'position', 'retrigger'},
    pools =
	{
		["Sinner"] = true,
 	},
	loc_vars = function(self, info_queue, card)
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
		local cardTriggeredIsToTheLeft = false
		if context.before then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					--print("my_pos is ".. card.ability.extra.currentPosition)
					break
				end
			end
		end

		if context.post_trigger and G.jokers.cards[card.ability.extra.currentPosition-1] then

			if G.jokers.cards[card.ability.extra.currentPosition-1].config.center.key == context.other_card.config.center.key then

				if card.ability.extra.currentPosition > 1 then
						cardTriggeredIsToTheLeft = true
						--print("card to the left detected")
				end

				if cardTriggeredIsToTheLeft == true then
					card.ability.extra.counter = card.ability.extra.counter + 1
					--print(card.ability.extra.counter)
				end
			end
		end


		if context.retrigger_joker_check and #G.jokers.cards > card.ability.extra.currentPosition then
			if context.other_card == G.jokers.cards[card.ability.extra.currentPosition + 1] then
			--print("Testing trigger")
				return {
						repetitions = card.ability.extra.counter
				}
			end
		end

		if context.after then
			card.ability.extra.counter = 0
			--print("test reset")
		end
    end,
	check_for_unlock = function(self, args)
		local callistoOK = false
		local albinaOK = false
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_callisto" then
                if get_joker_win_sticker(v, true) >= 1 then
                    callistoOK = true
                end
            end
			if v.key == "j_pmcmod_albina" then
                if get_joker_win_sticker(v, true) >= 1 then
                    albinaOK = true
                end
            end
        end

		if callistoOK and albinaOK then
			return true
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_abraxas'), G.C.BLACK, G.C.WHITE, 1.2 )
 	end,
}