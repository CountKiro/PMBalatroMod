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
            b_pmcmod_indexDeck = {
                name = 'The Index Deck',
                text = {
                    "Starts with an eternal",
			        "{C:attention,T:j_pmcmod_voiceOfTheCity}Voice of the City{} page.",
                },
                unlock = {
                    'Win a run with {C:attention}Natural Sciences Deck{}',
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
            b_pmcmod_giftDeck = {
                name = 'Gift Deck',
                text = {
                    "Starts with an Eternal",
                    "{C:attention,T:j_pmcmod_laetitia}Here’s a Gift~{} page.",
                    "{C:blue}+2 hands{}",
                },
                unlock = {
                    'Win a run with {C:attention}Literature Deck{}',
                    'in at least {C:attention}Urban Nightmare Stake{}',
                },
            },
            b_pmcmod_galaxyDeck = {
                name = 'Galaxy Deck',
                text = {
                    "Starts with an Eternal",
                    "{C:attention,T:j_pmcmod_childrenOfTheGalaxy}Pebble{} page.",
                    "No money from extra hands,",
                    "discards or interest.",
                    "Shop prices increased"
                },
                unlock = {
                    'Win a run with {C:attention}Art Deck{}',
                    'in at least {C:attention}Urban Nightmare Stake{}',
                },
            },
            b_pmcmod_censoredDeck = {
                name = 'Censored Deck',
                text = {
                    "Start with an eternal",
                    "{C:attention,T:j_pmcmod_censored}Censored{} page.",
                    "{C:blue}+4 hands{}",
                },
                unlock = {
                    'Win a run with {C:attention}Language Deck{}',
                    'in at least {C:attention}Urban Nightmare Stake{}',
                },
            },
        },
        Blind={},
        Edition={
            e_pmcmod_charge = {
                name = "Charge",
                text = {
                    "Retriggers Joker once",
                    "Count reaches {C:blue}4",
                    "Count: {C:blue}#1#{}"
                },
            },
        },
        Enhanced={
            m_pmcmod_bleed = {
                name = "Bleed Card",
                text = {
                    "Gains {C:red}1{} Mult permanently for",
                    "every {C:red}Bleed{} card scored in the",
                    "played hand.",
                    "Remaining count: #1#"
                },
            },
            m_pmcmod_burn = {
                name = "Burn Card",
                text = {
                    "Gives {C:chips}0.001%{} of the total Encounter",
                    "score as extra chips",
                },
            },
            m_pmcmod_poise = {
                name = "Poise Card",
                text = {
                    "Has a {C:green}#3# in #4#{} chance to give {X:red,C:white}X#1#{} Mult",
                    "Chance increase every time the card is scored.",
                    "Chance resets every time the effect triggers."

                },
            },
            m_pmcmod_rupture = {
                name = "Rupture Card",
                text = {
                    "Give stacks of Rupture {C:attention}every time the card scores{}.",
                    "Non face cards give double stacks.",
                    "Give double the amount of stacks as {C:chips}Chips{}.",
                    "{C:inactive}(Current stacks: {C:attention}#1#{})"

                },
            },
            m_pmcmod_tremor = {
                name = "Tremor Card",
                text = {
                    "Enhance the effects of select Enhancements",
                    "when scored together."
                },
            },
            m_pmcmod_sinking = {
                name = "Sinking Card",
                text = {
                    "Reduces the target score",
                    "by {C:chips}5%{} when this",
                    "card is scored"
                },
            },
            m_pmcmod_pallid = {
                name = "Pallid Card",
                text = {
                    "{C:chips}#1#{} Chips",
                },
            },
        },
        Joker={
            j_pmcmod_oswald = {
                name = 'Oswald',
                text = {
                    "Gives a {C:attention}random effect{} every played Hand",
                    "Last effect: #1#"
                },
                unlock = {
                    'Win a run with the {C:attention}Aspect of Oswald Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_kalo = {
                name = 'Kalo',
                text = {
                    {"Played cards with {C:diamonds}#3#{} suit",
			        "give {C:mult}+10{} Mult when scored."},
    			    {"Value increases by {C:mult}#2#{} for every member of",
                    "{C:gold}The Thumb{} currently on the team."},
                    {"Has a {C:green} #4# in #5# {}chance to change every",
                    "scored {C:diamonds}#3#{} Card into a {C:attention}Wild Card{}.",
                    "{C:inactive}(Currently {C:mult}+#1#{} Mult)"},
                },
                unlock = {
                    'Win a run with the {C:attention}Aspect of Kalo Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_katriel = {
                name = 'Katriel',
                text = {
                    {"Played cards with {C:hearts}#3#{} suit ",
			        "give {C:mult}+#1#{} Mult when scored."},
    			    {"Value increases by {C:mult}1{} for every {C:attention}Wild Card",
                    "currently in the deck.",
                    "{C:inactive}(Currently {C:mult}+#2#{} Mult)"},
                },
                unlock = {
                    'Win a run with the {C:attention}Aspect of Katriel Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_denis = {
                name = 'Denis',
                text = {
                    {"Played cards with {C:spades}#3#{} suit ",
			        "give {C:mult}+#1#{} Mult when scored."},
    			    {"Value increases by {C:mult}1{} for every {C:attention}Wild Card",
                    "currently in the deck.",
                    "{C:inactive}Currently {C:mult}+#2#{} Mult"},
                },
                unlock = {
                    'Win a run with the {C:attention}Aspect of Denis Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_boris = {
                name = 'Boris',
                text = {
                    {"Played cards with {C:clubs}#3#{} suit ",
			        "give {C:mult}+#1#{} Mult when scored."},
    			    {"Value increases by {C:mult}1{} for every {C:attention}Wild Card",
                    "currently in the deck.",
                    "{C:inactive}Currently {C:mult}+#2#{} Mult"},
                },
                unlock = {
                    'Win a run with the {C:attention}Aspect of Boris Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_angelaLoR = {
                name = 'Director Angela',
                text = {
                    {"Spawns up to {C:attention}#1# Perishable Keypages{}",
                    "at the start of the Encounter"},
                    {"At the start of the Shop,",
                    "{C:red}destroys all perished Keypages{}",
                    "and gains {C:chips}#3#{} Chips for every",
                    "Keypage destroyed.",
                    "{C:inactive}Currently {C:chips}+#2#{} Chips"}
                },
                unlock = {
                    'Win a run with {C:attention}Aspect of Angela Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_esther = {
                name = 'Esther',
                text = {
                    "If scored card is a {C:attention}Singleton{},",
                    "give it {X:red,C:white}X3{} Mult",
                },
                unlock = {
                    'Win a run with {C:attention}Aspect of Esther Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_gloria = {
                name = 'Gloria',
                text = {
                    "If scored card is a {C:attention}Singleton{},",
                    "give it {C:gold}$5{} Mult",
                },
                unlock = {
                    'Win a run with {C:attention}Aspect of Gloria Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_hubert = {
                name = 'Hubert',
                text = {
                    "If scored card is a {C:attention}Singleton{},",
                    "retrigger it once",
                },
                unlock = {
                    'Win a run with {C:attention}Aspect of Hubert Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_nikolai = {
                name = 'Nikolai',
                text = {
                    "Catalogues every bought Keypage.",
                    "Gain {C:mult}#2#{} Mult for every Keypage catalogued",
                    "{C:inactive}Currently {C:mult}#1#{} Mult"
                },
                unlock = {
                    'Win a run with {C:attention}Aspect of Nikolai Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_maxim = {
                name = 'Maxim',
                text = {
                    {"Gain {C:blue}5{} Charge every time",
                    "a Face Card scores, up to {C:blue}100{} Charge.",},
                    {"If Charge is >= 90, gain {C:gold}$#2#{} at",
                    "the end of the Scene"},
                    {"If a Number card is played, use",
                    "Charge equivalent to the card's rank",
                    "to retrigger it once.",
                    "{C:inactive}Currently {C:blue}#1#{} Charges"}

                },
                unlock = {
                    'Win a run with {C:attention}Aspect of Maxim Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_rudolph = {
                name = 'Rudolph',
                text = {
                    "{C:dark_edition}Charge{} cards now",
                    "gain {C:attention}double charges{} per trigger",
                },
                unlock = {
                    'Win a run with {C:attention}Aspect of Rudolph Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_angelica = {
                name = 'Angelica',
                text = {
                    "{C:mult}#1#{} Mult",
                },
                unlock = {
                    'Win a run with {C:attention}Aspect of Angel- Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_puppeteer = {
                name = 'The Puppeteer',
                text = {
                    {"At the start of the Encounter,",
                    "transforms a random Keypage into",
                    "a {C:red}Puppet{}, based on the rarity.",},
                    {"Puppets destroy themselves after triggering 5 times",
                    "When a Puppet gets destroyed by any means,",
                    "gain {C:mult}half of their mult value{}",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)"}
                },
                unlock = {
                    'Win a run with {C:attention}Aspect of Angel- Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_yisang = {
                name = 'The First Sinner, Yi Sang',
                text = {
                    {"Gains {X:mult,C:white}X#2#{} for each {C:attention}unique{}",
                    "{C:planet}Sinner{} card used."},
                    {"Gains an additional {X:mult,C:white}X#3#{} for each",
                    "{C:planet}Sinner{} card used.",
                    "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)"},

                },
                unlock = {
                    'Win a run with the {C:attention}Ishmael Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_ishmael = {
                name = 'The Eighth Sinner, Ishmael',
                text = {
                    {"Has a {C:green}#4# in #5#{} chance",
                    "to remove Pallid from all scored cards.",
                    "Gain {C:mult}10{} Mult for every Pallid removed."},
                    {"If there's no more Pallid cards and Ahab",
                    "is present, {C:red}destroy her{} at the end of the Encounter",
                    "and gain {X:mult,C:white}X3{} Mult",
                    "{C:inactive}Currently {C:mult}+#2#{} Mult",
                    "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)"},

                },
                unlock = {
                    'Win a run with the {C:attention}Ishmael Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_heathcliff = {
                name = 'The Seventh Sinner, Heathcliff',
                text = {
                    {"At the start of every Scene, destroy a random",
                    "{C:dark_edition}Negative{} Key Page."},
                    {"Gains {C:dark_edition}+1{} Key Page Slot",
                    "for every 2 {C:dark_edition}Negative{} Key Page destroyed"},
                    {"{C:inactive}(Currently {C:dark_edition}+#2#{C:inactive} Key Page slots)",}

                },
                unlock = {
                    'Win a run with the {C:attention}Heathcliff Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_donQuixote = {
                name = 'The Third Sinner, Don Quixote',
                text = {
                    "Drains {C:mult}Perma Mult{} from every score card.",
                    "Gains {C:attention}triple{} the drained value as {C:chips}Chips",
                    "{C:inactive}(Currently {C:chips}#1#{C:inactive} Chips)"

                },
                unlock = {
                    'Win a run with the {C:attention}Don Quixote Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_angela = {
                name = 'Assistant Angela',
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
                    {"Selling another {C:attention}Keypage{} during a",
                    "{C:attention}Reception{} disables its effect.",
			        "Gain {X:mult,C:white}X#1#{} Mult for every",
                    "Reception disabled this way."},
                    {"During Receptions, if it's not disabled,",
                    "lose {C:gold}4${} for each card scored."},
                    {"If a Reception is disabled more than",
                    "{C:attention}2 times{}, or total money is 0 or less,",
                    "{C:red}suffer a meltdown{}."},
                    {"If this Keypage survives through 4 Acts,",
                    "{C:attention}gain another chance.",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                    "{C:inactive}({C:red}#3#{C:inactive} Acts survived)"},
                },
                unlock = {
                    'Win a run with {C:attention}L Corp Deck{}',
                    'in at least {C:attention}Canard Stake{}',
                },
            },
            j_pmcmod_elijah = {
                name = 'Elijah',
                text = {
                    {"Gains {C:mult}2{} Mult for {C:attention}every{}",
                    "{C:attention}Poker Hand level above 1{}."},
			        {"If any Poker Hand level",
                    "goes {C:attention}above 3{}, {C:red}suffer a meltdown{}."},
                    {"If this Keypage survives through 4 Acts,",
                    "{C:attention}gain another chance.",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)",
                    "{C:inactive}({C:red}#2#{C:inactive} Acts survived)"},
                },
                unlock = {
                    'Win a run with {C:attention}L Corp Deck{}',
                    'in at least {C:attention}Urban Myth Stake{}',
                },
            },
            j_pmcmod_giovanni = {
                name = 'Giovanni',
                text = {
                    {"Gains {C:mult}7 Mult{} and {C:chips}10 Chips{}",
                    "at the end of every Act."},
                    {"Requires {C:attention}#1# consumable(s){} to be used every Act.",
                    "Required consumable usage goes up every ante."},
                    {"If consumable usage is not met after",
                    "defeating a Reception, {C:red}suffer a meltdown{}."},
                    {"If this Keypage survives through 4 Acts,",
                    "{C:attention}gain another chance.",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                    "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips)",
                    "{C:inactive}(Current consumables used: {C:chips}#4#{C:inactive})",
                    "{C:inactive}({C:red}#5#{C:inactive} Acts survived)"},
                },
                unlock = {
                    'Win a run with {C:attention}L Corp Deck{}',
                    'in at least {C:attention}Urban Legend Stake{}',
                },
            },
            j_pmcmod_gabriel = {
                name = 'Gabriel',
                text = {
                    {"Gains {C:mult}1{} Mult for every {C:hearts}Hearts{} and {C:diamonds}Diamonds{} card scored.",
                    "Gains {C:chips}3{} Chips for every {C:spades}Spades{} or {C:clubs}Clubs{} card scored."},
                    {"If the difference between the amount of {C:spades}Spades{}/{C:clubs}Clubs{}",
                    "and {C:hearts}Hearts{}/{C:diamonds}Diamonds{} surpass 6, {C:red}suffer a meltdown{}."},
                    {"If this Keypage survives through 4 Acts,",
                    "{C:attention}gain another chance.",
                    "{C:inactive}(Total {C:hearts}Hearts{}: #3#)",
                    "{C:inactive}(Total {C:diamonds}Diamonds{}: #4#)",
                    "{C:inactive}(Total {C:spades}Spades{}: #1#)",
                    "{C:inactive}(Total {C:clubs}Clubs{}: #2#)",
                    "{C:inactive}(Currently {C:mult}+#5#{C:inactive} Mult)",
                    "{C:inactive}(Currently {C:chips}+#6#{C:inactive} Chips)",
                    "{C:inactive}({C:red}#7#{C:inactive} Acts survived)"},
                },
                unlock = {
                    'Win a run with {C:attention}L Corp Deck{}',
                    'in at least {C:attention}Urban Legend Stake{}',
                },
            },
            j_pmcmod_daniel = {
                name = 'Daniel',
                text = {
                    {"Starts with {X:mult,C:white}X2{} Mult",
                    "Every time a card scores,",
                    "increase Mult by {X:mult,C:white}X#2#{}.",
                    "Every card Discarded decreases Mult",
                    "by {X:mult,C:white}X#2#{}"},
                    {"If the Mult reaches {X:mult,C:white}X1{},",
                    "{C:red}suffer a meltdown{}."},
                    {"If this Keypage survives through 4 Acts,",
                    "{C:attention}gain another chance.",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
                    "{C:inactive}({C:red}#3#{C:inactive} Acts survived)"},
                },
                unlock = {
                    'Win a run with {C:attention}L Corp Deck{}',
                    'in at least {C:attention}Urban Nightmare Stake{}',
                },
            },
            j_pmcmod_kali = {
                name = 'Kali',
                text = {
                    {"Gets {C:mult}25{} Mult for",
                    "every {C:blue}Hand{} played this Scene."},
                    {"If the last {C:blue}Hand{} is played,",
                    "{C:red}suffer a meltdown{}."},
                    {"If this Keypage survives through 4 Acts,",
                    "{C:attention}gain another chance.",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)",
                    "{C:inactive}({C:red}#2#{C:inactive} Acts survived)"},
                },
                unlock = {
                    'Win a run with {C:attention}L Corp Deck{}',
                    'in at least {C:attention}Star of the City Stake{}',
                },
            },
            j_pmcmod_benjamin = {
                name = 'Benjamin',
                text = {
                    {"Gains {X:mult,C:white}X#4#{} Mult per unique",
                    "Tarot or Spectral used."},
                    {"Counts elapsed time.",
                    "If the timer reaches {C:red}666{} seconds,",
                    "{C:red}suffer a meltdown{}."},
                    {"If this Keypage survives through 4 Acts,",
                    "{C:attention}gain another chance.",
                    "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)",
                    "{C:inactive}({C:red}#5#{C:inactive} Acts survived)"},
                },
                unlock = {
                    'Win a run with {C:attention}L Corp Deck{}',
                    'in at least {C:attention}Imputitas Civitatis Stake{}',
                },
            },
            j_pmcmod_garion = {
                name = 'Garion',
                text = {
                    {"If the first hand of the Scene",
                    "has {C:attention}more than one card{},",
                    "destroy all scored cards and",
                    "add {X:mult,C:white}X#2#{} Mult per card destroyed."},
                    {"If the amount of cards currently",
                    "in the deck is less than half",
                    "the original amount of cards,",
                    "{C:red}suffer a meltdown{}."},
                    {"If this Keypage survives through 4 Acts,",
                    "{C:attention}gain another chance.",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
                    "{C:inactive}({C:red}#3#{C:inactive} Acts survived)"},
                },
                unlock = {
                    'Win a run with {C:attention}L Corp Deck{}',
                    'in at least {C:attention}Imputitas Civitatis Stake{}',
                },
            },
            j_pmcmod_lisa = {
                name = 'Lisa',
                text = {
                    {"Ace cards give {C:mult}#2#{} Mult",
                    "If {C:attention}Enoch{} is not present at the start",
                    "of an Encounter, spawn him in."},
                    {"Every time {C:attention}Enoch{} is destroyed,",
                    "increase the Ace Mult by {C:mult}#3#{}."},
                    {"If {C:attention}Enoch{} dies more than 3 times, {C:red}suffer a meltdown{}."},
                    {"If this Keypage survives through 4 Acts,",
                    "{C:attention}gain another chance.",
                    "{C:inactive}(Witnessed Enoch's death {C:mult}#1#{C:inactive} times)",
                    "{C:inactive}({C:red}#4#{C:inactive} Acts survived)"},
                    
                },
                unlock = {
                    'Win a run with {C:attention}L Corp Deck{}',
                    'in at least {C:attention}Urban Plague Stake{}',
                },
            },
            j_pmcmod_enoch = {
                name = 'Enoch',
                text = {
                    {"Gets {C:chips}#2#{} chips per played card."},
                    {"If this values reaches {C:chips}100{},",
                    "{C:red}destroy this card{} at the end of the Encounter.",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"},
                },
                unlock = {
                    'Win a run with {C:attention}L Corp Deck{}',
                    'in at least {C:attention}Urban Plague Stake{}',
                },
            },
            j_pmcmod_hermann = {
                name = 'Hermann',
                text = {
                    {"On the {C:attention}first played hand{},",
                    "randomize the scoring cards' enhancements."},
                    {"Also has {C:green}#1# in #2#{} chance of giving",
                    "them a random {C:attention}seal{} and {C:green}#1# in #3#{} chance",
                    "of giving them a random {C:dark_edition}Edition{}."},
                },
                unlock = {
                    'Win a run with {C:attention}K Corp Deck{}',
                    'in at least {C:attention}Impuritas Civitatis Stake{}',
                },
            },
            j_pmcmod_gubo = {
                name = 'Gubo',
                text = {
                    {"At the {C:attention}start of the Encounter{},",
                    "has a {C:green}#4# in #5#{} chance do aim at",
                    "a random {C:attention}Keypage{}."},
                    {"Gubo will shoot at the selected",
                    "Keypage at the end of the Encounter."},
                    {"If the Keypage is {C:green}Paperback{} or",
			        "{C:blue}Hardcover{}, gain either {C:mult}#2#{} or",
                    "{C:mult}#3#{} Mult depending on the rarity.",
                    "This value doubles if the Keypage is of a {C:red}Sinner{}",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                    "{C:inactive}(Currently aiming at: {C:red}#6#{C:inactive})",
                    "{C:inactive}This page has a hidden interaction."},
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
                    "into a {C:attention}random Keypage{}.",
                    "{C:green}#1# in #2#{} change into a Keypage",
                    "of a higher rarity",
                    "(up to {C:purple}Limited{})"
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
                    "{C:green}#2# in #3#{} chance this Keypage {C:red}destroys{}",
                    "another Keypage at the end of",
                    "the Scene and leaves",
                },
            },
            j_pmcmod_aya = {
                name = 'Aya',
                text = {
                    "{C:chips}+#1#{} Chips",
                    "{C:green}#2# in #3#{} chance this Keypage {C:red}destroys",
                    "{C:red}itself{} at the end of the Scene",
                    "and leaves a {C:tarot}Gas Mask{}",
                },
            },
            j_pmcmod_yuri = {
                name = 'Yuri',
                text = {
                    {"{C:green}#1# in #2#{} chance this Keypage destroys",
                    "itself at the end of the Scene."},
                    {"If this Keypage survives {C:red}#3#{} Scenes,",
                    "sell it to get a {C:money, T:c_soul}Golden Bough{}",
                    "Current Scenes survived: {C:red}#4#{}"},
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
                    "Triples played {C:attention}Poker Hand base value{}",
                }
            },
            j_pmcmod_effie = {
                name = 'Effie',
                text = {
                    {"Gain{C:mult} +#2# {}Mult if the played hand",
                    "is a{C:attention} #3#{}."},
                    {"Value resets if the hand",
                    "played doesn't contain it.",
                    "(Poker hand changes after every Scene)",
                    "{C:inactive}(Currently{C:mult} #1# {C:inactive}Mult)"}
                },
            },
            j_pmcmod_saude = {
                name = 'Saude',
                text = {
                    {"Gain{C:chips} +#2# {}Chips if the played hand",
                    "contains a{C:attention} #3# {}card."},
                    {"Value resets if the hand",
                    "played doesn't contain it.",
                    "(Suit changes after every Scene) ",
                    "{C:inactive}(Currently{C:chips} #1# {C:inactive}Chips)"},
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
                    {"Grants {C:chips}#1#{} Chips if the played",
                    "Poker Hand contains a {C:attention}Flush{}"},
                    {"Additionaly, has {C:green}#2# in #3#{} chance",
                    "to spawn in a {C:attention, T:c_soul}Golden Bough{}"},
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
                    {"When {C:attention}Normal Encounter{} or {C:attention}Risky Encounter{}",
                    "is selected, adds a random card with a red seal."},
                    {"Gains {C:mult}+#1#{} Mult for every red seal in deck",
                    "{C:inactive}(Currently {C:mult} +#2# {C:inactive} Mult)"},
                },
                unlock = {
                    'Win a run with {C:attention}N Corp Deck{}',
                    'in at least {C:attention}Urban Myth Stake{}',
                },
            },
            j_pmcmod_papaBongy = {
                name = 'Papa Bongy',
                text = {
                    {"When an {C:attention}Encounter{} starts,",
                    "spawn in up to 4 random Bongys,",
                    "up to 20 Bongys in total for the whole game."},
                    {"For every Bongys defeated, Papa Bongy",
                    "gets a different bonus:",
                    "Bongy (Soy Sauce): {C:chips}10{} Chips",
                    "Bongy (Red Sauce): {C:mult}5{} Mult",
                    "Bongy (Normal): {X:mult,C:white}X0.1{} Mult",
                    "Bongy (Chef): {C:gold}1${} at the end of the Encounter",
                    "{C:inactive}(Currently{C:chips} #1# {C:inactive} Chips)",
                    "{C:inactive}(Currently{C:mult} #2# {C:inactive} Mult)",
                    "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)",
                    "{C:inactive}(Currently{C:gold} #4#$ {C:inactive})"},
                },
                unlock = {
                    'Win a run with {C:attention}K Corp Deck{}',
                    'in at least {C:attention}Urban Legend Stake{}',
                },
            },
            j_pmcmod_dongrang = {
                name = 'Dongrang',
                text = {
                    {"At the end of every Reception, adds",
                    "{C:dark_edition}Polychrome{} to a random editionless Keypage."},
                    {"Gains {X:mult,C:white}X#2#{} Mult for every {C:dark_edition}Polychrome{} Keypage",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"},
                },
                unlock = {
                    'Win a run with {C:attention}K Corp Deck{}',
                    'in at least {C:attention}Urban Nightmare Stake{}',
                },
            },
            j_pmcmod_dongrang_alt = {
                name = 'Dongrang, Who Denies All',
                text = {
                    {"At the end of every Reception, adds",
                    "{C:dark_edition}Polychrome{} to a random editionless Keypage"},
                    {"Gains {X:mult,C:white}X#2#{} Mult for every {C:dark_edition}Polychrome{} Keypage",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"},
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
                    {"Gives {C:money}$#1#{} per played hand, if the",
                    "respective Poker Hand's level is above 1."},
                    {"{C:green}#2# in #3#{} chance to {C:red}reduce the Poker Hand level{}"},
                },
                unlock = {
                    'Win a run with {C:attention}K Corp Deck{}',
                    'in at least {C:attention}Impuritas Civitatis Stake{}',
                },
            },
            j_pmcmod_marile = {
                name = 'Marile',
                text = {
                    {"This Keypage starts with {C:mult}#2#{} Mult",
                    "Lose {C:mult}8{} Mult for every enhanced Keypage",
                    "and {C:mult}2{} Mult for every enhanced Card."},
                    {"Destroys this Keypage on the next played hand",
                    "if Mult is 0 or less",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)"},
                },
            },
            j_pmcmod_ran = {
                name = 'Ran',
                text = {
                    {"This Keypage starts with {C:chips}#2#{} Chips",
			        "Lose {C:chips}24{} Chips for every enhanced Keypage",
			        "and {C:chips}5{} Chips for every enhanced Card."},
			        {"Destroys this Keypage on the next played hand",
			        "if Chips is 0 or less",
			        "{C:inactive}(Currently {C:chips}#1#{C:inactive} Chips)"},
                },
            },
            j_pmcmod_niko = {
                name = 'Niko',
                text = {
                    "Adds {C:mult}Mult{} equal to {C:attention}triple{} the amount",
			        "of Cards in hands after the hand is played",
                },
            },
            j_pmcmod_ahab = {
                name = 'Ahab',
                text = {
                    {"Start every blind with a {C:tarot}Hunt Spectral card."},
                    {"Gains {X:mult,C:white}X#1#{} Mult every time a Pallid card is scored",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"},
                },
                unlock = {
                    'Win a run with the {C:attention}Ishmael Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_ahab_alt = {
                name = 'Captain of the Pequod, Ahab',
                text = {
                    {"Start every blind with a {C:tarot}Hunt Spectral card."},
                    {"Gains {X:mult,C:white}X#1#{} Mult every time a Pallid card is scored",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"},
                },
            },
            j_pmcmod_queequeg = {
                name = 'Queequeg',
                text = {
                    "Pallid cards now give {C:gold}$1{}",
                },
                unlock = {
                    'Win a run with the {C:attention}Ahab Keypage{}',
                },
            },
            j_pmcmod_queequeg_alt = {
                name = 'Harpooner of The Pequod, Queequeg',
                text = {
                    "Pallid cards now give {C:gold}$1{}",
                },
                unlock = {
                    'Win a run with the {C:attention}Ahab Keypage{}',
                },
            },
            j_pmcmod_starbuck = {
                name = 'Starbuck',
                text = {
                    "Pallid cards now give {C:mult}#1#{} Mult",
                },
                unlock = {
                    'Win a run with the {C:attention}Ahab Keypage{}',
                },
            },
            j_pmcmod_starbuck_alt = {
                name = 'First Mate of The Pequod, Starbuck',
                text = {
                    "Pallid cards now give {C:mult}#1#{} Mult",
                },
                unlock = {
                    'Win a run with the {C:attention}Ahab Keypage{}',
                },
            },
            j_pmcmod_stubb = {
                name = 'Stubb',
                text = {
                    "{C:green}1 in 2 chance{} to retrigger Pallid cards",
                },
                unlock = {
                    'Win a run with the {C:attention}Ahab Keypage{}',
                },
            },
            j_pmcmod_pip = {
                name = 'Pip',
                text = {
                    "Pallid cards now give {C:chips}#1#{} Chips",
                },
                unlock = {
                    'Win a run with the {C:attention}Ahab Keypage{}',
                },
            },
            j_pmcmod_pip_alt = {
                name = 'Crew member of The Pequod, Pip',
                text = {
                    "Pallid cards now give {C:chips}10{} Chips",
                },
                unlock = {
                    'Win a run with the {C:attention}Ahab Keypage{}',
                },
            },
            j_pmcmod_pilot = {
                name = 'Pilot',
                text = {
                    "Spawn in a random {C:planet}Sinner{} card at the {C:attention}start of the Encounter{}",
                },
            },
            j_pmcmod_smee = {
                name = 'Smee',
                text = {
                    "If hand played contains a {C:attention}Flush{}, adds",
                    "triple the base chip score of the",
                    "{C:attention}Middle{} card as Mult"
                },
            },
            j_pmcmod_ricardo = {
                name = 'Ricardo',
                text = {
                    {"Starts with {C:mult}#2#{} Mult"},
                    {"After this card is destroyed, come back",
                    "at the end of the {C:attention}Shop{} and gain",
                    "{C:mult}#3#{} Mult"},
                    {"Gains {X:mult,C:white}X2{} Mult if {C:attention}Hair Coupon{} was redeemed",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)",
                    "{C:inactive}(Currently {X:mult,C:white}X#4#{C:inactive} Mult)"},
                },
                unlock = {
                    'Win a run with the {C:attention}Smee Keypage',
                },
            },
            j_pmcmod_indigoElder = {
                name = 'Indigo Elder',
                text = {
                    {"When a {C:attention}Normal Encounter{} starts,",
                    "this Keypage will memorize the position it is in."},
                    {"Depending on the position, it'll get a {C:red}debuff{}:",
                    "2   -> {C:mult}-#6#{} Mult for each scoring card",
                    "3   -> {C:chips}-#7#{} Chips for each scoring card",
                    "4   -> {C:gold}-$#8#{} for each scoring card",
                    ">=5 -> {X:mult,C:white}X#9#{} Mult"},
                    {"If the Reception is cleared, the memorized",
                    "position resets and this Keypage gets a {C:blue}bonus{}:",
                    "2   -> {C:mult}+15{} Mult for each scoring card",
                    "3   -> {C:chips}+30{} Chips for each scoring card",
                    "4   -> {C:gold}+2${} at the end of the Scene",
                    ">=5 -> {X:mult,C:white}+X1{} Mult"},
                    {"If set on position 1, {C:attention}all effects apply.",
                    "{C:red}The debuff goes up for every Act cleared",
                    "{C:inactive}(Currently {C:mult}#1#{} Mult)",
                    "{C:inactive}(Currently {C:chips}#2#{} Chips)",
                    "{C:inactive}(Currently {C:gold}$#3#{})",
                    "{C:inactive}(Currently {X:mult,C:white}#4#{} Mult)"},
                    {"{C:inactive}(Current position: {C:red}#5#{})"},
                },
            },
            j_pmcmod_catherine = {
                name = 'Catherine',
                text = {
                    "Does nothing.",
                },
            },
            j_pmcmod_catherine_alt = {
                name = '___________',
                text = {
                    "Does nothing.",
                },
            },
            j_pmcmod_everyCatherine = {
                name = 'Every Catherine',
                text = {
                    {"Always {C:dark_edition}Negative"},
                    {"At the end of every Reception,",
                    "creates a {C:dark_edition}Negative{} copy of a random Keypage"},
                    {"Has a {C:green}#1# in #2#{} chance to destroy itself after that.",
                    "This chance goes up by 1 for every successful trigger"}
                },
            },
            j_pmcmod_nelly = {
                name = 'Nelly',
                text = {
                    "Creates a {C:dark_edition}Negative Perishable Keypage{}",
                    "after every Reception",
                },
                unlock = {
                    'Win a run with the {C:attention}Erlking Keypage',
                },
            },
            j_pmcmod_erlking = {
                name = 'Erlking',
                text = {
                    "Gains {X:mult,C:white}X1{} Mult for every {C:dark_edition}Negative{} Keypage",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
                },
            },
            j_pmcmod_hindley = {
                name = 'Hindley',
                text = {
                    {"Starts with {C:chips}20{} Chips"},
                    {"Gains {C:chips}20{} Chips for every",
                    "Negative Keypage",
                    "{C:inactive}(Currently {C:chips}#1#{C:inactive} Chips)"},
                },
                unlock = {
                    'Win a run with the {C:attention}Nelly Keypage',
                },
            },
            j_pmcmod_linton = {
                name = 'Linton',
                text = {
                    "Sell to get a {C:dark_edition}Negative Tag{}",
                },
                unlock = {
                    'Win a run with the {C:attention}Nelly Keypage',
                },
            },
            j_pmcmod_josephine = {
                name = 'Josephine',
                text = {
                    {"Starts with {C:mult}8{} Mult"},
                    {"Gains {C:mult}8{} Mult for every",
                    "Negative Keypage",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)"},

                },
                unlock = {
                    'Win a run with the {C:attention}Nelly Keypage',
                },
            },
            j_pmcmod_olga = {
                name = 'Molar Boatworks Olga',
                text = {
                    "Every card discarded gives this Keypage {X:mult,C:white}X#2#{} Mult,",
                    "up to {X:mult,C:white}X3{} Mult",
                    "Resets this value after every Reception",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
                },
                unlock = {
                    'Win a run with the {C:attention}Olga Keypage{}',
                },
            },
            j_pmcmod_rain = {
                name = 'Molar Boatworks Rain',
                text = {
                    "Every card discarded gives this Keypage {C:chips}#2#{} Chips,",
                    "up to {C:chips}60{} Chips",
                    "Resets this value after every Reception",
                    "{C:inactive}(Currently {C:chips}#1#{C:inactive} Chips)",
                },
                unlock = {
                    'Win a run with the {C:attention}Rain Keypage{}',
                },
            },
            j_pmcmod_mika = {
                name = 'Molar Boatworks Mika',
                text = {
                    "Every card discarded gives this Keypage {C:mult}#2#{} Mult,",
                    "up to {C:mult}30{} Mult",
                    "Resets this value after every Reception",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)",
                },  
                unlock = {
                    'Win a run with the {C:attention}Mika Keypage{}',
                },
            },
            j_pmcmod_moses = {
                name = 'Moses',
                text = {
                    "{C:mult}X#1#{} on every played {C:attention}7{}",
                },
                unlock = {
                    'Score over 100000 chips,',
                    'with a score divisible by 7',
                },
            },
            j_pmcmod_ezra = {
                name = 'Ezra',
                text = {
                    "Retriggers {C:attention}7{} cards",
                },
                unlock = {
                    'Score over 100000 chips,',
                    'with a score divisible by 7',
                },
            },
            j_pmcmod_santata = {
                name = 'Santata',
                text = {
                    "EGO Gifts are {C:attention}free",
                },
                unlock = {
                    'Unlocks at a very special date',
                },
            },
            j_pmcmod_crayon = {
                name = 'Crayon',
                text = {
                    "{c:green}#1# in #2#{} chance to create",
                    "a random {C:attention}Consumable{} at the start of",
                    "every Encounter {C:inactive}(must have room)"
                }
            },
            j_pmcmod_domino = {
                name = 'Domino',
                text = {
                    "{c:green}#2# in #3#{} chance to create",
                    "a {C:attention}Coupon Tag{} after every Reception"
                }
            },
            j_pmcmod_dadQuixote = {
                name = 'Don Quixote',
                text = {
                    "Gains {C:red}Mult{} based on the",
                    "total Perma Mult in all cards in the deck",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)"
                },
                unlock = {
                    'Win a run with the {C:attention}Don Quixote Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_sancho = {
                name = 'Sancho',
                text = {
                    "Retriggers {C:hearts}Hearts{} cards",
                    "at a {C:green}#2# in #3#{}chance.",
                    "If the card has {C:red}Bleed{},",
                    "always retriggers."
                },
                unlock = {
                    'Win a run with the {C:attention}Don Quixote Keypage{}',
                    'in at least {C:attention}The City Stake{}',
                },
            },
            j_pmcmod_dulcinea = {
                name = 'Dulcinea',
                text = {
                    "Gain {C:mult}#2#{} Mult for every",
                    "{C:hearts}Hearts{} or {C:red}Bleed card scored",
                    "If any other card is played, lose the same amount.",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)",
                },
                unlock = {
                    'Win a run with the {C:attention}Sancho Keypage{}',
                },
            },
            j_pmcmod_barber = {
                name = 'Barber',
                text = {
                    "Gain {C:chips}#2#{} Chips for every",
                    "{C:hearts}Hearts{} or {C:red}Bleed card scored",
                    "If any other card is played, lose the same amount.",
                    "{C:inactive}(Currently {C:chips}#1#{C:inactive} Chips)",
                },
                unlock = {
                    'Win a run with the {C:attention}Dulcinea Keypage{}',
                },
            },
            j_pmcmod_priest = {
                name = 'Priest',
                text = {
                    "{C:hearts}Heart{} or {C:red}Bleed{} cards left in hand",
                    "give {X:mult,C:white}X#1#{}"
                },
                unlock = {
                    'Win a run with the {C:attention}Barber Keypage{}',
                },
            },
            j_pmcmod_bari = {
                name = 'Bari',
                text = {
                    "Played {C:attention}Steel{} cards",
                    "give {X:mult,C:white}X#1#{}"
                },
                unlock = {
                    'Win a run with the {C:attention}Director Angela Keypage{}',
                },
            },
            j_pmcmod_cesara = {
                name = 'Cesara',
                text = {
                    "If a {C:attention}Flush{} is played while",
                    "this card is in the {C:attention}first position{},",
                    "increase the {C:attention}Rank{} of all scored cards"
                }
            },
            j_pmcmod_alessio = {
                name = 'Alessio',
                text = {
                    "If a {C:attention}Flush{} is played while",
                    "this card is in the {C:attention}first position{},",
                    "change the {C:attention}Suit{} of all scored cards"
                }
            },
            j_pmcmod_jiaXichun = {
                name = 'Jia Xichun',
                text = {
                    "Gives a random {C:attention}Tag{}",
                    "at the end of the Reception"
                }
            },
            j_pmcmod_hugo = {
                name = 'Hugo',
                text = {
                    "Every {C:attention}Keypage{} sold",
                    "gives an extra {C:gold}$#1#{}"
                }
            },
            j_pmcmod_camille = {
                name = 'Camille',
                text = {
                    "At the start of every blind,",
                    "take away {C:attention}5%{} of the current",
                    "money and add it to {C:mult}Mult{}",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)",
                },
                unlock = {
                    'Obtain more than {C:gold}$600{} in a run',
                },
            },
            j_pmcmod_paula = {
                name = 'Paula',
                text = {
                    "Decrease the Encounter scaling",
                }
            },
            j_pmcmod_romero = {
                name = 'Romero',
                text = {
                    "When {C:attention}Normal Encounter{} or {C:attention}Risky Encounter{}",
                    "is selected, if a {C:green}Paperback{} or {C:blue}Uncommon{} Bloodfiend Keypage",
                    "is present, destroy it and gain {C:mult}#2#{} Mult",
                    "(can only happen once per blind)",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)",
                }
            },
            j_pmcmod_hanul = {
                name = 'Han-ul',
                text = {
                    "When a {C:attention}#1#{} is played,",
                    "gain {C:gold}money{} based on the {C:attention}average value{}",
                    "of the Ranks played."
                },
                unlock = {
                    'Win a game without playing a single {C:attention}Flush{}',
                }
            },
            j_pmcmod_caiman = {
                name = 'Caiman',
                text = {
                    "Has a {C:green}#1# in #2#{} chance to give back any",
                    "{C:planet}Sinner{} card used"
                }
            },
            j_pmcmod_aengDu = {
                name = 'Aeng-Du',
                text = {
                    "Gives {X:red,C:white}X#1#{} Mult",
                    "on any hand that is not the first or last"
                }
            },
            j_pmcmod_jun = {
                name = 'Jun',
                text = {
                    "{X:red,C:white} X#1# {} Mult on the {C:attention}first",
                    "{C:attention}hand{} of scene",
                }
            },
            j_pmcmod_herbert = {
                name = 'Herbert',
                text = {
                    "When any item is bought directly from",
                    "the Store {C:red}(booster packs don't count),",
                    "has a {C:green}#1# in #2#{} chance to get the money spent back"
                },
                unlock = {
                    'Obtain more than {C:gold}$200{} in a run',
                },
            },
            j_pmcmod_mai = {
                name = 'Mai',
                text = {
                    "Disables a random Keypage at the",
                    "start of the Scene. Gives between",
                    "{X:red,C:white}X2{} and {X:red,C:white}X3{} Mult",
                    "based on the rarity of the disabled card."

                },
                unlock = {
                    'Obtain more than {C:gold}$200{} in a run',
                },
            },
            j_pmcmod_bumble = {
                name = 'Bumble',
                text = {
                    "Increase interest cap by {C:gold}$60{}.",
                    "Lose {C:gold}$1{} for every card played."
                },
                unlock = {
                    'Obtain more than {C:gold}$200{} in a run',
                },
            },
            j_pmcmod_timeRipper = {
                name = 'Time Ripper',
                text = {
                    {"Gains a stack for every Keypage sold,",
                    "up to 3 stacks",},
                    {"Sell this Keypage to return Acts",
                    "based on the amount of stacks"}
                },
                unlock = {
                    'Win a run with the {C:attention}Herbert Keypage{}',
                },
            },
            j_pmcmod_casetti = {
                name = 'Casetti',
                text = {
                    {"Scored {C:hearts}Hearts{} cards give {C:mult}#1#{} Mult for every Bleed card in deck",},
                    {"Has a {C:green}#3# in #4#{} chance to add Bleed to any scored {C:heart}Heart{} card",
                    "{C:inactive}(Currently {C:mult}#2#{C:inactive} Mult)",}
                },
                unlock = {
                    'Have 5 or more {C:red}Bleed Cards{} in your deck',
                },
            },
            j_pmcmod_sasha = {
                name = 'Sasha',
                text = {
                    "Has a {C:green}#1# in #2#{} chance to add {`C:dark_edition}Charge{}",
                    "to any scored {C:red}Bleed{} Card"
                },
                unlock = {
                    'Have 3 or more {C:red}Bleed Cards{} in your deck',
                },
                
            },
            j_pmcmod_hohenheim = {
                name = 'Hohenheim',
                text = {
                    {"After obtaining this Keypage",
                    "compile the names of every destroyed Keypage",},
                    {"At the end of the Encounter,",
                    "revive a random Keypage",
                    "with Perishable and Negative"}
                }
            },
            j_pmcmod_alyssa = {
                name = 'Alyssa',
                text = {
                    "Gains {C:mult}#1#{} Mult for",
                    "every {C:mult}Mult{} Card in deck",
                    "{C:inactive}(Currently {C:mult}#2#{C:inactive} Mult)",
                }
            },
            j_pmcmod_marton = {
                name = 'Marton',
                text = {
                    "Gains {C:chips}#1#{} Chips for",
                    "every {C:chips}Bonus{} Card in deck",
                    "{C:inactive}(Currently {C:chips}#2#{C:inactive} Chips)",
                }
            },
            j_pmcmod_johann = {
                name = 'Johann',
                text = {
                    "If a card is about to be destroyed,",
                    "sacrifice itself instead."
                }
            },
            j_pmcmod_qingTao = {
                name = 'Qing Tao',
                text = {
                    "Face cards always count in scoring",
                }
            },
            j_pmcmod_shanSan = {
                name = 'Shan San',
                text = {
                    "If played is a {C:attention}Three of a Kind{},",
                    "give {C:gold}##{} at a {}## in ##{} chance"
                }
            },
            j_pmcmod_jumsoon = {
                name = 'Jumsoon',
                text = {
                    "If the first hand of the hound is a {C:attention}Flush{},",
                    "randomize all Keypages to others in the same rarity."
                }
            },
            j_pmcmod_garnet = {
                name = 'Garnet',
                text = {
                    "Copies any random unlocked Keypage.",
                    "Keypage changes every Scene.",
                    "{C:inactive}(Currently copying: {C:red}#1#)",
                }
            },
            j_pmcmod_catt = {
                name = 'Catt',
                text = {
                    "In {C:attention}Normal or Risky Encounters{}, if",
                    "the Encounter is about to fail, destroy a random",
                    "Keypage and win the Encounter.",
                    "Can only happen once by Act"
                }
            },
            j_pmcmod_jiaMu = {
                name = 'Jia Mu',
                text = {
                    "Disables a random amount of Keypages",
                    "Retrigger {C:attention}every other Keypage{} 0 to 2 times,",
                    "costing {C:gold}$#3#{} per retrigger"
                }
            },
            j_pmcmod_jiaQiu = {
                name = 'Jia Qiu',
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "Has a {C:green}#3# in #4#{} chance",
                    "to give {X:mult,C:white}X#2#{} Mult instead.",
                    "{C:inactive}This page has a hidden interaction.",
                }
            },
            j_pmcmod_linDaiyu = {
                name = 'Lin Daiyu',
                text = {
                    "If the first hand played {C:attention}starts with a 5{},",
                    "consume all stacks of Rupture from the scored cards",
                    "to score {X:mult,C:white}X0.1{} per 5 stacks consumed."
                }
            },
            j_pmcmod_xueBaochai = {
                name = 'Xue Baochai',
                text = {
                    "Reduce Encounter score by {C:attention}10%{}.",
                }
            },
            j_pmcmod_xianrenA = {
                name = 'Elder on a Branch',
                text = {
                    "If a card is about to be destroyed,",
                    "sacrifice itself instead."
                }
            },
            j_pmcmod_xianrenB = {
                name = 'Elder on a Wheelchair',
                text = {
                    "If a card is about to be destroyed,",
                    "sacrifice itself instead."
                }
            },
            j_pmcmod_xianrenC = {
                name = 'Elder in a Machine',
                text = {
                    "If a card is about to be destroyed,",
                    "sacrifice itself instead."
                }
            },
            j_pmcmod_xianrenD = {
                name = 'Elder in Monk Robes',
                text = {
                    "If a card is about to be destroyed,",
                    "sacrifice itself instead."
                }
            },
            j_pmcmod_xianrenE = {
                name = 'Elder in a Jar',
                text = {
                    "If a card is about to be destroyed,",
                    "sacrifice itself instead."
                }
            },
            j_pmcmod_xianrenF = {
                name = 'Elder in Trimmed Robes',
                text = {
                    "If a card is about to be destroyed,",
                    "sacrifice itself instead."
                }
            },
            j_pmcmod_ladyWang = {
                name = 'Lady Wang',
                text = {
                    "Scored 6s give {C:mult}#1#{} Mult",
                    "Mult increases by {C:mult}3{} for every Act",
                }
            },
            j_pmcmod_jiaZheng = {
                name = 'Jia Zheng',
                text = {
                    "Scored 6s give {C:chips}#1#{} Chips",
                    "Chips increases by {C:chips}5{} for every Act",
                }
            },
            j_pmcmod_jiaHuanChild = {
                name = 'Young Jia Huan',
                text = {
                    "Sell to get a {C:blue}Hardcover{} Keypage",
                }
            },
            j_pmcmod_xuePan = {
                name = 'Xue Pan',
                text = {
                    "At the start of the Encounter,",
                    "either {C:red}destroy{} a Keypage or",
                    "give it a random {C:dark_edition}Edition{}.",
                    "Keypages with {C:dark_edition}Editions{} can't be destroyed."
                }
            },
            j_pmcmod_wangZhao = {
                name = 'Wang Zhao',
                text = {
                    "Gain {C:gold}$1{} sell value every time a Reception is cleared",
                    "and gain {C:gold}$1{} sell value when any Encounter is cleared with one hand.",
                    "At the start of any non Reception Encounter, increase the value of",
                    "the adjascent Keypages by {C:gold}$4{}.",
                    "Lose {C:red}$2{} for each Keypage affected.",
                    "{C:red}Destroys itself if own sell value dips below $0."
                }
            },
            j_pmcmod_wangDawei = {
                name = 'Wang Dawei',
                text = {
                    "After a card has been {C:attention}scored 3 times{}",
                    "adds 15 Perma Mult and 30 Perma Chips to it.",
                    "This effect only happens once per card"
                }
            },
            j_pmcmod_wangQingshan = {
                name = 'Wang Qingshan',
                text = {
                    "If first hand of the Scene is a {C:attention}single 4{}",
                    "replace any Tags current queued up with random ones."
                }
            },
            j_pmcmod_wangRen = {
                name = 'Wang Ren',
                text = {
                    "Gives {C:gold}$#1#{} at the end of the Scene.",
                    "If current money dips below {C:gold}$100{},",
                    "destroy itself at the start of the next Scene."
                }
            },
            j_pmcmod_shiYihua = {
                name = 'Shi Yiuha',
                text = {
                    "When a {C:attention}Full House{} is played,",
                    "turns cards into {C:hearts}Heart{} Cards at a {C:green}1 in 3{} chance."
                }
            },
            j_pmcmod_shiHuazhen = {
                name = 'Shi Huazhen',
                text = {
                    "Gives {C:mult}#1#{} Mult for every character",
                    "in the name of the Keypage to the right."
                }
            },
            j_pmcmod_shiSijing = {
                name = 'Shi Sijing',
                text = {
                    "Gain {C:chips}#1#{} Chips when a Keypage is destroyed",
                    "{C:inactive}(Currently {C:chips}#2#{C:inactive} Chips)"
                }
            },
            j_pmcmod_kongSihui = {
                name = 'Kong Sihui',
                text = {
                    "{C:green}1 in 5{} chance to gain {C:gold}$5{} on any played card.",
                    "{C:green}1 in 20{} chance to destroy itself."
                }
            },
            j_pmcmod_kongYoujin = {
                name = 'Kong Youjin',
                text = {
                    "{C:green}1 in 5{} chance to gain {C:attention}retrigger{} any played card.",
                    "{C:green}1 in 20{} chance to destroy itself."
                }
            },
            j_pmcmod_xiren = {
                name = 'Xiren',
                text = {
                    "{C:green}1 in 5{} chance to gain {C:gold}$5{} on any played card.",
                    "{C:green}1 in 20{} chance to destroy itself."
                }
            },
            j_pmcmod_wei = {
                name = 'Wei',
                text = {
                    "Gives $1 for every remaining card left in hand",
                    "at the end of the Scene."
                }
            },
            j_pmcmod_zigong = {
                name = 'Zigong',
                text = {
                    "{C:green}1 in 5{} chance to gain {C:gold}$5{} on any played card.",
                    "{C:green}1 in 20{} chance to destroy itself."
                }
            },
            j_pmcmod_zilu = {
                name = 'Zilu',
                text = {
                    "{C:green}Rupture{} stacks at double the rate",
                }
            },
            j_pmcmod_nightDrifter = {
                name = 'Night Drifter',
                text = {
                    "Gives between X0.8 and X2 Mult.",
                    "Each consumable used decreases the min value by X0.1",
                    "and increases the max value by X1",
                    "Lose all stacks by the end of the Reception"
                }
            },
            j_pmcmod_leiHeng = {
                name = 'Lei Heng',
                text = {
                    "Roll a random value between 0 and 4.",
                    "If it lands on a 0, destroy the card to the left.",
                    "If it lands on any other number, retrigger the Keypage",
                    "to the left by the amount it landed on."
                }
            },
            j_pmcmod_valencina = {
                name = 'Valencina',
                text = {
                    "When handis played, if it has more than 1 card,",
                    "turn the last card into a Tremor card.",
                    "If Lucio is present and to the right, also",
                    "changes the first card into Tremor.",
                    "Lucio dies after this effect triggers 5 times."
                }
            },
            j_pmcmod_rien = {
                name = 'Rien',
                text = {
                    "Spawns in a random prescript at the start of the Act.",
                    "Gain {C:mult}#1#{} for every Prescript fullfilled.",
                    "Destroy itself if the Prescript fails.",
                    "If Sora is present and to the right, gains double",
                    "this value. Sora dies after this effect triggers 3 times.",
                }
            },
            j_pmcmod_matthias = {
                name = 'Matthias',
                text = {
                    "-1 Hand",
                    "First hand scored turns all cards into Burn cards,",
                    "costing $2 per Card. Cost increase by $2 for every Burn",
                    "Card in the Deck.",
                    "If Kira is present and to the right, reduces cost to $0",
                    "Kira dies after generating 5 Burn Cards"
                }
            },
            j_pmcmod_callisto = {
                name = 'Callisto',
                text = {
                    "Drains Mult and Bonus enhancements from cards,",
                    "gaining 80% of their value.",
                    "If Albina is present, double this value.",
                    "Albina dies after 5 Cards are drained."
                }
            },
            j_pmcmod_shiomiYoru = {
                name = 'Shiomi Yoru',
                text = {
                    "Poise cards gain double stacks at {C:green}1 in 2{} chance.",
                }
            },
            j_pmcmod_lucio = {
                name = 'Lucio',
                text = {
                    "Increase bonus value of Tremor cards by 20%.",
                    "If Valencina is present and to the right, bonus",
                    "becomes 50%. Lucio dies after triggering 5 Tremor cards.",
                }
            },
            j_pmcmod_sora = {
                name = 'Sora',
                text = {
                    "At the start of the Scene, Sora steals an Edition",
                    "from a random Keypage, gaining 20 Chips in the process.",
                    "Sora can't steal the same Edition twice in a row.",
                    "After 3 Scenes without stealing an Edition, Sora",
                    "reveals herself, doubling her current Chips count.",
                    "If Rein is present and to the right, double the scoring Chips.",
                    "Sora dies after triggering 4 times."
                }
            },
            j_pmcmod_kira = {
                name = 'Kira',
                text = {
                    "Burn Card gives $2",
                    "If Matthias is present and to the right,",
                    "Burn Cards will now give $6",
                    "Kira dies after triggering 5 Burn Cards"
                }
            },
            j_pmcmod_albina = {
                name = 'Albina',
                text = {
                    "If Hand played is a Pair of Spades,",
                    "change the first card into a Bonus Card",
                    "and the second card into a Mult Card",
                    "at a 1 in 2 chance",
                    "If Callisto is present and to the right,",
                    "chance becomes guaranteed.",
                    "Albina dies after triggering this effect 5 times."
                }
            },
            j_pmcmod_ren = {
                name = 'Ren',
                text = {
                    "Has a 1 in 2 chance to give Poise do scored cards.",
                    "If Shiomi Yoru is present and to the right,",
                    "chance becomes guaranteed.",
                    "Ren dies after triggering this effect 5 times.",
                }
            },
            j_pmcmod_ravi = {
                name = 'Ravi',
                text = {
                    "If this card is about to be destroyed, play dead",
                    "and debuff itself instead. Gain 10 Chips when this happens.",
                    "There's a 1 in 9 chance this fails."
                }
            },
            j_pmcmod_werner = {
                name = 'Werner',
                text = {
                    "Gains {C:chips}#2#{} Chips every time Ricardo is destroyed.",
                    "{C:inactive}(Currently {C:chips}#1#{C:inactive} Chips)",
                }
            },
            j_pmcmod_jamila = {
                name = 'Jamila',
                text = {
                    "Gain {C:mult}#1# Mult for every Voucher claimed.",
                    "{C:inactive}(Currently {C:mult}#2#{C:inactive} Mult)",
                }
            },
            j_pmcmod_aCertainSinclair = {
                name = 'A Certain Sinclair',
                text = {
                    "Counts how many times the {C:attention}Keypage to the left{} triggers.",
                    "Retrigger the {C:attention}Keypage to the right{} by that amount."
                }
            },
            j_pmcmod_arayaKid = {
                name = 'Araya (Child)',
                text = {
                    "30 Chips.",
                    "Changes into a different version",
                    "depending on the action done more frequently",
                    "last Act: cards scored, cards discarded or money used"
                }
            },
            j_pmcmod_arayaTeen = {
                name = 'Araya (Teen)',
                text = {
                    "Cards scored gain 6 Perma Chips",
                    "Changes into a different version",
                    "depending on the action done more frequently",
                    "last Act: cards scored, cards discarded or money used",
                    "If it's cards scored, go back to Child version instead."
                }
            },
            j_pmcmod_arayaYA = {
                name = 'Araya (Young Adult)',
                text = {
                    "Cards scored gain 3 Perma Mult.",
                    "Changes into a different version",
                    "depending on the action done more frequently",
                    "last Act: cards scored, cards discarded or money used",
                    "If it's cards discarded, go back to Child version instead."
                }
            },
            j_pmcmod_arayaAdult = {
                name = 'Araya (Adult)',
                text = {
                    "Cards scored gain $1 Perma money",
                    "Changes into a different version",
                    "depending on the action done more frequently",
                    "last Act: cards scored, cards discarded or money used",
                    "If it's money used, go back to Child version instead."
                }
            },
            j_pmcmod_vermillionCross = {
                name = 'Vermillion Cross',
                text = {
                    "Reduce Encounter score by half",
                }
            },
            j_pmcmod_sephirahHod = {
                name = 'Sephirah Hod',
                text = {
                    {"Selling another {C:attention}Keypage{} during a",
                    "{C:attention}Reception{} disables its effect."},
			        {"Gain {X:mult,C:white} X#1# {} Mult for every",
                    "Reception disabled this way",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"},
                },
            },
            j_pmcmod_sephirahMalkuth = {
                name = 'Sephirah Malkuth',
                text = {
                    "Gains {C:mult}3{} Mult for {C:attention}every{}",
                    "{C:attention}Poker Hand level above 1{}",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)",
                },
            },
            j_pmcmod_sephirahNetzach = {
                name = 'Sephirah Netzach',
                text = {
                    "Gains {C:mult}3 Mult{} and {C:chips}5 Chips{}",
                    "at the end of every Act for every {C:attention}Consumable",
                    "used during this Act.",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
                    "{C:inactive}(Current consumables used: {C:chips}#3#{C:inactive})",
                },
            },
            j_pmcmod_sephirahYesod = {
                name = 'Sephirah Yesod',
                text = {
                    {"Gains {C:mult}1{} Mult for every {C:hearts}Hearts{} and {C:diamonds}Diamonds{} card scored"},
                    {"Gains {C:chips}3{} Chips for every {C:spades}Spades{} or {C:clubs}Clubs{} card scored"},
                    {"{C:inactive}(Currently {C:mult}+#5#{C:inactive} Mult)",
                    "{C:inactive}(Currently {C:chips}+#6#{C:inactive} Chips)"},
                },
            },
            j_pmcmod_sephirahChesed = {
                name = 'Sephirah Chesed',
                text = {
                    {"Starts with {X:mult,C:white}X2{} Mult"},
                    {"Every time a card scores,",
                    "there's a {C:green}#3# in #4#{} chance to",
                    "increase Mult by {X:mult,C:white}X#2#{}.",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"},
                },
            },
            j_pmcmod_sephirahGebura = {
                name = 'Sephirah Gebura',
                text = {
                    {"Gets {C:mult}15{} Mult for",
                    "every {C:blue}Hand{} played this Scene"},
                    {"Boost this value by {C:mult}5{}",
                    "for every Reception defeated.",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)"},
                },
            },
            j_pmcmod_sephirahHokma = {
                name = 'Sephirah Hokma',
                text = {
                    "Gain {X:mult,C:white}X#2#{} Mult for",
                    "each {C:attention}unique Tarot or Spectral{} card used",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
                },
            },
            j_pmcmod_sephirahBinah = {
                name = 'Sephirah Binah',
                text = {
                    {"Bonds with the first played",
                    "Poker Hand after obtaining this Keypage"},
                    {"If the bonded Poker Hand is the first",
                    "hand of the Scene, {C:red}destroy all scored cards{}."},
                    {"Gains {X:mult,C:white}X#2#{} for every card destroyed",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
                    "{C:inactive}(Currently bonded hand: {C:attention}X#3#{C:inactive}"},
                },
            },
            j_pmcmod_sephirahTiphereth = {
                name = 'Sephirah Tiphereth',
                text = {
                    {"Ace cards give {C:mult}#1#{} Mult"},
                    {"Every time {C:attention}a Reception is defeated{},",
                    "increment the Ace Mult by {C:mult}#2#{}."},
                },
            },
            j_pmcmod_robotHod = {
                name = 'Hod (Robot)',
                text = {
                    {"{X:mult,C:white}X#1#{} Mult"},
                    {"Disables a random Keypage during",
                    "every Encounter"}
                },
            },
            j_pmcmod_robotMalkuth = {
                name = 'Malkuth (Robot)',
                text = {
                    {"Gains 1 Mult for every Poker Hand level above 1"},
                    {"Has {C:green}#2# in #3#{} chance to decrease the played Poker Hand level",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)"},
                },
            },
            j_pmcmod_robotNetzach = {
                name = 'Netzach (Robot)',
                text = {
                    {"Gains {C:mult}3 Mult{} and {C:chips}5 Chips{}",
                    "at the end of every Act."},
                    {"{C:red}Increases shop prices by 5%{}",
                    "{C:red}after every Encounter{}"},
                    {"{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                    "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips)",
                    "{C:inactive}(Currently {C:chips}+#5#{C:inactive} % Shop Price)"},
                },
            },
            j_pmcmod_robotYesod = {
                name = 'Yesod (Robot)',
                text = {
                    {"Gains {C:mult}1{} Mult for every three {C:hearts}Hearts{} and {C:diamonds}Diamonds{} card played",
                    "and {C:chips}1{} Chips for every {C:spades}Spades{} or {C:clubs}Clubs{} card played"},
                    {"Has a {C:green}#7# in #8#{} chance to add Perishable to a random Keypage",
                    "every Hand played"},
                    {"{C:inactive}(Currently {C:mult}+#5#{C:inactive} Mult)",
                    "{C:inactive}(Currently {C:chips}+#6#{C:inactive} Chips)"},
                },
            },
            j_pmcmod_robotChesed = {
                name = 'Chesed (Robot)',
                text = {
                    {"Starts with {X:mult,C:white}X#4#{} Mult"},
                    {"Every time a card scores, there's a {C:green}#1# in #2#{} chance",
                    "to increase the Mult by 0.1."},
                    {"Removes enhancements from played cards"},
                    {"{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)"},
                },
            },
            j_pmcmod_robotGebura = {
                name = 'Gebura (Robot)',
                text = {
                    {"Gets {C:mult}10{} Mult for every hand played this Scene",
                    "Also {C:gold}lose half that value as money{} on every played hand"},
                    {"{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)"},
                },
            },
            j_pmcmod_robotHokma = {
                name = 'Hokma (Robot)',
                text = {
                    {"Gains {X:mult,C:white}X#2#{} Mult per unique Spectral card used."},
                    {"Lose {X:mult,C:white}X#3#{} Mult per unique Tarot card used."},
                    {"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"},
                },
            },
            j_pmcmod_robotBinah = {
                name = 'Binah (Robot)',
                text = {
                    {"Gains {X:mult,C:white}X#2#{} for every card below",
                    "the deck's starting size"},
                    {"Adds a random card at the start of every Encounter"},
                    {"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"},
                },
            },
            j_pmcmod_robotTiph = {
                name = 'Tiph A (Robot)',
                text = {
                    {"Ace cards give {C:mult}#2#{} Mult and {C:chips}#4# Chips{}"},
                    {"If {C:attention}Enoch{} is not present at the start of a blind, spawn him in."},
                    {"Every time {C:attention}Enoch{} is destroyed, increment the Ace mult by {C:mult}#3#{}"},
                },
            },
            j_pmcmod_robotEnoch = {
                name = 'Tiph B (Robot)',
                text = {
                    {"Gets {C:chips}#2#{} chips per played card"},
                    {"If this values reaches {C:chips}100{}, destroy this card"},
                    {"{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"},
                },
            },
            j_pmcmod_silence = {
                name = 'Time Flowing',
                text = {
                    {"Lose the run if the current encounter",
                    "is not defeated within {C:mult}30 seconds{}"},
                },
            },
            j_pmcmod_shylook = {
                name = "Today's Shy Look",
                text = {
                    {"Changes expressions regularly."},
                    {"Gives between {X:mult,C:white}X0{} and {X:mult,C:white}X2{} Mult depending on",
                    "the expression it's at when a hand is played"},
                },
            },
            j_pmcmod_queenOfHatred = {
                name = "Queen of Hatred",
                text = {
                    {"Every card played and discarded is counted"},
                    {"Gains effects based on the difference between values:",
                    "< 4: {C:attention}Retriggers{} every Keypage",
                    "< 7: Gain {C:chips}100{} chips (scale with every Act)",
                    "> 10: {X:mult,C:white}X0.5{} Mult",
                    "> 14: {C:attention}Transforms{}. Disables a random Keypage every Scene"},
                    {"If transformation occurs, stays in this state for",
                    "the next 3 Encounters, then reset value to 9"},
                    {"{C:inactive}(Discarded:{C:attention} #1# {C:inactive})",
                    "{C:inactive}(Played:{C:attention} #2# {C:inactive})",
                    "{C:inactive}(Current count:{C:attention} #8# {C:inactive})",
                    "{C:inactive}(Scenes transformed:{C:attention} #7# {C:inactive})"},
                },
            },
            j_pmcmod_laetitia = {
                name = "Here’s a Gift~",
                text = {
                    "Has a {C:green}#2# in #3#{} to give",
                    "{C:attention}Gift{} to any card in Deck.",
                },
            },
            j_pmcmod_childrenOfTheGalaxy = {
                name = "Pebble",
                text = {
                    "Has a {C:green}#1# in #2#{} to give",
                    "{C:attention}Pebble{} to any card in Deck.",
                },
            },
            j_pmcmod_censored = {
                name = "{X:black,C:mult}[CENSORED]",
                text = {
                    "Censors sprites, names",
                    "and descriptions from Keypages.",
                },
            },
            j_pmcmod_chickenA = {
                name = "Bongy (Normal)",
                text = {
                    {"Crispy on the outside, juicy on the inside."},
                    {"Destroys itself at the end of the Encounter",
                    "once {C:attention}3 Scenes are completed{}"},
                    {"{C:inactive}(Currently{C:attention} #1# {C:inactive}Scenes completed)"},
                },
            },
            j_pmcmod_chickenB = {
                name = "Bongy (Soy Sauce)",
                text = {
                    {"Covered in fragrant spices."},
                    {"Destroy itself at the end of the Encounter",
                    "once {C:blue}5 Hands{} are played"},
                    {"{C:inactive}(Currently{C:blue} #1# {C:inactive}hands played)"},
                },
            },
            j_pmcmod_chickenC = {
                name = "Bongy (Red Sauce)",
                text = {
                    {"Covered in a delicious red tomato (?) sauce."},
                    {"Destroys itself at the end of the Encounter",
                    "once {C:red}20 cards are discarded{}"},
                    {"{C:inactive}(Currently{C:mult} #1# {C:inactive}Discards used)"},
                },
            },
            j_pmcmod_chickenD = {
                name = "Bongy (Chef)",
                text = {
                    {"Are you telling me a chicken fried this rice?"},
                    {"Destroys itself at the end of the Encounter",
                    "once {C:gold}3 Boosters are opened{}"},
                    {"{C:inactive}(Currently{C:gold} #1# {C:inactive}Boosters opened)"},
                },
            },
            j_pmcmod_dummyRicardo = {
                name = 'Dummy Ricardo',
                text = {
                    "Ricardo death count: {C:red}#1#",
                    "Can spawn: {C:red}#2#",
                },
            },
            j_pmcmod_puppetA = {
                name = "Puppet",
                text = {
                    "GIGIGIGIIIGIIGGGGIGII",
                    "GIIGIGIGI{C:red}#1#{}MultGIIGGI",
                    "{C:inactive}(Counter: {C:attention}#2#{C:inactive})"
                },
            },
            j_pmcmod_puppetB = {
                name = "Nimble Puppet",
                text = {
                    "GIGIGIGIIIGIIGGGGIGII",
                    "GIIGIGIGI{C:red}#1#{}MultGIIGGI",
                    "{C:inactive}(Counter: {C:attention}#2#{C:inactive})"
                    
                },
            },
            j_pmcmod_puppetC = {
                name = "Weighty Puppet",
                text = {
                    "GIGIGIGIIIGIIGGGGIGII",
                    "GIIGIGIGI{C:red}#1#{}MultGIIGGI",
                    "{C:inactive}(Counter: {C:attention}#2#{C:inactive})"
                },
            },
            j_pmcmod_puppetAngelica = {
                name = "Familiar Puppet",
                text = {
                    "GIGIGIGIRIIGIIGOGGGIGILAI",
                    "GNGIGIIIGIGIGIGIIIDDGIGIGI...",
                    "GIIGIGIGI{C:red}#1#{}MultGIIGGI",
                },
            },
            j_pmcmod_voiceOfTheCity = {
                name = 'Voice of the City',
                text = {
                    {"After the first Act",
                    "create a Prescript",
                    "on the next shop"},
                    {"Completing a prescript gives you 15$",
                    "Failing to complete a prescript sets your money to 0$}"}
                },
            },
            j_pmcmod_prescript1 = {
                name = 'Prescript',
                text = {
                    {"{C:red}Discard{} 5 Face cards in a single hand"},
                    {"Prescript fullfilled: {c:green}#1#{}"}
                },
            },
            j_pmcmod_prescript2 = {
                name = 'Prescript',
                text = {
                    {"Sell the {C:red}#2#{} Keypage"},
                    {"Prescript fullfilled: {c:green}#1#{}"}
                },
            },
            j_pmcmod_prescript3 = {
                name = 'Prescript',
                text = {
                    {"Must not play {C:attention}#2#{} cards"},
                    {"Prescript failed: {c:red}#3#{}"}
                },
            },
            j_pmcmod_prescript4 = {
                name = 'Prescript',
                text = {
                    {"Finish 1 Scene with {C:attention}game speed{} set to 1"},
                    {"Prescript fullfilled: {c:green}#1#{}"}
                },
            },
            j_pmcmod_prescript5 = {
                name = 'Prescript',
                text = {
                    "Must not use any {C:red}Discards",
                },
            },
            j_pmcmod_prescript6 = {
                name = 'Prescript',
                text = {
                    {"Open and skip 3 {C:attention}Booster packs{}"},
                    {"Boosters skipped: {c:attention}#2#{}"}
                },
            },
            j_pmcmod_prescript7 = {
                name = 'Prescript',
                text = {
                    {"Sell a Keypage of at least {C:blue}Hardcover{} rarity"},
                    {"Prescript fullfilled: {c:green}#1#{}"}
                },
            },
            j_pmcmod_prescript8 = {
                name = 'Prescript',
                text = {
                    "Win a Scene with your {C:blue}last Hand",
                },
            },
            j_pmcmod_prescript9 = {
                name = 'Prescript',
                text = {
                    "Trigger the {C:red}Reception ability",
                },
            },
            j_pmcmod_prescript10 = {
                name = 'Prescript',
                text = {
                    "Use {C:attention}3 Consumables",
                },
            },
            j_pmcmod_prescript11 = {
                name = 'Prescript',
                text = {
                    {"Play the first 5 digits of e"},
                    {"Prescript fullfilled: {c:green}#1#{}"}
                },
            },
        },
        Other={
            effect_singleton={
                name="Singleton",
                text={
                    "Cards that are unique in the deck",
                    "(only one of its rank)",
                },
            },
            pmcmod_markofcain_seal = {
                name = "Mark of Cain",
                text = {
                    "{X:mult,C:white}X1.2{} Mult",
                },
            },
            pmcmod_gift_seal = {
                name = "Gift",
                text = {
                    "{C:mult}10 Mult{}",
                    "Loses {C:gold}$10{} for each",
                    "remaining Gift after a Reception",
                    "Goes away after being used"
                },
            },
            pmcmod_pebble_seal = {
                name = "Pebble",
                text = {
                    "{C:gold}$5{}",
                    "Goes away after being used"
                },
            },
            censored_joker={
                name="{X:mult, C:white}[CENSORED]",
                text={
                    "{X:mult, C:white}[CENSORED]",
                },
            },
        },
        Partner={
            pnr_pmcmod_dante = {
                name = "Dante",
                text = {
                    "Manager",
                    "Gives {C:mult}#2#{} Mult",
                    "on every played hand",
                    "if it doesn't contain",
                    "a Face card.",
                    "{C:inactive}(Currently{C:mult} #1# {C:inactive}Mult)",
                }
            },
            pnr_pmcmod_roland = {
                name = "Roland",
                text = {
                    "Fixer",
                    "{C:dark_edition}+#2# Keypage Slot",
                }
            },
            pnr_pmcmod_netzach = {
                name = "Netzach",
                text = {
                    "Patron Librarian",
                    "",
                    "Spawns a {C:planet}Sinner{} card",
                    "after defeating a",
                    "Reception.",
                }
            },
            pnr_pmcmod_angela = {
                name = "Angela",
                text = {
                    "Director",
                    "",
                    "Spawns a {C:planet}Keypage{}",
                    "at the start of a",
                    "Reception.",
                }
            },
        },
        Planet={},
        Spectral={
            c_pmcmod_witness = {
                name = "Witness",
                text = {
                    "Changes {C:attention}every card in hand",
                    "into a random {C:clubs}Clubs{} face card",
                    "{C:red}-2{} Hand size"
                }
            },
            c_pmcmod_outcast = {
                name = "Outcast",
                text = {
                    "Gives a random {C:dark_edition}enhancement{} to",
                    "{C:attention}every card in hand",
                    "{C:red}-1{} Hand",
                }
            },
            c_pmcmod_unloving = {
                name = "Unloving",
                text = {
                    "Destroys a random Keypage",
                    "Gives Bonus to every card in hand",
                }
            },
            c_pmcmod_hunt= {
                name = "Hunt",
                text = {
                    "Enhances 1 card to {C:attention}Pallid{}",
                }
            },
            c_pmcmod_waltz= {
                name = "Waltz",
                text = {
                    "Enhances 2 card to {C:red}Burn{}",
                }
            },
            c_pmcmod_banquet= {
                name = "Banquet",
                text = {
                    "Enhances 2 card to {C:dark_red}Bleed{}",
                }
            },
            c_pmcmod_binds= {
                name = "Binds",
                text = {
                    "Enhances 2 card to {C:blue}Sinking{}",
                }
            },
            c_pmcmod_manifest= {
                name = "Manifest",
                text = {
                    "Upgrades an {C:attention}Aspect Keypage{} into",
                    "their complete version."
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
            sleeve_pmcmod_indexDeck = {
                name = "Index Sleeve",
                text = {
                    "Starts with an eternal",
			        "{C:attention,T:j_pmcmod_voiceOfTheCity}Voice of the City{} page.",
                },
                unlock = {
                    'Win a run with {C:attention}Index Deck{}',
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
            sleeve_pmcmod_galaxyDeck = {
                name = "Galaxy Sleeve",
                text = {
                    "Starts with an eternal",
			        "{C:attention,T:j_pmcmod_childrenOfTheGalaxy}Pebble{} page.",
                },
                unlock = {
                    'Win a run with {C:attention}Galaxy Deck{}',
                    'in at least {C:attention}Canard Stake{}',
                },
            },
            sleeve_pmcmod_giftDeck = {
                name = "Gift Sleeve",
                text = {
                    "Starts with an eternal",
			        "{C:attention,T:j_pmcmod_laetitia}Here’s a Gift~{} page.",
                },
                unlock = {
                    'Win a run with {C:attention}Gift Deck{}',
                    'in at least {C:attention}Canard Stake{}',
                },
            },
            sleeve_pmcmod_censoredDeck = {
                name = "Censored Sleeve",
                text = {
                    "Starts with an eternal",
			        "{C:attention,T:j_pmcmod_censored}CENSORED{} page.",
                },
                unlock = {
                    'Win a run with {C:attention}Censored Deck{}',
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
            pmcmod_gift_seal = "Gift",
            pmcmod_pebble_seal = "Pebble",
            pmcmod_charge="Charge",
        },
        poker_hand_descriptions={},
        poker_hands={},
        quips={
            pmcmod_roland_win={
                "Whew... That was real close",
                "It woulda been a shame if we failed",
            },
            pmcmod_roland_loss={
                "It’d be too sucky to lose",
                "without doing much at all...",
            },
            pmcmod_malkuth_win={
                "We won, we really won!",
                "That means I could be of",
                "help to everyone, right?"
            },
            pmcmod_malkuth_loss={
                "Maybe I was overwhelmed",
                "with enthusiasm...?"
            },
            pmcmod_hod_win={
                "Thanks for staying with me",
                "till the end. Good work!"
            },
            pmcmod_hod_loss={
                "I tried so hard, and yet...",
                "Why does it always have to",
                "end like this..."
            },
            pmcmod_yesod_win={
                "Good work, everyone.",
                "Adjust your attire before",
                "returning to your quarters."
            },
            pmcmod_yesod_loss={
                "You should have made more accurate judgements",
            },
            pmcmod_netzach_win={
                "...I can call it a day now, yeah?",
            },
            pmcmod_netzach_loss={
                "Maybe you could have tried not",
                "letting your guard down."
            },
            pmcmod_chesed_win={
                "How about a fragrant cup of",
                "coffee for everyone~?"
            },
            pmcmod_chesed_loss={
                "Aww, that's too bad.",
            },
            pmcmod_gebura_win={
                "We got this over with smoothly.",
                "Good work, everyone."
            },
            pmcmod_gebura_loss={
                "It's upsetting... But I'll",
                "have to accept it."
            },
            pmcmod_tiph_win={
                "It was obvious we’d win.", 
                "Thought we couldn’t handle this much?"
            },
            pmcmod_tiph_loss={
                "...Sorry. I wasn’t too helpful there."
            },
            pmcmod_hokma_win={
                "Overconfidence is the greatest",
                "enemy. We must humbly keep our post."
            },
            pmcmod_hokma_loss={
                "To accept such outcomes, one must",
                "learn to give up certain pursuits..."
            },
            pmcmod_binah_win={
                "You have done well.",
            },
            pmcmod_binah_loss={
                "...",
            },
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
            pnr_pmcmod_angela_1={
                "I am Angela, director",
                "and librarian of my",
                "role's namesake.",
            },
            pnr_pmcmod_angela_2={
                "May you find your",
                "Keypage in this place.",
            },
            pnr_pmcmod_angela_3={
                "Greetings, dear guests.",
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