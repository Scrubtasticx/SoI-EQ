sub EVENT_SAY {
    if ($text=~/Hail/i)
	{
        plugin::Whisper("I am the master of illusions, would you like me to " . quest::saylink("list", 1) . " the illusions I can cast on you?");
    }
	elsif ($text=~/List/i)
	{
        plugin::RaceChanger("List");
    }

	else
	{
		plugin::RaceChanger($text);
	}
	
}

