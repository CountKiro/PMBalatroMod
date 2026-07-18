SMODS.Consumable {
    key = 'hunt',
	name = "Hunt",
    set = 'Spectral',
	atlas = 'ModdedProjectMoonSpectrals',
    pos = { x = 9, y = 5 },
    config = { max_highlighted = 1, mod_conv = 'm_pmcmod_pallid' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end
}