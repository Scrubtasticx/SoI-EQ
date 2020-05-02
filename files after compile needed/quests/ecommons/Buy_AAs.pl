sub EVENT_SAY
 {
        #:: Create a scalar variable to store the cost in plat
		my $cost1 = 5000;
		my $cost2 = 25000;
		my $cost3 = 50000;
        my $cost4 = 100000;
		#:: Create a scalar variable to store the price
		my $Tiny = quest::saylink("5k");
		my $Small = quest::saylink("30k");
		my $Big = quest::saylink("50k");
		my $Max = quest::saylink("100k");
		
        if ($text=~/hail/i)
		{
				$client->Message(315, " ");
                plugin::Whisper("Hello $name, I can give you AA points for platinum. The Exchange rate is [ 5k for 50 AA ], [ 30k for 100 AA ], [ 50k for 150 AA ], or [ 100k for 250 AA ].");
				$client->Message(315, " ");
				$client->Message(315, "[ $Tiny ] , [ $Small ] , [ $Big ] , [ $Max ]");
				$client->Message(315, " ");
        }
		elsif ($text=~/5k/i)
		{
				if ($client->TakeMoneyFromPP($cost1*1000, 1))
				{
                        #:: Give 50 AAs
                        $client->AddAAPoints(50);
                        quest::ding();
						plugin::Whisper("I have given you 50 AA points.");
                }
                else
				{
                        plugin::Whisper("Come back when you have enough money scrub!");
                }
        }
		
        elsif ($text=~/30k/i)
		{
                if ($client->TakeMoneyFromPP($cost2*1000, 1))
				{
                        #:: Give 100 AAs
                        $client->AddAAPoints(100);
                        quest::ding();
						plugin::Whisper("I have given you 100 AA points.");
                }
                else
				{
                        plugin::Whisper("Come back when you have enough money scrub!");
                }
        }
		
		elsif ($text=~/50k/i)
		{
                if ($client->TakeMoneyFromPP($cost3*1000, 1))
				{
                        #:: Give 150 AAs
                        $client->AddAAPoints(150);
                        quest::ding();
						plugin::Whisper("I have given you 150 AA points.");
                }
                else
				{
                        plugin::Whisper("Come back when you have enough money scrub!");
                }
        }
		
		elsif ($text=~/100k/i)
		{
                if ($client->TakeMoneyFromPP($cost4*1000, 1))
				{
                        #:: Give 250 AAs
                        $client->AddAAPoints(250);
                        quest::ding();
						plugin::Whisper("I have given you 250 AA points.");
                }
                else
				{
                        plugin::Whisper("Come back when you have enough money scrub!");
                }
        }
}