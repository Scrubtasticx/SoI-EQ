sub EVENT_SAY {    
    if ($ulevel <= 80 && $text=~/Hail/i) {
        $client->Message(0,"Hello $name, would you like some " . quest::saylink("Buffs", 1) . " these buffs increases as you level.");
    } elsif ($ulevel <= 80 && $text=~/Buffs/i) {
        quest::popup("Confirmation Window", "Are you sure you would like to purchase buffs?<br><font color ='#00FFFF'>Level $ulevel buffs cost " . plugin::GetBuffCost() . " Platinum.</font>", 998, 1);
    } elsif ($ulevel <= 80 && $text=~/Price/i) {
        plugin::ListBuffPrices();
    }
	else
	{
		$client->Message(0,"I'm sorry $name. You are not a newbie anymore please get buffs on your own."); 
	}
}

sub EVENT_POPUPRESPONSE {
    plugin::HandleBuffBot();
}