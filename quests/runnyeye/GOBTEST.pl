sub EVENT_SPAWN {
quest::setnexthpevent(90);
quest::shout("My Lands My Domain. Flee you filth.");
}

sub EVENT_AGGRO {
quest::say("You can Never Escape!");
}

sub EVENT_HP {
if($hpevent == 90) {
quest::say("RaWR!");
quest::modifynpcstat("ac", "1087");
quest::npcsize(1);
$npc->CastSpell($target, 904);
quest::setnexthpevent(70);
}

if($hpevent == 70) {
	$npc->CastSpell($target, 904);
	quest::modifynpcstat("min_hit", 150);
	quest::modifynpcstat("max_hit", 250);
	quest::setnexthpevent(51);
}


sub EVENT_TIMER {
	my $hate = $npc->GetHateRandom();
	
	if($timer == 1) {
		$npc->SpellFinished(438,$hate);
		quest::say("You dont stand a chance!");
	}
  }
}