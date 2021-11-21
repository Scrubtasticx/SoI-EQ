sub EVENT_SAY
 {	
        #:: Create a scalar variable to store the cost in plat
		my $cost1 = 5000;
		my $cost2 = 25000;
		my $cost3 = 250000;
        my $cost4 = 500000;
		
		my $price1 = 100;
		my $price2 = 250;
		my $price3 = 500;
		my $price4 = 1000;
		#:: Create a scalar variable to store the price
		my $sell = quest::saylink("sell");
		my $Tiny = quest::saylink("5k");
		my $Small = quest::saylink("25k");
		my $Big = quest::saylink("250k");
		my $Max = quest::saylink("500k");
		
		my $s1 = quest::saylink("100");
		my $s2 = quest::saylink("250");
		my $s3 = quest::saylink("500");
		my $s4 = quest::saylink("1000");
		
		my $total = $client->GetAAPoints();
		
        if ($text=~/hail/i)
		{
				$client->Message(315, " ");
                plugin::Whisper("Hello $name, You can buy or sell AAs to me. The exchange rate is 250p per AA.");
				$client->Message(315, "  ");
				$client->Message(315, " BUY [ $Tiny ] , [ $Small ] , [ $Big ] , [ $Max ]");
				$client->Message(315, "  ");
				$client->Message(315, " SELL [ $s1 ] , [ $s2 ] , [ $s3 ] , [ $s4 ]");
				$client->Message(315, " ");
        }
		
		if ($text=~/100/i)
		{
			my $plat = $total+$price1*100;
			
			if($total >= $price1)         #Cost of the item
			{
				$fin = int($total-$price1);     
				$client->SetAAPoints($fin);
				$client->Message(315, "You have sold $total AA points.");
				quest::givecash(0,0,0,$plat);
			}
			else 
			{
				plugin::Whisper("You need more AA points for $itemlink.");  #Player did not have enough AA
			}
		}
		
		if ($text=~/250/i)
		{
			my $plat = $total+$price2*250;
			
			if($total >= $price2)         #Cost of the item
			{
				$fin = int($total-$price2);     
				$client->SetAAPoints($fin);
				$client->Message(315, "You have sold $total AA points.");
				quest::givecash(0,0,0,$plat);
			}
			else 
			{
				plugin::Whisper("You need more AA points for $itemlink.");  #Player did not have enough AA
			}
		}
		
		if ($text=~/500/i)
		{
			my $plat = $total+$price3*500;
			
			if($total >= $price3)         #Cost of the item
			{
				$fin = int($total-$price3);     
				$client->SetAAPoints($fin);
				$client->Message(315, "You have sold $total AA points.");
				quest::givecash(0,0,0,$plat);
			}
			else 
			{
				plugin::Whisper("You need more AA points for $itemlink.");  #Player did not have enough AA
			}
		}
		
		if ($text=~/1000/i)
		{
			my $plat = $total+$price4*1000;
			
			if($total >= $price4)         #Cost of the item
			{
				$fin = int($total-$price4);     
				$client->SetAAPoints($fin);
				$client->Message(315, "You have sold $total AA points.");
				quest::givecash(0,0,0,$plat);
			}
			else 
			{
				plugin::Whisper("You need more AA points for $itemlink.");  #Player did not have enough AA
			}
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
		
        elsif ($text=~/25k/i)
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
		
		elsif ($text=~/250k/i)
		{
                if ($client->TakeMoneyFromPP($cost3*1000, 1))
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
		
		elsif ($text=~/500k/i)
		{
                if ($client->TakeMoneyFromPP($cost4*1000, 1))
				{
                        #:: Give 500 AAs
                        $client->AddAAPoints(500);
                        quest::ding();
						plugin::Whisper("I have given you 500 AA points.");
                }
                else
				{
                        plugin::Whisper("Come back when you have enough money scrub!");
                }
        }
}