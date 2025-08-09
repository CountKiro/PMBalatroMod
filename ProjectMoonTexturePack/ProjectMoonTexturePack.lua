--- STEAMODDED HEADER
--- MOD_NAME: Project Moon Texture Pack
--- MOD_ID: ProjectMoonTexturePack
--- MOD_AUTHOR: [Kiro]
--- MOD_DESCRIPTION: Replaces most cards, consumables and UI elements with Project Moon related alternatives
--- PREFIX: pmmod
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-0812d]

----------------------------------------------
------------MOD CODE -------------------------



sendDebugMessage("Launching Project Moon Texture Pack!", "ProjectMoonTexturePack")

-- Hooks
local hook_list = {
	"game",
}

for _, hook in ipairs(hook_list) do
    local init, error = NFS.load(SMODS.current_mod.path .. "hooks/" .. hook ..".lua")
    if error then sendErrorMessage("PMTextureMod :: Failed to load "..hook.." with error "..error) else
        local data = init()
        sendDebugMessage("PMTextureMod :: Loaded hook: " .. hook)
    end
end

--SMODS.Atlas{key = "cards_1", path = "8BitDeck.png", px = 71, py = 95, prefix_config = { key = false } }
--SMODS.Atlas{key = "cards_2", path = "8BitDeck.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "blind_chips", path = "BlindChips.png", px = 34, py = 34, prefix_config = { key = false }, atlas_table = 'ANIMATION_ATLAS', frames = 21}
SMODS.Atlas{key = "Booster", path = "boosters.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "centers", path = "Enhancers.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "Joker", path = "Jokers.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "Planet", path = "Tarots.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "Consumeable", path = "Tarots.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "Tarot", path = "Tarots.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "Voucher", path = "Vouchers.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "PMGoldenBough", path = "Enhancers.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "chips", path = "chips.png", px = 29, py = 29, prefix_config = { key = false } }
SMODS.Atlas{key = "tags", path = "tags.png", px = 34, py = 34, prefix_config = { key = false } }
SMODS.Atlas{key = "stickers", path = "stickers.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "shop_sign", path = "ShopSignAnimation.png", px = 113, py = 57, prefix_config = { key = false }, atlas_table = 'ANIMATION_ATLAS', frames = 4 }
SMODS.Atlas {key = "modicon",	path = "icon.png",	px = 32, py = 32}
SMODS.Atlas {key = "balatro",	path = "balatro.png",	px = 333, py = 216, prefix_config = { key = false }}

local atlas_hc = SMODS.Atlas{key = "PMSkinBlack", path = "8BitDeck.png", px = 71, py = 95,}
local icon_hc = SMODS.Atlas{key = "PMSkinIconBlack", path = "8BitDeck.png", px = 18, py = 18,}

local atlas_hc_white = SMODS.Atlas{key = "PMSkinWhite", path = "8BitDeck_White.png", px = 71, py = 95,}
local icon_hc_white = SMODS.Atlas{key = "PMSkinIconWhite", path = "8BitDeck_White.png", px = 18, py = 18,}

--Black deck skins

SMODS.DeckSkin{
    key = "pmCardsDarkHearts",
    suit = "Hearts",
    loc_txt =  'PM (Black)',
    palettes = {
		{
			key = 'lc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc.key,
			pos_style = 'deck',
--      suit_icon = {
--				atlas = atlas_hc.key,
--			},
		},
		{
			key = 'hc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc.key,
			pos_style = 'deck',
			colour = HEX("9734f0"),
--      suit_icon = {
--				atlas = atlas_hc.key,
--			},
		},
	},
    
}

SMODS.DeckSkin{
    key = "pmCardsDarkSpades",
    suit = "Spades",
    loc_txt =  'PM (Black)',
    palettes = {
		{
			key = 'lc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc.key,
			pos_style = 'deck',
--      suit_icon = {
--				atlas = atlas_hc.key,
--			},
		},
		{
			key = 'hc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc.key,
			pos_style = 'deck',
			colour = HEX("9734f0"),
--      suit_icon = {
--				atlas = atlas_hc.key,
--			},
		},
	},
    
}

SMODS.DeckSkin{
    key = "pmCardsDarkClubs",
    suit = "Clubs",
    loc_txt =  'PM (Black)',
    palettes = {
		{
			key = 'lc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc.key,
			pos_style = 'deck',
--      suit_icon = {
--				atlas = atlas_hc.key,
--			},
		},
		{
			key = 'hc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc.key,
			pos_style = 'deck',
			colour = HEX("9734f0"),
--      suit_icon = {
--				atlas = atlas_hc.key,
--			},
		},
	},
    
}

SMODS.DeckSkin{
    key = "pmCardsDarkDiamonds",
    suit = "Diamonds",
    loc_txt =  'PM (Black)',
    palettes = {
		{
			key = 'lc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc.key,
			pos_style = 'deck',
--      suit_icon = {
--				atlas = atlas_hc.key,
--			},
		},
		{
			key = 'hc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc.key,
			pos_style = 'deck',
			colour = HEX("9734f0"),
--      suit_icon = {
--				atlas = atlas_hc.key,
--			},
		},
	},
    
}

-- White deck skins



SMODS.DeckSkin{
    key = "pmCardsWhiteHearts",
    suit = "Hearts",
    loc_txt =  'PM (White)',
    palettes = {
		{
			key = 'lc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc_white.key,
			pos_style = 'deck',
      suit_icon = {
				atlas = atlas_hc_white.key,
			},
		},
		{
			key = 'hc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc_white.key,
			pos_style = 'deck',
			colour = HEX("9734f0"),
--      suit_icon = {
--				atlas = atlas_hc_white.key,
--			},
		},
	},
    
}

SMODS.DeckSkin{
    key = "pmCardsWhiteSpades",
    suit = "Spades",
    loc_txt =  'PM (White)',
    palettes = {
		{
			key = 'lc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc_white.key,
			pos_style = 'deck',
--      suit_icon = {
--				atlas = atlas_hc_white.key,
--			},
		},
		{
			key = 'hc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc_white.key,
			pos_style = 'deck',
			colour = HEX("9734f0"),
--      suit_icon = {
--				atlas = atlas_hc_white.key,
--			},
		},
	},
    
}

SMODS.DeckSkin{
    key = "pmCardsWhiteClubs",
    suit = "Clubs",
    loc_txt =  'PM (White)',
    palettes = {
		{
			key = 'lc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc_white.key,
			pos_style = 'deck',
--      suit_icon = {
--				atlas = atlas_hc_white.key,
--			},
		},
		{
			key = 'hc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc_white.key,
			pos_style = 'deck',
			colour = HEX("9734f0"),
--      suit_icon = {
--				atlas = atlas_hc_white.key,
--			},
		},
	},
    
}

SMODS.DeckSkin{
    key = "pmCardsWhiteDiamonds",
    suit = "Diamonds",
    loc_txt =  'PM (White)',
    palettes = {
		{
			key = 'lc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc_white.key,
			pos_style = 'deck',
      suit_icon = {
				atlas = atlas_hc_white.key,
			},
		},
		{
			key = 'hc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc_white.key,
			pos_style = 'deck',
			colour = HEX("9734f0"),
--      suit_icon = {
--				atlas = atlas_hc_white.key,
--			},
		},
	},
    
}

AltTexture{
    key = "spectral",
    set = "Spectral",
    path = "Tarots.png",
    soul = "Enhancers.png",
    loc_txt = {
        name = 'Spectral fixes'
    },
    original_sheet = true
}

AltTexture({
    key = 'whiteBaseCard',
    keys = {'c_base'},
    set = 'Enhanced',
    path = 'WhiteEnhancers.png',
    loc_txt = {
        name = 'White background enhancements'
    },
     original_sheet = true
})

AltTexture({
    key = 'whiteBaseCardEnhanced',
    set = 'Enhanced',
    path = 'WhiteEnhancers.png',
    loc_txt = {
        name = 'White card base'
    }
})


TexturePack{
    key = "pmSpectralTexturemod",
    loc_txt = {
        name = 'Spectral fixes',
        text = {'Fixes spectral cards','Required for Soul Card (Golden Bough)'},
    },
    textures = {
        "pmmod_spectral"
    }
}

TexturePack{
    key = "pmWhiteCards",
    loc_txt = {
        name = 'White backgrounds',
        text = {'White background for cards.','Make sure to select the appropriate Deck Skin','via Options -> Customize Deck','(REQUIRES RESTART)'},
    },
    textures = {
        "pmmod_whiteBaseCard",
        "pmmod_whiteBaseCardEnhanced"
    }
}

----------------------
-- JOKER OVERWRITES --
----------------------
--[[
SMODS.Joker:take_ownership('j_joker', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge("The 8 o’Clock Circus", HEX('851734'), HEX('e8e6e3'), 1.2 )
         end
  }, true)
--]]
SMODS.Joker:take_ownership('j_greedy_joker', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Thumb', HEX('7d130f'), HEX('c29c29'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_lusty_joker', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Thumb', HEX('7d130f'), HEX('c29c29'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_wrathful_joker', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Thumb', HEX('7d130f'), HEX('c29c29'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_gluttenous_joker', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Thumb', HEX('7d130f'), HEX('c29c29'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_jolly', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Liu Association', HEX('9e0000'), HEX('e8970c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_zany', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Wedge Office', HEX('1c1c1c'), HEX('4387e0'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_mad', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The 8 o’Clock Circus', HEX('851734'), HEX('e8e6e3'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_crazy', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Kurokumo Clan', HEX('292a2e'), HEX('6f7178'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_droll', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Hana Association', HEX('e3e3e3'), HEX('8a6d15'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_sly', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Liu Association', HEX('9e0000'), HEX('e8970c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_wily', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Wedge Office', HEX('1c1c1c'), HEX('4387e0'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_clever', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The 8 o’Clock Circus', HEX('851734'), HEX('e8e6e3'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_devious', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Kurokumo Clan', HEX('292a2e'), HEX('6f7178'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_crafty', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Hana Association', HEX('e3e3e3'), HEX('8a6d15'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_half', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge("Charle's Office", HEX('3d3d3d'), HEX('b5b5b5'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_stencil', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Library', HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_four_fingers', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Carnival', HEX('242424'), HEX('8c0a0a'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_mime', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Blue Reverberation', HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_credit_card', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Rats', HEX('3b2f28'), HEX('520f07'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_ceremonial', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Blue Reverberation', HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_banner', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Gaze Office', HEX('332e2c'), HEX('9b3f9e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_mystic_summit', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Gaze Office', HEX('332e2c'), HEX('9b3f9e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_marble', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Musicians of Bremen', HEX('200921'), HEX('f016fa'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_loyalty_card', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge("Pierre's Bistro", HEX('c4c4c4'), HEX('960c0c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_8_ball', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Brotherhood of Iron', HEX('303030'), HEX('c29c29'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_misprint', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Love Town', HEX('523f16'), HEX('f21b98'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_dusk', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Dawn Office', HEX('4a443d'), HEX('e0d482'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_raised_fist', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Stray Dogs', HEX('303030'), HEX('c7c7c7'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_chaos', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge("Yun's Office", HEX('302c2c'), HEX('b5b1b1'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_fibonacci', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Brotherhood of Iron', HEX('303030'), HEX('c29c29'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_steel_joker', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Musicians of Bremen', HEX('200921'), HEX('f016fa'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_scary_face', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Hook Office', HEX('542813'), HEX('dbdbdb'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_abstract', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('R Corp', HEX('2e2b2b'), HEX('c4560c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_delayed_grat', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Rusted Chains', HEX('2b2727'), HEX('56755b'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_hack', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Zwei Association', HEX('23306e'), HEX('ab851d'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_pareidolia', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Library', HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_gros_michel', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Shi Association', HEX('212121'), HEX('8f1313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_even_steven', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Citizen', HEX('828282'), HEX('ebebeb'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_odd_todd', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Citizen', HEX('828282'), HEX('ebebeb'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_scholar', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Brotherhood of Iron', HEX('303030'), HEX('c29c29'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_business', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Hook Office', HEX('542813'), HEX('dbdbdb'), 1.2 )
         end
  }, true)
  
SMODS.Joker:take_ownership('j_supernova', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Dawn Office', HEX('4a443d'), HEX('e0d482'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_ride_the_bus', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Limbus Company', HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_space', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('??????', HEX('828282'), HEX('ebebeb'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_egg', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Smiling Faces', HEX('521612'), HEX('d1d1d1'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_burglar', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Streetlight Office', HEX('232b2e'), HEX('8d9ba1'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_blackboard', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Liu Association', HEX('9e0000'), HEX('e8970c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_runner', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Stray Dogs', HEX('303030'), HEX('c7c7c7'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_ice_cream', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Sweepers', HEX('2e3138'), HEX('a6190f'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_dna', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('R Corp', HEX('2e2b2b'), HEX('c4560c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_splash', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Carnival', HEX('242424'), HEX('8c0a0a'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_blue_joker', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Gaze Office', HEX('332e2c'), HEX('9b3f9e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_sixth_sense', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Shi Association', HEX('212121'), HEX('8f1313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_constellation', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Limbus Company', HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_hiker', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Stray Dogs', HEX('303030'), HEX('c7c7c7'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_faceless', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Molar Office', HEX('595447'), HEX('c9c9c9'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_green_joker', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('W Corp', HEX('24303b'), HEX('0078e6'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_superposition', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Liu Association', HEX('9e0000'), HEX('e8970c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_todo_list', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Blue Reverberation', HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_cavendish', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Index', HEX('e0e0e0'), HEX('59a5e3'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_card_sharp', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Seven Association', HEX('234a39'), HEX('b59c36'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_red_card', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Liu Association', HEX('9e0000'), HEX('e8970c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_madness', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Blue Reverberation', HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_square', 
  {
  display_size = { w = 71, h = 95 },
  pixel_size = { w = 71, h = 130 },
  set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Molar Office", HEX('23306e'), HEX('ab851d'), 1.2 )
 	end
  }, true)

SMODS.Joker:take_ownership('j_seance', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Blue Reverberation', HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_riff_raff', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Library', HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_vampire', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Blue Reverberation', HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_shortcut', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Carnival', HEX('242424'), HEX('8c0a0a'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_hologram', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Head', HEX('242424'), HEX('e0c02f'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_vagabond', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Rats', HEX('3b2f28'), HEX('520f07'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_baron', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Limbus Company', HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_cloud_9', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Cane Office', HEX('242424'), HEX('e87a20'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_rocket', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Cane Office', HEX('242424'), HEX('e87a20'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_obelisk', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('W Corp', HEX('24303b'), HEX('0078e6'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_midas_mask', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Limbus Company', HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_luchador', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge("Yun's Office", HEX('302c2c'), HEX('b5b1b1'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_photograph', 
  {
  display_size = { w = 71, h = 95 },
  pixel_size = { w = 71, h = 115 },
  set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Zwei Association", HEX('23306e'), HEX('ab851d'), 1.2 )
 	end
  }, true)

SMODS.Joker:take_ownership('j_gift', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Full-Stop Office', HEX('3b3a38'), HEX('b59348'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_turtle_bean', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Index', HEX('e0e0e0'), HEX('59a5e3'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_erosion', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Streetlight Office', HEX('232b2e'), HEX('8d9ba1'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_reserved_parking', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Full-Stop Office', HEX('3b3a38'), HEX('b59348'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_mail', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Limbus Company', HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_to_the_moon', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Full-Stop Office', HEX('3b3a38'), HEX('b59348'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_hallucination', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Lobotomy Corporation', HEX('b82c2c'), HEX('f2e396'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_fortune_teller', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Smiling Faces', HEX('521612'), HEX('d1d1d1'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_juggler', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Index', HEX('e0e0e0'), HEX('59a5e3'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_drunkard', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Molar Office', HEX('595447'), HEX('c9c9c9'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_stone', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Musicians of Bremen', HEX('200921'), HEX('f016fa'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_golden', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Cane Office', HEX('242424'), HEX('e87a20'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_lucky_cat', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Fixer', HEX('1c1c1c'), HEX('808080'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_baseball', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Streetlight Office', HEX('232b2e'), HEX('8d9ba1'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_bull', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('R Corp', HEX('2e2b2b'), HEX('c4560c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_diet_cola', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Limbus Company', HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_trading', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Shi Association', HEX('212121'), HEX('8f1313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_flash', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge("Yun's Office", HEX('302c2c'), HEX('b5b1b1'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_popcorn', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Sweepers', HEX('2e3138'), HEX('a6190f'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_trousers', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge("The 8 o’Clock Circus", HEX('851734'), HEX('e8e6e3'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_ancient', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Bayard', HEX('283623'), HEX('bfbfbf'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_ramen', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge("Pierre's Bistro", HEX('c4c4c4'), HEX('960c0c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_walkie_talkie', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Zwei Association', HEX('23306e'), HEX('ab851d'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_selzer', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Lobotomy Corporation', HEX('b82c2c'), HEX('f2e396'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_castle', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Library', HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_smiley', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Hook Office', HEX('542813'), HEX('dbdbdb'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_campfire', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('W Corp', HEX('24303b'), HEX('0078e6'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_ticket', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Rats', HEX('3b2f28'), HEX('520f07'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_mr_bones', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Sweepers', HEX('2e3138'), HEX('a6190f'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_acrobat', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Blade Lineage', HEX('26292e'), HEX('a81338'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_sock_and_buskin', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Library', HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_swashbuckler', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('R Corp', HEX('2e2b2b'), HEX('c4560c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_troubadour', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Index', HEX('e0e0e0'), HEX('59a5e3'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_certificate', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Night Awls', HEX('2b2b2b'), HEX('a1a1a1'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_smeared', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Library', HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_throwback', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Mirae Life Insurance', HEX('463a54'), HEX('c9c9c9'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_hanging_chad', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Limbus Company', HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_rough_gem', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Blue Reverberation', HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_bloodstone', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Blue Reverberation', HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_arrowhead', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Blue Reverberation', HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_onyx_agate', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Blue Reverberation', HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_glass', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Index', HEX('e0e0e0'), HEX('59a5e3'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_ring_master', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Limbus Company', HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_flower_pot', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Limbus Company', HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_blueprint', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Head', HEX('242424'), HEX('e0c02f'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_wee', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The 8 o’Clock Circus...?', HEX('851734'), HEX('e8e6e3'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_merry_andy', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Molar Office', HEX('595447'), HEX('c9c9c9'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_oops', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Limbus Company', HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_idol', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Limbus Company', HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_seeing_double', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Limbus Company', HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_matador', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Lobotomy Corporation', HEX('b82c2c'), HEX('f2e396'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_hit_the_road', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Limbus Company', HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_duo', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Liu Association', HEX('9e0000'), HEX('e8970c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_trio', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Wedge Office', HEX('1c1c1c'), HEX('4387e0'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_family', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Limbus Company', HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_order', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Kurokumo Clan', HEX('292a2e'), HEX('6f7178'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_tribe', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Hana Association', HEX('e3e3e3'), HEX('8a6d15'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_stuntman', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Library', HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_invisible', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Index', HEX('e0e0e0'), HEX('59a5e3'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_brainstorm', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Claw', HEX('242424'), HEX('e0c02f'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_satellite', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Library', HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_shoot_the_moon', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Library', HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_drivers_license', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Limbus Company', HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_cartomancer', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Library', HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_astronomer', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('The Library', HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_burnt', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Dawn Office', HEX('4a443d'), HEX('e0d482'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_bootstraps', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Limbus Company', HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_caino', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Color Fixer', HEX('495c3a'), HEX('330606'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_triboulet', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Color Fixer', HEX('330606'), HEX('db0707'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_yorick', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Color Fixer', HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_chicot', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Color Fixer', HEX('1c1c1c'), HEX('9e13bd'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_perkeo', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge('Color Fixer', HEX('1c1c1c'), HEX('808080'), 1.2 )
         end
  }, true)

SMODS.Shader{key = 'debuffGold', path = 'debuffGold.fs'}

