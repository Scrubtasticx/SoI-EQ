# items: 85062, 1002, 85064, 85068, 85065, 85063, 85066, 85067
sub EVENT_SPAWN {
	quest::say("I am not easily killed!");
	quest::settimer(1,300);
}	

sub EVENT_SAY {
	if(quest::istaskactivityactive(222,7)) {
		if($text=~/Hail/i) {
			$pcpvp = $client->GetPVP();
			my $newzone_toby = plugin::GetRandomFreeLocation(0,30);
			my $npcid = 999100;

			quest::say("You need to see the old man now.");
			quest::updatetaskactivity(222,7);
			if($qglobals{halloween_ratter_complete} < 7){
				quest::summonitem(85062); # Item: Bristlebane's Ticket of Admission
				quest::summonitem(1002); # Item: Cloth Veil
				quest::setglobal("halloween_ratter_complete",7,5,"D30");
			}
			if($qglobals{halloween_ratter_complete} > 6){
				$client->Message(0, "You have already claimed a reward for this activity or a higher and do not qualify for another.");
			}
			if($qglobals{halloween_ratter_complete_pvp} < 7 && $pcpvp == 1){
				quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),10); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
				quest::setglobal("halloween_pvp_toby",1,5,"D30");
				quest::setglobal("halloween_ratter_complete_pvp",7,5,"D30");
			}
			if(qglobals{halloween_ratter_complete_pvp} > 6 && $pcpvp == 1){
				$client->Message(0, "You have already claimed a PVP reward for this activity or a higher and do not qualify for another.");
			}
			quest::targlobal("halloween_ratter_toby",$newzone_toby,"F",0,0,0);
			quest::signalwith($npcid,2);
			quest::delglobal("halloween_lock_toby");
			quest::depop();
		}
	}
}

sub EVENT_TIMER {
	quest::stoptimer(1);
	my $newzone_toby = plugin::GetRandomFreeLocation(0,30);
	my $npcid = 999100;
	quest::signalwith($npcid,2);
	quest::targlobal("halloween_ratter_toby",$newzone_toby,"F",0,0,0);
	quest::delglobal("halloween_lock_toby");
	quest::depop();
}