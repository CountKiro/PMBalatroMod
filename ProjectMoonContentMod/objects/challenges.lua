-- Bloodfiend
SMODS.Challenge {
    key = 'bloodfiend',
    jokers = {
        { id = 'j_pmcmod_dadQuixote', eternal = true },
        { id = 'j_pmcmod_casetti', eternal = true },
        { id = 'j_pmcmod_dulcinea', eternal = true },
        { id = 'j_pmcmod_barber', eternal = true },
        { id = 'j_pmcmod_priest', eternal = true },
    },
    consumeables = {
        { id = 'c_sun' },
        { id = 'c_sun', edition = "negative" },
        { id = 'c_pmcmod_banquet' },
        { id = 'c_pmcmod_banquet', edition = "negative" },
    },
}

-- Pequod
SMODS.Challenge {
    key = 'pequod',
    jokers = {
        { id = 'j_pmcmod_ahab', eternal = true },
        { id = 'j_pmcmod_queequeg', eternal = true },
        { id = 'j_pmcmod_starbuck', eternal = true },
        { id = 'j_pmcmod_stubb', eternal = true },
        { id = 'j_pmcmod_pip', eternal = true },
    },
    consumeables = {
        { id = 'c_pmcmod_hunt' },
        { id = 'c_pmcmod_hunt' },
    },
}

-- Poise
SMODS.Challenge {
    key = 'poise',
    jokers = {
        { id = 'j_pmcmod_kim', eternal = true },
        { id = 'j_pmcmod_shiomiYoru', eternal = true },
        { id = 'j_pmcmod_ren', eternal = true },
    },
    consumeables = {
        { id = 'c_pmcmod_bygone' },
        { id = 'c_pmcmod_bygone' },
    },
}

-- Index
SMODS.Challenge {
    key = 'index',
    jokers = {
        { id = 'j_pmcmod_rien'},
        { id = 'j_pmcmod_voiceOfTheCity', eternal = true },
        { id = 'j_pmcmod_voiceOfTheCity', eternal = true },
    }
}

-- Vengeance
SMODS.Challenge {
    key = 'vengeance',
    jokers = {
        { id = 'j_ceremonial', eternal = true },
        { id = 'j_pmcmod_ricardo'},
        { id = 'j_pmcmod_shiSijing', eternal = true },
    }
}

-- Money, Money, Money
SMODS.Challenge {
    key = 'money',
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