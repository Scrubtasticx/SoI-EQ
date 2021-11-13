sub EVENT_SPAWN {
    quest::emote("appears from a golden portal and begins searching the corpse for valuables.");
	quest::npcgender(2);
	quest::npctexture(3);
#	$item = 21820;
#	$npc->AddItem($item);
    quest::settimer("despawn",90); #90 sec timer for despawn
}

sub EVENT_TIMER {
    if($timer eq "despawn") {
        quest::emote("conjures a dark portal and disappears into it.");
        quest::depop();
    }
}