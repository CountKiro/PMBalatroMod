-- Bloodfiend
SMODS.Challenge {
    key = 'bloodfiend_1',
    unlocked = true,
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
    unlocked = true,
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
    unlocked = true,
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
    unlocked = true,
    jokers = {
        { id = 'j_pmcmod_rien'},
        { id = 'j_pmcmod_voiceOfTheCity', eternal = true },
        { id = 'j_pmcmod_voiceOfTheCity', eternal = true },
    }
}

-- Vengeance
SMODS.Challenge {
    key = 'vengeance',
    unlocked = true,
    jokers = {
        { id = 'j_ceremonial', eternal = true },
        { id = 'j_pmcmod_ricardo'},
        { id = 'j_pmcmod_shiSijing', eternal = true },
    }
}

-- Money, Money, Money
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

-- Money, Money, Money
SMODS.Challenge {
    key = 'luck',
    unlocked = true,
    jokers = {
        { id = 'j_pmcmod_aida', eternal = true },
        { id = 'j_pmcmod_oswald' },
        { id = 'j_pmcmod_sonya', eternal = true },
        { id = 'j_lucky_cat', eternal = true },
        { id = 'j_pmcmod_nightDrifter', eternal = true },
    },
    rules = {
        modifiers = {
            { id = 'hands',       value = 2 },
            { id = 'discards',    value = 5 },
            { id = 'joker_slots', value = 6 },
        }
    },
    consumeables = {
        { id = 'c_magician' },
        { id = 'c_magician' },
        { id = 'c_magician' },
        { id = 'c_magician' },
    },
}

-- Money, Money, Money
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

-- Money, Money, Money
SMODS.Challenge {
    key = 'wuthering',
    unlocked = true,
    jokers = {
        { id = 'j_pmcmod_catherine'},
        { id = 'j_pmcmod_josephine' },
        { id = 'j_pmcmod_linton', },
        { id = 'j_pmcmod_hindley'},
        { id = 'j_pmcmod_nelly' },
    },
    rules = {
        modifiers = {
            { id = 'joker_slots', value = 6 },
        }
    },
}