sub EVENT_SAY {   
    if ($text=~/hail/i) {
        $key = $client->CharacterID() . "-Epic-1.5";
        if (!quest::get_data($key)) {
            $client->Message(0, "Hello $name, along my journies I have acquired knowledge on how to create a " . quest::saylink("Weapon", 1) . " with power like none seen before.");
        }
        else {
            $client->Message(0, "Hello $name, I'm sorry but you have your epic 1.5");
        }
    }
    elsif ($text=~/^Weapon$/i && !quest::get_data($key)) {
        $client->Message(0, "In order for me to make you this special weapon I need a orb from a vampire, and your epic 1.0.");
    }
}

sub EVENT_ITEM {

	%ItemDB = (
	60321 => { "ReqItem1" => 147565, "ReqItem2" => 10908}, #Warrior
	9955  => { "ReqItem1" => 147565, "ReqItem2" => 5532},  #Cleric
	64031 => { "ReqItem1" => 147565, "ReqItem2" => 10099}, #Paladin
	62627 => { "ReqItem1" => 147565, "ReqItem2" => 20487}, #Ranger
	50003 => { "ReqItem1" => 147565, "ReqItem2" => 14383}, #Shadowknight
	62863 => { "ReqItem1" => 147565, "ReqItem2" => 20490}, #Druid
	61025 => { "ReqItem1" => 147565, "ReqItem2" => 36224}, #Monk
	77631 => { "ReqItem1" => 147565, "ReqItem2" => 20542}, #Bard
	24609 => { "ReqItem1" => 147565, "ReqItem2" => 11057}, #Rogue
	57400 => { "ReqItem1" => 147565, "ReqItem2" => 10651}, #Shaman
	62581 => { "ReqItem1" => 147565, "ReqItem2" => 20544}, #Necromancer
	12665 => { "ReqItem1" => 147565, "ReqItem2" => 14341}, #Wizard
	19092 => { "ReqItem1" => 147565, "ReqItem2" => 28034}, #Magician
	52952 => { "ReqItem1" => 147565, "ReqItem2" => 10650}, #Enchanter
	52911 => { "ReqItem1" => 147565, "ReqItem2" => 8495},  #Beastlord
	18398 => { "ReqItem1" => 147565, "ReqItem2" => 68299}, #Berserker
);
	foreach $id (sort keys %ItemDB)
			{
    if (!quest::get_data($key)) {
        if(plugin::check_handin(\%itemcount, $ItemDB{$id}{"ReqItem1"} => 1, $ItemDB{$id}{"ReqItem2"} => 1)) {
            quest::summonitem($id);
            quest::set_data($key, "1.5");
			$client->Message(0,"Congrats on your weapon.");
        }
    }
}	
    plugin::return_items(\%itemcount);
}