SMODS.Challenge {
    key = 'money',
    unlocked = true,
    jokers = {
        { id = 'j_bootstraps', eternal = true },
        { id = 'j_bull', eternal = true },
        { id = 'j_pmcmod_camille', eternal = true },
        { id = 'j_pmcmod_bumble' },
        { id = 'j_pmcmod_herbert', eternal = true },
        { id = 'j_pmcmod_domino', eternal = true },
    },
    rules = {
        modifiers = {
            { id = 'hands',       value = 3 },
            { id = 'discards',    value = 3 },
            { id = 'joker_slots', value = 6 },
        }
    },
    calc_dollar_bonus = function(self)
        return 10
    end
}