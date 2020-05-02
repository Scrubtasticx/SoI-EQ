sub EVENT_SAY {
    if ($text=~/Hail/i)
	{
        plugin::Whisper("I am the master of illusions, would you like me to " . quest::saylink("list", 1) . " the illusions I can cast on you?");
    }
	elsif (($client->GetAAPoints >=1000) && ($text=~/List/i))
	{
        plugin::RaceChanger("List");
    }
	elsif (($client->GetAAPoints < 1000) && ($text=~/List/i))
	{
        $client->Message(315, "You need 1000 AA's to change your race!");
    }
	else
	{
		my $total = $client->GetAAPoints();
		my $cost = (1000);
		$total = int($total-$cost);     
		$client->SetAAPoints($total);
		plugin::RaceChanger($text);
	}
	
}

