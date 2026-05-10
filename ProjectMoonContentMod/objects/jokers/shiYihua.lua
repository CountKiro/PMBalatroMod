SMODS.Joker {
	key = 'shiYihua',
	name = "Shi Yihua",
	pronouns = "he_him",
	config = { extra = { baseChips = 2} },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 3, y = 4 },
	attributes = {'chips', 'diamonds', 'scaling', 'full_deck'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local diamond_tally = 0
        if G.playing_cards then
            for i = 1, #G.playing_cards do
                if G.playing_cards[i]:is_suit('Diamonds', true) then diamond_tally = diamond_tally + 1 end
            end
        end
        return {vars = { card.ability.extra.baseChips, card.ability.extra.baseChips * diamond_tally } }
	end,
	calculate = function(self, card, context)
		local diamond_tally = 0
        if G.playing_cards then
            for i = 1, #G.playing_cards do
                if G.playing_cards[i]:is_suit('Diamonds', true) then diamond_tally = diamond_tally + 1 end
            end
        end

		if context.joker_main then
			return{
				chips = card.ability.extra.baseChips * diamond_tally
			}
		end
		
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_shiFamily'), HEX("8a753f"), HEX('2e4a37'), 1.2 )
 	end,
}