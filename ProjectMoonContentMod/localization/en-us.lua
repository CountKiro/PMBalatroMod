return {
    descriptions = {
        Back={
            b_pmcmod_thumbDeck = {
                name = 'The Thumb Deck',
                text = {
                    "Starts with {C:gold}100${}",
			        "Gains no money from remaining",
                    "{C:red}discards{}, {C:blue}hands{} or {C:money}interest{}",
                    "Higher chance to find",
                    "Keypages with {C:dark_edition}Editions{}",
                },
                unlock = {
                    'Win a run with {C:attention}Social Sciences Deck{}',
                    'in at least {C:attention}Urban Nightmare Stake{}',
                },
            },
            b_pmcmod_middleDeck = {
                name = 'The Middle Deck',
                text = {
                    "Encounter score requirement ",
                    "is {C:attention}increased{}",
			        "Rewards from remaining Hands",
                    "is {C:red}tripled{}",
                },
                unlock = {
                    'Win a run with {C:attention}Language Deck{}',
                    'in at least {C:attention}Urban Nightmare Stake{}',
                },
            },
            b_pmcmod_ringDeck = {
                name = 'The Ring Deck',
                text = {
                    "Starts with {C:attention}5{}",
                    "random Keypages",
			        "Keypages change after",
                    "every Reception",
                },
                unlock = {
                    'Win a run with {C:attention}Art Deck{}',
                    'in at least {C:attention}Urban Nightmare Stake{}',
                },
            },
            b_pmcmod_silenceDeck = {
                name = 'Silent Deck',
                text = {
                    "Starts with an Eternal",
                    "{C:attention,T:j_pmcmod_silence}Time Flowing{} page.",
                    "{C:blue}+2 hands{}",
                    "{C:red}+2 discards{}",
                    "{C:inactive}+1 Keypage slot{}",
                },
                unlock = {
                    'Win a run with {C:attention}Religion Deck{}',
                    'in at least {C:attention}Urban Nightmare Stake{}',
                },
            },
            b_pmcmod_todaysShyLookDeck = {
                name = 'Shy Deck',
                text = {
                    "Starts with an eternal",
			        "{C:attention,T:j_pmcmod_shylook}Today's Shy Look{} page.",
                },
                unlock = {
                    'Win a run with {C:attention}Literature Deck{}',
                    'in at least {C:attention}Urban Nightmare Stake{}',
                },
            },
            b_pmcmod_hatredDeck = {
                name = 'Love Deck',
                text = {
                    "Starts with an eternal",
			        "{C:attention,T:j_pmcmod_queenOfHatred}Queen of Hatred{} page.",
                },
                unlock = {
                    'Win a run with {C:attention}Natural Sciences Deck{}',
                    'in at least {C:attention}Urban Nightmare Stake{}',
                },
            },
            b_pmcmod_serpentDeck = {
                name = 'Serpent Deck',
                text = {
                    "Gets a new bonus with {C:attention}each{}",
			        "{C:attention}cleared Act{} (up until Act 10).",
			        "Required score scaling is doubled.",
                },
                unlock = {
                    'Win a run with {C:attention}General Deck{}',
                    'in at least {C:attention}Urban Nightmare Stake{}',
                },
            },
        },
        Blind={},
        Edition={},
        Enhanced={
            m_pmcmod_burn = {
                name = "Burn Card",
                text = {
                    "Gives {C:chips}0.1%{} of the total Encounter",
                    "score as extra chips",
                    "Currently {C:chips}+#1#{} extra chips",
                },
            },
        },
        Joker={
            j_pmcmod_angela = {
                name = 'Angela',
                text = {
                    "Hello, Manager.",
			        "This is {C:red}Day #1#{}.",
    			    "Let's do our best today.",
                },
                unlock = {
                    'Win a run with {C:attention}L Corp Deck{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_michelle = {
                name = 'Michelle',
                text = {
                    "Selling another {C:attention}Keypage{} during a",
                    "{C:attention}Reception{} disables its effect.",
			        "Gain {X:mult,C:white} X#1# {} Mult for every",
                    "Reception disabled this way",
                    " ",
                    "If this happens more than",
                    "{C:attention}6 times{}, {C:red}suffer a meltdown{}",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
                unlock = {
                    'Win a run with {C:attention}L Corp Deck{}',
                    'in at least {C:attention}Canard Stake{}',
                },
            },
            j_pmcmod_elijah = {
                name = 'Elijah',
                text = {
                    "Gains {C:mult}2{} Mult for {C:attention}every{}",
                    "{C:attention}Poker Hand level above 1{}",
                    " ",
			        "If any Poker Hand level",
                    "goes {C:attention}above 7{}, {C:red}suffer a meltdown{}",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)",
                },
                unlock = {
                    'Win a run with {C:attention}L Corp Deck{}',
                    'in at least {C:attention}Urban Myth Stake{}',
                },
            },
            j_pmcmod_giovanni = {
                name = 'Giovanni',
                text = {
                    "Gains {C:mult}7 Mult{} and {C:chips}10 Chips{}",
                    "at the end of every Act. Requires",
                    "{C:attention} #1# consumable(s){} used every Act.",
                    " ",
                    "If the conditionals are not met after",
                    "defeating a Reception, {C:red}suffer a meltdown{}",
                    " ",
                    "Consumable usage doubles every ante.",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                    "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips)",
                    "{C:inactive}(Current consumables used: {C:chips}#4#{C:inactive})",
                },
                unlock = {
                    'Win a run with {C:attention}L Corp Deck{}',
                    'in at least {C:attention}Urban Legend Stake{}',
                },
            },
            j_pmcmod_gabriel = {
                name = 'Gabriel',
                text = {
                    "Gains {C:mult}1{} Mult for every {C:hearts}Hearts{} and {C:diamonds}Diamonds{} card scored",
                    "Gains {C:chips}3{} Chips for every {C:spades}Spades{} or {C:clubs}Clubs{} card scored",
                    " ",
                    "If the difference between the amount of {C:spades}Spades{}/{C:clubs}Clubs{}",
                    "and {C:hearts}Hearts{}/{C:diamonds}Diamonds{} surpass 6, {C:red}suffer a meltdown{}",
                    "{C:inactive}(Total {C:hearts}Hearts{}: #3#)",
                    "{C:inactive}(Total {C:diamonds}Diamonds{}: #4#)",
                    "{C:inactive}(Total {C:spades}Spades{}: #1#)",
                    "{C:inactive}(Total {C:clubs}Clubs{}: #2#)",
                    "{C:inactive}(Currently {C:mult}+#5#{C:inactive} Mult)",
                    "{C:inactive}(Currently {C:chips}+#6#{C:inactive} Chips)",
                },
                unlock = {
                    'Win a run with {C:attention}L Corp Deck{}',
                    'in at least {C:attention}Urban Legend Stake{}',
                },
            },
            j_pmcmod_daniel = {
                name = 'Daniel',
                text = {
                    "Starts with {X:mult,C:white}X#4#{} Mult",
                    "Every time a card scores,",
                    "there's a {C:green}#1# in #3#{} chance",
                    "to increase the Mult by {C:mult}0.1{}",
                    "and a {C:green}#1# in #2#{} chance",
                    "to decrease it by the same amount.",
                    " ",
                    "If the Mult reaches {X:mult,C:white}X1{},",
                    "{C:red}suffer a meltdown{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#4#{C:inactive} Mult)",
                },
                unlock = {
                    'Win a run with {C:attention}L Corp Deck{}',
                    'in at least {C:attention}Urban Nightmare Stake{}',
                },
            },
            j_pmcmod_kali = {
                name = 'Kali',
                text = {
                    "Gets {C:mult}25{} Mult for",
                    "every {C:blue}Hand{} played this Scene",
                    " ",
                    "If the last {C:blue}Hand{} is played,",
                    "{C:red}suffer a meltdown{}",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)",
                },
                unlock = {
                    'Win a run with {C:attention}L Corp Deck{}',
                    'in at least {C:attention}Star of the City Stake{}',
                },
            },
            j_pmcmod_garion = {
                name = 'Garion',
                text = {
                    "If the first hand of the Scene",
                    "has {C:attention}more than one card{},",
                    "destroy all scored cards and",
                    "add {X:mult,C:white}X#2#{} Mult per card destroyed.",
                    " ",
                    "If the amount of cards currently",
                    "in the deck is less than half",
                    "the original amount of cards,",
                    "{C:red}suffer a meltdown{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
                },
                unlock = {
                    'Win a run with {C:attention}L Corp Deck{}',
                    'in at least {C:attention}Imputitas Civitatis Stake{}',
                },
            },
            j_pmcmod_lisa = {
                name = 'Lisa',
                text = {
                    "Ace cards give {C:mult}#2#{} Mult",
                    "If {C:attention}Enoch{} is not present at the start",
                    "of an Encounter, spawn him in.",
                    "Every time {C:attention}Enoch{} is destroyed,",
                    "increment the Ace Mult by {C:mult}#3#{}",
                    " ",
                    "If {C:attention}Enoch{} dies more than 7 times, {C:red}suffer a meltdown{}.",
                    "{C:inactive}(Witness Enoch's death {C:mult}#1#{C:inactive} times)",
                },
                unlock = {
                    'Win a run with {C:attention}L Corp Deck{}',
                    'in at least {C:attention}Urban Plague Stake{}',
                },
            },
            j_pmcmod_enoch = {
                name = 'Enoch',
                text = {
                    "Gets {C:chips}#2#{} chips per played card",
                    " ",
                    "If this values reaches {C:chips}100{},",
                    "{C:red}destroy this card{} at the end of the Encounter",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                },
                unlock = {
                    'Win a run with {C:attention}L Corp Deck{}',
                    'in at least {C:attention}Urban Plague Stake{}',
                },
            },
            j_pmcmod_hermann = {
                name = 'Hermann',
                text = {
                    "On the {C:attention}first played hand{},",
                    "randomize the scoring cards' enhancements",
                    "Also has {C:green}#1# in #2#{} chance of giving",
                    "them a random {C:attention}seal{} and {C:green}#1# in #3#{} chance",
                    "of giving them a random {C:dark_edition}Edition{}.",
                },
                unlock = {
                    'Win a run with {C:attention}K Corp Deck{}',
                    'in at least {C:attention}Impuritas Civitatis Stake{}',
                },
            },
            j_pmcmod_gubo = {
                name = 'Gubo',
                text = {
                    "At the {C:attention}start of the Encounter{},",
                    "has a {C:green}#4# in #5#{} chance do aim at",
                    "a random {C:attention}Keypage{}.",
                    " ",
                    "Gubo will shoot at the selected",
                    "Keypage at the end of the Encounter.",
                    " ",
                    "If the Keypage is Paperback or",
			        "Hardcover, gain either {C:mult}#2#{} or",
                    "{C:mult}#3#{} Mult depending on the rarity.",
                    "This value doubles if the Keypage is of a Sinner",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                    "{C:inactive}(Currently aiming at: {C:red}#6#{C:inactive})",
                    "{C:inactive}This page has a hidden interaction.",
                },
                unlock = {
                    'Win a run with {C:attention}K Corp Deck{}',
                    'in at least {C:attention}Impuritas Civitatis Stake{}',
                },
            },
            j_pmcmod_aseah = {
                name = 'Aseah',
                text = {
                    "At the start of the Encounter,",
                    "changes the {C:attention}Keypage{} to the right",
                    "into a {C:attention}random Keypage{} of a higher rarity.",
                    "(up to Limited)"
                },
                unlock = {
                    'Win a run with {C:attention}K Corp Deck{}',
                    'in at least {C:attention}Impuritas Civitatis Stake{}',
                },
            },
            j_pmcmod_panther = {
                name = 'Panther',
                text = {
                    "Gains {C:mult}+#2#{} Mult",
                    "for every {C:planet}Sinner{} card sold",
			        "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                },
                unlock = {
                    'Win a run with {C:attention}Serpent Deck{}',
                    'in at least {C:attention}Urban Myth Stake{}',
                },
            },
            j_pmcmod_lion = {
                name = 'Lion',
                text = {
                    "Gains {C:chips}+#2#{} Chips",
                    "for every {C:planet}Sinner{} card sold",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                },
                unlock = {
                    'Win a run with {C:attention}Serpent Deck{}',
                    'in at least {C:attention}Urban Legend Stake{}',
                },
            },
            j_pmcmod_wolf = {
                name = 'Wolf',
                text = {
                    "Gains {X:mult,C:white}X#1#{} Mult",
                    "for every {C:planet}Sinner{} card sold",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
                unlock = {
                    'Win a run with {C:attention}Serpent Deck{}',
                    'in at least {C:attention}Urban Plague Stake{}',
                },
            },
            j_pmcmod_hopkins = {
                name = 'Hopkins',
                text = {
                    "{C:mult}+#1#{} Mult",
                    "{C:green}#2# in #3#{} chance this Keypage destroys",
                    "another Keypage at the end of",
                    "the round and leaves",
                },
            },
            j_pmcmod_aya = {
                name = 'Aya',
                text = {
                    "{C:chips}+#1#{} Chips",
                    "{C:green}#2# in #3#{} chance this Keypage destroys",
                    "itself at the end of the round",
                    "and leaves a {C:tarot, T:v_tarot_merchant Gas Mask {}",
                },
            },
            j_pmcmod_yuri = {
                name = 'Yuri',
                text = {
                    "{C:green}#1# in #2#{} chance this Keypage destroys",
                    "itself at the end of the round.",
                    " ",
                    "If this Keypage survives {C:red}#3#{} rounds,",
                    "sell it to get a {C:money, T:c_soul}Golden Bough{}",
                    "Current rounds survived: {C:red}#4#{}",
                },
            },
            j_pmcmod_demian = {
                name = 'Demian',
                text = {
                    "Gain {X:mult,C:white} X#1# {} Mult for",
                    "every {C:spectral}Spectral card{} used",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
                unlock = {
                    'Win a run with {C:attention}N Corp Deck{}',
                    'in at least {C:attention}Urban Nightmare Stake{}',
                },
            },
            j_pmcmod_rim = {
                name = 'Rim',
                text = {
                    "Halves all {C:attention}listed",
                    "{C:green,E:1,S:1.1}probabilities",
                    "{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}1 in 6{C:inactive})",
                },
                unlock = {
                    'Score over 100000 chips',
                    'in one hand',
                },
            },
            j_pmcmod_sanson = {
                name = 'Sanson',
                text = {
                    "Forces a card to always be selected",
                    "Doubles played {C:attention}Poker Hand base value{}",
                }
            },
            j_pmcmod_effie = {
                name = 'Effie',
                text = {
                    "Gain{C:mult} +#2# {}Mult if the played hand",
                    "is a{C:attention} #3#{}.",
                    " ",
                    "Value resets if the hand",
                    "played doesn't contain it.",
                    "(Poker hand changes after every round)",
                    "{C:inactive}(Currently{C:mult} #1# {C:inactive}Mult)"
                },
            },
            j_pmcmod_saude = {
                name = 'Saude',
                text = {
                    "Gain{C:chips} +#2# {}Chips if the played hand",
                    "contains a{C:attention} #3# {}card.",
                    "Value resets if the hand",
                    " ",
                    "played doesn't contain it.",
                    "(Suit changes after every round) ",
                    "{C:inactive}(Currently{C:chips} #1# {C:inactive}Chips)",
                },
            },
            j_pmcmod_aida = {
                name = 'Aida',
                text = {
                    "Each hand played grants",
                    "one of the following effects:",
                    "{C:chips} +#1# chips {},{C:chips} +#2# chips {},",
                    "{C:chips} +#3# chips {},{C:chips} +#4# chip {},",
                    "{C:attention} #5# chips{}, or{C:mult} #6# chips {}",
                },
            },
            j_pmcmod_sonya = {
                name = 'Sonya',
                text = {
                    "Grants {C:chips}#1#{} Chips if the played",
                    "Poker Hand contains a {C:attention}Flush{}",
                    "Additionaly, has {C:green}#2# in #3#{} chance",
                    "to spawn in a {C:attention, T:c_soul}Golden Bough{}",
                },
                unlock = {
                    'Score over 50000 chips,',
                    'with a score divisible by 7',
                },
            },
            j_pmcmod_kromer = {
                name = 'Kromer',
                text = {
                    "When {C:attention}Normal Encounter{} or {C:attention}Risky Encounter{}",
                    "is selected, if a heretic Keypage is present,",
                    "destroy it and gain {X:mult,C:white} X#1# {} Mult",
                    "(can only happen once per blind)",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
                unlock = {
                    'Win a run with {C:attention}N Corp Deck{}',
                    'in at least {C:attention}Urban Plague Stake{}',
                },
            },
            j_pmcmod_siegfried = {
                name = 'Siegfried',
                text = {
                    "Gains {X:mult,C:white} X#1# {} Mult every time a hand scores ",
                    "over the target score for the encounter",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
                unlock = {
                    'Win a run with {C:attention}K Corp Deck{}',
                    'in at least {C:attention}Star of the City Stake{}',
                },
            },
            j_pmcmod_guido = {
                name = 'Guido',
                text = {
                    "When {C:attention}Normal Encounter{} or {C:attention}Risky Encounter{}",
                    "is selected, adds a random card with a red seal.",
                    "Gains {C:mult}+#1#{} Mult for every red seal in deck",
                    "{C:inactive}(Currently {C:mult} +#2# {C:inactive} Mult)",
                },
                unlock = {
                    'Win a run with {C:attention}N Corp Deck{}',
                    'in at least {C:attention}Urban Myth Stake{}',
                },
            },
            j_pmcmod_papaBongy = {
                name = 'Papa Bongy',
                text = {
                    "When an {C:attention}Encounter{} starts,",
                    "spawn in up to 4 random Bongys,",
                    "up to 20 Bongys in total for the whole game.",
                    "For every Bongys defeated, Papa Bongy",
                    "gets a different bonus:",
                    "Bongy (Soy Sauce): {C:chips}10{} Chips",
                    "Bongy (Red Sauce): {C:mult}5{} Mult",
                    "Bongy (Normal): {X:mult,C:white}X0.1{} Mult",
                    "Bongy (Chef): {C:gold}1${} at the end of the Encounter",
                    "{C:inactive}(Currently{C:chips} #1# {C:inactive} Chips)",
                    "{C:inactive}(Currently{C:mult} #2# {C:inactive} Mult)",
                    "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)",
                    "{C:inactive}(Currently{C:gold} #4#$ {C:inactive})",
                },
                unlock = {
                    'Win a run with {C:attention}K Corp Deck{}',
                    'in at least {C:attention}Urban Legend Stake{}',
                },
            },
            j_pmcmod_dongrang = {
                name = 'Dongrang',
                text = {
                    "At the end of every Reception, adds",
                    "{C:dark_edition}Polychrome{} to a random editionless Keypage",
                    "Gains {X:mult,C:white}X#2#{} Mult for every {C:dark_edition}Polychrome{} Keypage",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
                },
                unlock = {
                    'Win a run with {C:attention}K Corp Deck{}',
                    'in at least {C:attention}Urban Nightmare Stake{}',
                },
            },
            j_pmcmod_dongrang_alt = {
                name = 'Dongrang, Who Denies All',
                text = {
                    "At the end of every Reception, adds",
                    "{C:dark_edition}Polychrome{} to a random editionless Keypage",
                    "Gains {X:mult,C:white}X#2#{} Mult for every {C:dark_edition}Polychrome{} Keypage",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
                },
            },
            j_pmcmod_dongbaek = {
                name = 'Dongbaek',
                text = {
                    "Every played 9 gives {X:mult,C:white} X#1# {} Mult",
                },
                unlock = {
                    'Win a run with {C:attention}K Corp Deck{}',
                    'in at least {C:attention}Urban Plague Stake{}',
                },
            },
            j_pmcmod_samjo = {
                name = 'Samjo',
                text = {
                    "{C:chips}20{} base chips",
                    "Gains {C:chips}20{} chips for every",
                    "{C:dark_edition}Polychrome{} Keypage in possesion",
                    "{C:inactive}(Currently {C:chips}#1#{C:inactive} Chips)",
                },
                unlock = {
                    'Win a run with {C:attention}K Corp Deck{}',
                    'in at least {C:attention}Urban Myth Stake{}',
                },
            },
            j_pmcmod_shrenne = {
                name = 'Shrenne',
                text = {
                    "Selling a Keypage adds half of",
                    "its sell value as mult.",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)",
                },
            },
            j_pmcmod_alfonso = {
                name = 'Alfonso',
                text = {
                    "Gives {C:money}$#1#{} per played hand, if the",
                    "respective Poker Hand's level is above 1.",
                    "{C:green}#2# in #3#{} chance to {C:red}reduce the Poker Hand level{}",
                },
                unlock = {
                    'Win a run with {C:attention}K Corp Deck{}',
                    'in at least {C:attention}Impuritas Civitatis Stake{}',
                },
            },
            j_pmcmod_marile = {
                name = 'Marile',
                text = {
                    "This Keypage starts with {C:mult}#2#{} Mult",
                    "Lose {C:mult}10{} Mult for every enhanced Keypage",
                    "and {C:mult}2{} Mult for every enhanced Card.",
                    " ",
                    "Destroys this Keypage on the next played hand",
                    "if Mult is 0 or less",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)",
                },
            },
            j_pmcmod_ran = {
                name = 'Ran',
                text = {
                    "This Keypage starts with {C:chips}#2#{} Chips",
			        "Lose {C:chips}20{} Chips for every enhanced Keypage",
			        "and {C:chips}5{} Chips for every enhanced Card.",
                    " ",
			        "Destroys this Keypage on the next played hand",
			        "if Chips is 0 or less",
			        "{C:inactive}(Currently {C:chips}#1#{C:inactive} Chips)",
                },
            },
            j_pmcmod_niko = {
                name = 'Niko',
                text = {
                    "Adds {C:mult}Mult{} equal to {C:attention}triple{} the amount",
			        "of Cards in hands after the hand is played",
                },
            },
            j_pmcmod_robotHod = {
                name = 'Hod (Robot)',
                text = {
                    "{X:mult,C:white}X#2#{} Mult",
                    "Disables a random Keypage during",
                    "every Encounter"
                },
            },
            j_pmcmod_robotMalkuth = {
                name = 'Malkuth (Robot)',
                text = {
                    "Gains 1 Mult for every Poker Hand level above 1",
                    "Has {C:green}#2# in #3#{} chance to decrease the played Poker Hand level",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)",
                },
            },
            j_pmcmod_robotNetzach = {
                name = 'Netzach (Robot)',
                text = {
                    "Gains {C:mult}3 Mult{} and {C:chips}5 Chips{}",
                    "at the end of every Act. Requires",
                    "{C:red}Increases shop prices by 5%{}",
                    "{C:red}after every Encounter{}",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                    "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips)",
                    "{C:inactive}(Currently {C:chips}+#5#{C:inactive} % Shop Price)",
                },
            },
            j_pmcmod_robotYesod = {
                name = 'Yesod (Robot)',
                text = {
                    "Gains {C:mult}1{} Mult for every three {C:hearts}Hearts{} and {C:diamonds}Diamonds{} card played",
                    "and {C:chips}1{} Chips for every {C:spades}Spades{} or {C:clubs}Clubs{} card played",
                    "Has a {C:green}#7# in #8#{} chance to add Perishable to a random Keypage",
                    "every Hand played",
                    "{C:inactive}(Currently {C:mult}+#5#{C:inactive} Mult)",
                    "{C:inactive}(Currently {C:chips}+#6#{C:inactive} Chips)",
                },
            },
            j_pmcmod_robotChesed = {
                name = 'Chesed (Robot)',
                text = {
                    "Starts with {X:mult,C:white}X#4#{} Mult",
                    "Every time a card scores, there's a {C:green}#1# in #2#{} chance",
                    "to increase the Mult by 0.1.",
                    "Removes enhancements from played cards",
                    "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)",
                },
            },
            j_pmcmod_robotGebura = {
                name = 'Gebura (Robot)',
                text = {
                    "Gets {C:mult}10{} Mult for every hand played this Scene",
                    "Also {C:gold}lose half that value as money{} on every played hand",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)",
                },
            },
            j_pmcmod_robotBinah = {
                name = 'Binah (Robot)',
                text = {
                    "Gains {X:mult,C:white}X#2#{} for every card below",
                    "the deck's starting size",
                    "Adds a random card at the start of every Encounter",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
                },
            },
            j_pmcmod_robotTiph = {
                name = 'Tiph A (Robot)',
                text = {
                    "Ace cards give {C:mult}#2#{} Mult and {C:chips}#4# Chips{}",
                    "If {C:attention}Enoch{} is not present at the start of a blind, spawn him in.",
                    "Every time {C:attention}Enoch{} is destroyed, increment the Ace mult by {C:mult}#3#{}",
                },
            },
            j_pmcmod_robotEnoch = {
                name = 'Tiph B (Robot)',
                text = {
                    "Gets {C:chips}#2#{} chips per played card",
                    "If this values reaches {C:chips}100{}, destroy this card",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                },
            },
            j_pmcmod_silence = {
                name = 'Time Flowing',
                text = {
                    "Lose the run if the current encounter",
                    "is not defeated within {C:mult}30 seconds{}",
                },
            },
            j_pmcmod_shylook = {
                name = "Today's Shy Look",
                text = {
                    "Changes expressions regularly.",
                    "Gives between {X:mult,C:white}X0{} and {X:mult,C:white}X2{} Mult depending on",
                    "the expression it's at when a hand is played",
                },
            },
            j_pmcmod_queenOfHatred = {
                name = "Queen of Hatred",
                text = {
                    "Every card played and discarded is counted",
                    "Gains effects based on the difference between values:",
                    "< 4: {C:attention}Retriggers{} every Keypage",
                    "< 7: Gain {C:chips}100{} chips (scale with every Act)",
                    "> 10: {X:mult,C:white}X0.5{} Mult",
                    "> 14: {C:attention}Transforms{}. Disables two random Keypages",
                    "If transformation occurs, stays in this state for",
                    "the next 2 Encounters, then reset value to 9",
                    "{C:inactive}(Discarded:{C:attention} #1# {C:inactive})",
                    "{C:inactive}(Played:{C:attention} #2# {C:inactive})",
                    "{C:inactive}(Current count:{C:attention} #8# {C:inactive})",
                    "{C:inactive}(Scenes transformed:{C:attention} #7# {C:inactive})",
                },
            },
            j_pmcmod_chickenA = {
                name = "Bongy (Normal)",
                text = {
                    "Crispy on the outside, juicy on the inside.",
                    "Destroys itself at the end of the Encounter",
                    "once {C:attention}3 Scenes are completed{}",
                    "{C:inactive}(Currently{C:attention} #1# {C:inactive}rounds completed)",
                },
            },
            j_pmcmod_chickenB = {
                name = "Bongy (Soy Sauce)",
                text = {
                    "Covered in fragrant spices.",
                    "Destroy itself at the end of the Encounter",
                    "once {C:blue}5 Hands{} are played",
                    "{C:inactive}(Currently{C:blue} #1# {C:inactive}hands played)",
                },
            },
            j_pmcmod_chickenC = {
                name = "Bongy (Red Sauce)",
                text = {
                    "Covered in a delicious red tomato (?) sauce.",
                    "Destroys itself at the end of the Encounter",
                    "once {C:red}20 cards are discarded{}",
                    "{C:inactive}(Currently{C:mult} #1# {C:inactive}discards used)",
                },
            },
            j_pmcmod_chickenD = {
                name = "Bongy (Chef)",
                text = {
                    "Are you telling me a chicken fried this rice?",
                    "Destroys itself at the end of the Encounter",
                    "once {C:gold}3 boosters are opened{}",
                    "{C:inactive}(Currently{C:gold} #1# {C:inactive}boosters opened)",
                },
            },
        },
        Other={
            pmcmod_markofcain_seal = {
                name = "Mark of Cain",
                text = {
                    "{X:mult,C:white}X1.2{} Mult",
                },
            },
        },
        Partner={
            pnr_pmcmod_dante = {
                name = "Dante",
                text = {
                    "Manager",
                    "Gives {C:mult}#2#{} Mult",
                    "on every played hand.",
                    "{C:inactive}(Currently{C:mult} #1# {C:inactive}Mult)",
                }
            },
            pnr_pmcmod_roland = {
                name = "Roland",
                text = {
                    "Fixer",
                    "...",
                }
            },
            pnr_pmcmod_netzach = {
                name = "Netzach",
                text = {
                    "Patron Librarian",
                    "Gives {C:money}$#1#{} after",
                    "every Encounter.",
                }
            },
        },
        Planet={},
        Spectral={
            c_pmcmod_witness = {
                name = "Witness",
                text = {
                    "Changes every card in hand",
                    "into a random Clubs face card",
                }
            },
            c_pmcmod_outcast = {
                name = "Outcast",
                text = {
                    "Gives a random enhancement to",
                    "every card in hand",
                    "-1 hand size",
                }
            },
            c_pmcmod_unloving = {
                name = "Unloving",
                text = {
                    "Destroys a random Keypage",
                    "Gives Bonus to every card in hand",
                }
            },
        },
        Stake={},
        Tag={},
        Tarot={},
        Voucher={},
        Sleeve = {
            sleeve_pmcmod_thumbDeck = {
                name = "Thumb Sleeve",
                text = {
                    "Starts with {C:gold}100${}",
			        "Gains no money from remaining",
                    "{C:red}discards{}, {C:blue}hands{} or {C:money}interest{}",
                    "Higher chance to find",
                    "Keypages with {C:dark_edition}Editions{}",   
                },
                unlock = {
                    'Win a run with {C:attention}Thumb Deck{}',
                    'in at least {C:attention}Canard Stake{}',
                },
            },
            sleeve_pmcmod_middleDeck = {
                name = "Middle Sleeve",
                text = {
                    "Encounter score requirement ",
                    "is {C:attention}increased{}",
			        "Rewards from remaining Hands",
                    "is {C:red}tripled{}",
                },
                unlock = {
                    'Win a run with {C:attention}Middle Deck{}',
                    'in at least {C:attention}Canard Stake{}',
                },
            },
            sleeve_pmcmod_ringDeck = {
                name = "Ring Sleeve",
                text = {
                    "Starts with {C:attention}5{}",
                    "random Keypages",
			        "Keypages change after",
                    "every Reception",
                },
                unlock = {
                    'Win a run with {C:attention}Ring Deck{}',
                    'in at least {C:attention}Canard Stake{}',
                },
            },
            sleeve_pmcmod_silenceDeck = {
                name = "Silence Sleeve",
                text = {
                    "Starts with an Eternal",
                    "{C:attention, T:j_pmcmod_silence}Time Flowing{} page.",
                    "{C:blue}+2 hands{}",
                    "{C:red}+2 discards{}",
                    "{C:inactive}+1 Keypage slot{}",           
                },
                unlock = {
                    'Win a run with {C:attention}Silence Deck{}',
                    'in at least {C:attention}Canard Stake{}',
                },
            },
            sleeve_pmcmod_todaysShyLookDeck = {
                name = "Shy Sleeve",
                text = {
                    "Starts with an eternal",
			        "{C:attention,T:j_pmcmod_shylook}Today's Shy Look{} page.",         
                },
                unlock = {
                    'Win a run with {C:attention}Shy Deck{}',
                    'in at least {C:attention}Canard Stake{}',
                },
            },
            sleeve_pmcmod_hatredDeck = {
                name = "Love Sleeve",
                text = {
                    "Starts with an eternal",
			        "{C:attention,T:j_pmcmod_queenOfHatred}Queen of Hatred{} page.",
                },
                unlock = {
                    'Win a run with {C:attention}Love Deck{}',
                    'in at least {C:attention}Canard Stake{}',
                },
            },
            sleeve_pmcmod_serpentDeck = {
                name = "Serpent Sleeve",
                text = {
                    "Gets a new bonus with {C:attention}each{}",
			        "{C:attention}cleared Act{} (up until Act 10).",
			        "Required score scaling is doubled.",
                },
                unlock = {
                    'Win a run with {C:attention}Serpent Deck{}',
                    'in at least {C:attention}Canard Stake{}',
                },
            },
        }
    },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_states={},
        challenge_names={},
        collabs={},
        dictionary={},
        high_scores={},
        labels={
            pmcmod_markofcain_seal = "Mark of Cain",
        },
        poker_hand_descriptions={},
        poker_hands={},
        quips={
            pnr_pmcmod_dante_1={
                "Ah... shuckaroonies!",
                "W-wait for me!",
            },
            pnr_pmcmod_dante_2={
                "Let's give it our all!",
            },
            pnr_pmcmod_dante_3={
                "Please, let's do this flawlessly.",
                "Vergilius is watching...",
            },
            pnr_pmcmod_dante_4={
                "Let's...try not to die.",
            },
            pnr_pmcmod_roland_1={
                "That's that and this is this",
            },
            pnr_pmcmod_roland_2={
                "Hmmm... what kind of",
                "guests we'll get this time,",
                "I wonder",
            },
            pnr_pmcmod_roland_3={
                "Oh boy, here we go",
            },
            pnr_pmcmod_roland_4={
                "No money? Broke. Want mult? Debuffed. Want Spectrals?",
            },
            pnr_pmcmod_roland_5={
                "Sigh...let's go...",
            },
            pnr_pmcmod_roland_6={
                "Don't expect much of me",
                "I'm just a washed up",
                "Grade 9 Fixer",
            },
            pnr_pmcmod_roland_7={
                "I wonder if I can get a",
                "drink from Netz",
            },
            pnr_pmcmod_netzach_1={
                "*sigh* Let's get started...",
            },
            pnr_pmcmod_netzach_2={
                "Can we end this quickly?",
                "I wanna go back to sleep...",
            },
            pnr_pmcmod_netzach_3={
                "*sigh*",
            },
            pnr_pmcmod_netzach_4={
                "I need a beer...",
            },
            pnr_pmcmod_netzach_5={
                "Let's go.",
            },
            pnr_pmcmod_netzach_6={
                "*sigh* I guess...",
            },
            pnr_pmcmod_netzach_7={
                "I need a drink.",
            },
            pnr_pmcmod_netzach_8={
                "Hey, let's have a drink.",
            },
        },
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorial={},
        v_dictionary={},
        v_text={},
    },
}