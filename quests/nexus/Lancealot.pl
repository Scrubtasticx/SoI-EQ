sub EVENT_SAY:{
my $go = quest::saylink("Quest");
        if($text=~/hail/i){
		   $key = $client->CharacterID() . "-Epic-1.5";
		   if (quest::get_data($key)) {
			plugin::Whisper ("Good day to you, $name. I can assign you to a [$go] for a weapon.");
           }
           else {
            $client->Message(0, "Hello $name, I'm sorry but you need your 1.5 first.");
           }
	    }
		elsif($text=~/Quest/i )
		{
          if(quest::get_data($key) && !quest::istaskactive(291) && !quest::istaskcompleted(291))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(291);
          }
	}
}

sub EVENT_ITEM {
$key = $client->CharacterID() . "-Epic-2.0";

	%ItemDB = (
	60332 => { "ReqItem1" => 147592, "ReqItem2" => 147594, "ReqItem3" => 147595}, #Warrior
	20076 => { "ReqItem1" => 147592, "ReqItem2" => 147594, "ReqItem3" => 147596}, #Cleric
	48147 => { "ReqItem1" => 147592, "ReqItem2" => 147594, "ReqItem3" => 147597}, #Paladin
	62649 => { "ReqItem1" => 147592, "ReqItem2" => 147594, "ReqItem3" => 147598}, #Ranger
	48136 => { "ReqItem1" => 147592, "ReqItem2" => 147594, "ReqItem3" => 147599}, #Shadowknight
	62880 => { "ReqItem1" => 147592, "ReqItem2" => 147594, "ReqItem3" => 147600}, #Druid
	67742 => { "ReqItem1" => 147592, "ReqItem2" => 147594, "ReqItem3" => 147601}, #Monk
	77640 => { "ReqItem1" => 147592, "ReqItem2" => 147594, "ReqItem3" => 147602}, #Bard
	52347 => { "ReqItem1" => 147592, "ReqItem2" => 147594, "ReqItem3" => 147603}, #Rogue
	57405 => { "ReqItem1" => 147592, "ReqItem2" => 147594, "ReqItem3" => 147604}, #Shaman
	64067 => { "ReqItem1" => 147592, "ReqItem2" => 147594, "ReqItem3" => 147605}, #Necromancer
	16576 => { "ReqItem1" => 147592, "ReqItem2" => 147594, "ReqItem3" => 147606}, #Wizard
	19839 => { "ReqItem1" => 147592, "ReqItem2" => 147594, "ReqItem3" => 147607}, #Magician
	52962 => { "ReqItem1" => 147592, "ReqItem2" => 147594, "ReqItem3" => 147608}, #Enchanter
	52911 => { "ReqItem1" => 147592, "ReqItem2" => 147594, "ReqItem3" => 147609}, #Beastlord
	18609 => { "ReqItem1" => 147592, "ReqItem2" => 147594, "ReqItem3" => 147610}, #Berserker
);
	foreach $id (sort keys %ItemDB)
			{
    if (!quest::get_data($key)) {
        if(plugin::check_handin(\%itemcount, $ItemDB{$id}{"ReqItem1"} => 1,$ItemDB{$id}{"ReqItem2"} => 1, $ItemDB{$id}{"ReqItem3"} => 1)) {
            quest::summonitem($id);
            quest::set_data($key, "2.0");
			$client->Message(0,"Congrats on your weapon.");
        }
    }
}	
    plugin::return_items(\%itemcount);
}