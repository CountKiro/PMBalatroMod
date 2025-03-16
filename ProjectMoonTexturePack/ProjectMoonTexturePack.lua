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

SMODS.Atlas{key = "cards_1", path = "8BitDeck.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "blind_chips", path = "BlindChips.png", px = 34, py = 34, prefix_config = { key = false }, atlas_table = 'ANIMATION_ATLAS', frames = 21}
SMODS.Atlas{key = "Booster", path = "boosters.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "centers", path = "Enhancers.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "Joker", path = "Jokers.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "Planet", path = "Tarots.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "Consumeable", path = "Tarots.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "Tarot", path = "Tarots.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "Voucher", path = "Vouchers.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "PMGoldenBough", path = "Enhancers.png", px = 71, py = 95, prefix_config = { key = false } }

AltTexture{
    key = 'spectral',
    set = 'Spectral',
    path = 'Tarots.png',
    soul = 'Enhancers.png',
    original_sheet = true
}

TexturePack{
    key = 'pmtexturemod',
    textures = {
        'pmmod_spectral'
    }
}