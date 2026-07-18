SMODS.Consumable {
    key = 'ticking',
    name = "Ticking",
    set = 'Spectral',
    pos = { x = 0, y = 5 },
    atlas = 'ModdedProjectMoonSpectrals',
    config = { max_highlighted = 2, mod_conv = 'm_pmcmod_tremor' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end
}