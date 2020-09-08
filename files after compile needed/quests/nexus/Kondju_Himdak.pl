sub EVENT_SAY {
    my %responses = (1 => "The next item you need is an eye from an evil unicorn in Lesser Faydark.");
    
    if ($text =~/Hail/i && $ulevel >= 60 && !defined $qglobals{"Epic-1.5"}) {
        plugin::Whisper("Hello $name, along my journies I have acquired knowledge on how to create a " . quest::saylink("Weapon", 1) . " with power like none seen before.");
    } elsif ($text =~/Hail/i && $ulevel <= 59 && !defined $qglobals{"Epic-1.5"}) {
        plugin::Whisper("Hello $name, I'm sorry but you must be level 60 to start your 1.5");
    } 
    if ($text=~/^Weapon$/i) {
        plugin::Whisper("In order for me to make you this special weapon I need a orb from a vampire.");
    }
}

sub EVENT_ITEM {
    my %handins = (1 => [147565]);
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
    "Beastlord" => 52911, 
    "Berserker" => 18609);
    if (!defined $qglobals{"Epic-1.5"}) {
        if (plugin::check_handin(\%itemcount, 147565 => 1)) {
            quest::summonitem($rewards{$class});
            quest::setglobal("Epic-1.5", 1, 5, "F");
			plugin::Whisper("Congrats on your weapon.");
        }
    } 
    plugin::return_items(\%itemcount);
}