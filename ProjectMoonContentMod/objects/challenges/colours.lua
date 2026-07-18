SMODS.Challenge {
    key = 'colors',
    unlocked = true,
    jokers = {
        { id = 'j_caino', eternal = true },
        { id = 'j_triboulet', eternal = true },
        { id = 'j_yorick', eternal = true },
        { id = 'j_chicot', eternal = true },
        { id = 'j_perkeo', eternal = true },
        { id = 'j_pmcmod_vermillionCross', eternal = true },
        { id = 'j_pmcmod_indigoElder', eternal = true },
        { id = 'j_pmcmod_yellowHarpoon', eternal = true },
    },
    rules = {
        custom = {
            { id = 'no_reward' },
            { id = 'no_extra_hand_money' },
            { id = 'no_interest' },
            { id = 'discard_cost', value = 1 },
        },
        modifiers = {
            { id = 'hands',       value = 1 },
            { id = 'discards',    value = 6 },
            { id = 'joker_slots', value = 9 },
            { id = 'dollars', value = 100 },
        }
    },
}