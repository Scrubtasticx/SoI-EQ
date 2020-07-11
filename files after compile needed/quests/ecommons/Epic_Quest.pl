sub EVENT_SAY {
    my %responses = (1 => "The next item you need is an eye from an evil unicorn in Lesser Faydark.",
    2 => "The next item I need is a Polished Shard from Droga.",
    3 => "The next item I need is a Sphere of Sandstorm from Bastion of Thunder.",
    4 => "The next item I need is dryad parts from Jagged Pine Forest.",
    5 => "The next item I need is werewolf talon from Castle Mistmoore.",
    6 => "The next item I need is a snowball from Permafrost.",
    7 => "This last part will not be so easy. I need Kallis' Head.");
    
    if ($text =~/Hail/i && $ulevel == 60 && !defined $qglobals{"Epic"}) {
        plugin::Whisper("Hello $name, along my journies I have acquired knowledge on how to create a " . quest::saylink("Weapon", 1) . " with power like none seen before.");
    } elsif ($text =~/Hail/i && $ulevel <= 59 && !defined $qglobals{"Epic"}) {
        plugin::Whisper("Hello $name, I'm sorry but you must be level 60 to start your epic.");
    } elsif ($text=~/Hail/i && defined $qglobals{"Epic"}) {
        if ($qglobals{"Epic"} >= 1 && $qglobals{"Epic"} <= 7) {
            plugin::Whisper($responses{$qglobals{"Epic"}});
        }
    }

    if ($text=~/^Weapon$/i) {
        plugin::Whisper("In order for me to make you this special weapon I need a few items. The first item I need is a greatsword from Acryila Caverns.");
    }
}

sub EVENT_ITEM {
    my %handins = (1 => [1815, 1, 2, "Wow you are making incredible time getting me these items. The next item I need is a Polished Shard from Droga."],
    2 => [81116, 2, 3, "You are getting closer to greatness. The next item I need is a Sphere of Sandstorm from Bastion of Thunder."],
    3 => [9429, 3, 4, "Incredible! The weapon is almost complete. The next item I need is dryad parts from Jagged Pine Forest."],
    4 => [8107, 4, 5, "You are half way there. The next item I need is werewolf talon from Castle Mistmoore."],
    5 => [13746, 5, 6, "The weapon is starting to glow. The next item I need is a snowball from permafrost."],
    6 => [19034, 6, 7, "Just one more peice to go. This last part will not be so easy. I need Kallis' Head."],
    7 => [31420, 7, 8, "That is everything. Give me a few seconds to get your weapon made."]);
    my %rewards = ("Warrior" => 60332, 
    "Cleric" => 20076, 
    "Paladin" => 48147, 
    "Ranger" => 62649, 
    "Shadowknight" => 48136,
    "Druid" => 62880, 
    "Monk" => 67742, 
    "Bard" => 77640, 
    "Rogue" => 52347, 
    "Shaman" => 57405, 
    "Necromancer" => 64067, 
    "Wizard" => 16576, 
    "Magician" => 19839, 
    "Enchanter" => 52962, 
    "Beastlord" => 57054, 
    "Berserker" => 18609);
    if (!defined $qglobals{"Epic"}) {
        if (plugin::check_handin(\%itemcount, 51261 => 1)) {
            plugin::Whisper("This is just what I was looking for! The next item you need is an eye from an evil unicorn in Lesser Faydark.");
            quest::setglobal("Epic", 1, 5, "F");
        }
    } elsif (defined $qglobals{"Epic"}) {
        foreach $key (keys %handins) {
            if (plugin::check_handin(\%itemcount, $handins{$key}[0] => 1) && $qglobals{"Epic"} == $handins{$key}[1]) {
                plugin::Whisper($handins{$key}[3]);
                if ($handins{$key}[2] <= 7) {
                    quest::setglobal("Epic", $handins{$key}[2], 5, "F");
                } elsif ($handins{$key}[2] == 8) {
                    quest::gmsay("Congratulations to $name on their " . quest::varlink($rewards{$class}) . "!", 335, 1, 0, 0);
                    quest::summonitem($rewards{$class});
                    quest::setglobal("Epic", 9, 5, "F");
                }
            }
        }
    }
    plugin::return_items(\%itemcount);
}