sub EVENT_SAY {   
    if ($text=~/hail/i) {
        $key = $client->CharacterID() . "-Epic-status";
        if (!quest::get_data($key)) {
            $client->Message(0, "Hello $name, I'm sorry but you have your epic 1.5");
        }
        else {
            $client->Message(0, "Hello $name, along my journies I have acquired knowledge on how to create a " . quest::saylink("Weapon", 1) . " with power like none seen before.");
        }
    }
    elsif ($text=~/^Weapon$/i) {
        $client->Message(0, "In order for me to make you this special weapon I need a orb from a vampire, and you epic 1.0.");
    }
}

sub EVENT_ITEM {

	%ItemDB = (
	60332 => { "ReqItem1" => 147565, "ReqItem2" => 10908}, #Warrior
	20076 => { "ReqItem1" => 147565, "ReqItem2" => 5532}, #Cleric
	48147 => { "ReqItem1" => 147565, "ReqItem2" => 10099}, #Paladin
	62649 => { "ReqItem1" => 147565, "ReqItem2" => 20487}, #Ranger
	48136 => { "ReqItem1" => 147565, "ReqItem2" => 14383}, #Shadowknight
	62880 => { "ReqItem1" => 147565, "ReqItem2" => 20490}, #Druid
	67742 => { "ReqItem1" => 147565, "ReqItem2" => 10652}, #Monk
	77640 => { "ReqItem1" => 147565, "ReqItem2" => 20542}, #Bard
	52347 => { "ReqItem1" => 147565, "ReqItem2" => 11057}, #Rogue
	57405 => { "ReqItem1" => 147565, "ReqItem2" => 10651}, #Shaman
	64067 => { "ReqItem1" => 147565, "ReqItem2" => 20544}, #Necromancer
	16576 => { "ReqItem1" => 147565, "ReqItem2" => 14341}, #Wizard
	19839 => { "ReqItem1" => 147565, "ReqItem2" => 28034}, #Magician
	52962 => { "ReqItem1" => 147565, "ReqItem2" => 10650}, #Enchanter
	52911 => { "ReqItem1" => 147565, "ReqItem2" => 8495}, #Beastlord
	18609 => { "ReqItem1" => 147565, "ReqItem2" => 68299}, #Berserker
);
	foreach $id (sort keys %ItemDB)
			{
    if (!defined $qglobals{"Epic-1.5"}) {
        if(plugin::check_handin(\%itemcount, $ItemDB{$id}{"ReqItem1"} => 1, $ItemDB{$id}{"ReqItem2"} => 1)) {
            quest::summonitem($rewards{$class});
            quest::set_data($key, "1.5");
			plugin::Whisper("Congrats on your weapon.");
        }
    }
}	
    plugin::return_items(\%itemcount);
}