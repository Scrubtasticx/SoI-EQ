sub EVENT_SAY {    
    if ($ulevel <= 100 && $text=~/Hail/i) {
        plugin::Whisper("Hello $name, would you like some " . quest::saylink("Buffs", 1) . "? Keep in mind, the " . quest::saylink("Price", 1) . " of these buffs increases as you level.");
    } elsif ($ulevel <= 100 && $text=~/Buffs/i) {
        quest::popup("Confirmation Window", "Are you sure you would like to purchase buffs?<br><font color ='#00FFFF'>Level $ulevel buffs cost " . plugin::GetBuffCost() . " Platinum.</font>", 998, 1);
    } elsif ($ulevel <= 100 && $text=~/Price/i) {
        plugin::ListBuffPrices();
    }
	else
	{
		plugin::Whisper("I'm sorry $name. You are not a newbie anymore please get buffs on your own."); 
	}
}

sub EVENT_POPUPRESPONSE {
    plugin::HandleBuffBot();
}