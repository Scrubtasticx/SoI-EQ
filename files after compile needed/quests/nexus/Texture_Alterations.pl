sub EVENT_SAY {
        #:: Match text for 'hail', case insensitive
        if ($text=~/hail/i) {
            $client->Message(0, "Good day to you, $name. I can teleport you to your home city, are you ready to [" . quest::saylink("texture") . "]?");
        }
        elsif ($text=~/texture/i) {
            $client->Message(0, "I can change your texture to: [" . quest::saylink("remove") . "], [" . quest::saylink("leather") . "], [" . quest::saylink("chain") . "], or [" . quest::saylink("plate") . "]?");        
        }
        elsif ($text=~/remove/i) {
            #:: Key a data bucket using 'characterID-texture'
            $key   = $client->CharacterID() . "-texture";
            #:: Delete the key
            quest::delete_data($key);
        }
        elsif ($text=~/leather/i) {
            $key   = $client->CharacterID() . "-texture";
            #:: Set the key value to 'leather'
            quest::set_data($key, "leather");
        }
        elsif ($text=~/chain/i) {
            $key   = $client->CharacterID() . "-texture";
            quest::set_data($key, "chain");
        }
        elsif ($text=~/plate/i) {
            $key   = $client->CharacterID() . "-texture";
            quest::set_data($key, "plate");
        }
    }