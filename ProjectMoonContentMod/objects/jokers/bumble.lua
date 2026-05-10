SMODS.Joker {
	key = 'bumble',
	name = "Bumble",
	pronouns = "he_him",
	config = { extra = { storedMoney = 0 } },
	unlocked = false,
	eternal_compat = false,
	perishable_compat = true,
	blueprint_compat = false,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 1, y = 8 },
	attributes = {'economy', 'stickers'},
    pools =
	{
		
 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { card.ability.extra.storedMoney } }
	end,
	calculate = function(self, card, context)

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then

			local jokersWithoutStickers = {}
              

			for i=1, #G.jokers.cards do
				local is_rental = G.jokers.cards[i].ability.rental
				if G.jokers.cards[i] ~= card and not is_rental then
					jokersWithoutStickers[#jokersWithoutStickers+1] = G.jokers.cards[i]
				end
			end

			

			if #jokersWithoutStickers > 0 then
				local selected_joker = #jokersWithoutStickers > 0 and pseudorandom_element(jokersWithoutStickers, pseudoseed('bumble')) or nil
				selected_joker:add_sticker('rental',true)
			end		

		end

		

		if context.end_of_round and not context.repetition and not context.individual and not context.blueprint then
			local rentalTally = 0
			
            for i=1, #G.jokers.cards do
				local is_rental = G.jokers.cards[i].ability.rental
				if is_rental then
					rentalTally = rentalTally + 1
				end
			end

			card.ability.extra.storedMoney = card.ability.extra.storedMoney + (G.GAME.rental_rate * rentalTally)
        end

		if context.selling_self and not context.blueprint then
        		ease_dollars(math.floor(card.ability.extra.storedMoney * 1.5), true)
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_TCorp'), HEX('382d21'), HEX('a3802e'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'money' and to_big(G.GAME.dollars) >= to_big(200)
    end
}