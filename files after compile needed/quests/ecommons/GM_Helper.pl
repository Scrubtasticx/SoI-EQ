#############
#Written By : Cubber
#Quest Name: Items and levels for a Small Server.
#Quest Zone: Bazaar
#Quest NPC: Galarono_McHalorsos
#################
sub EVENT_SAY
{
   	if($text=~/Hail/i && ($status >= 200))
      		{
         	plugin::Whisper("Hello there $name! I have in my possesion some very fine items, as well as a few useful abilities that I am offering to adventurers for a small donation.  Are you ".quest::saylink("[Interested]",1)." in what I have to offer?");
      		}
	elsif ($text=~/Hail/i && ($status <= 200))
			{
			plugin::Whisper("I'm sorry but you are not a GM.");
			}
	
	elsif ($text=~/Interested/i)
		
		{
			plugin::Whisper("Tell me $race what are ya looking for? ".quest::saylink("[Bags]",1).", ".quest::saylink("[Pet Gear]",1).", ".quest::saylink("[Spells]",1).", some ".quest::saylink("[Dye]",1)." for your armour, or some very ".quest::saylink("[Special Items]",1)."?  I can also help you catch up to your friends by granting you some ".quest::saylink("[Levels]",1)." or ".quest::saylink("[AA Points]",1).".  If you need me to I can ".quest::saylink("[Refund]",1)." your AA's as well.");
		}
			
				elsif ($text=~/dye/i)
					{
						plugin::Whisper("I will trade you a stack of armour dye for 25 platinum pieces.");
					}

				elsif ($text=~/bags/i)
					{
						plugin::Whisper("I will trade you a nice bag for 50 platinum pieces.");
					}
			
				elsif ($text=~/Pet Gear/i)
					{
						plugin::Whisper("I will trade you some nice gear for your pet for 100 platinum pieces.");
					}

				elsif ($text=~/Special Items/i)
					{
						plugin::Whisper("I will trade you a few very special items for 10000 platinum pieces.");
					}
			
								
				elsif ($text=~/AA Points/i)
					{
						plugin::Whisper("I will grant you 5 regular AA Points for 2500 platinum pieces.");
					}
					
	
				elsif ($text=~/Levels/i)
					{
						plugin::Whisper("I will grant you 1 level for 5000 platinum pieces.");
					}
				
				elsif ($text=~/Spells/i)
					{
						plugin::Whisper("I will grant you all of the spells up to your current level for 500 platinum pieces.");
					}
					
				elsif ($text=~/Refund/i)
					{
						plugin::Whisper("I can reset, and refund your regular AA Points for a fee of 2000 platinum pieces.");
						quest::me("Please note: this will automatically log you out of the world in order to perform the reset.");
					}
				
}

sub EVENT_ITEM

{

	if($platinum ==25)
		{
			quest::summonitem("32557","20");
		}

	elsif($platinum ==50)
		{
			quest::summonitem("17145");
		}

	elsif($platinum ==100)
		{
			quest::summonitem("46987");
			quest::summonitem("28595");
			quest::summonitem("28595");
			quest::summonitem("28596");
			quest::summonitem("28596");
			quest::summonitem("28598");
		}
	
	elsif($platinum ==10000)
		{
			quest::summonitem("31951");
			quest::summonitem("31883");
			quest::summonitem("31881");
			quest::summonitem("31885");
			quest::summonitem("31954");
		}

	elsif($platinum ==2500)
		{
			quest::ding();
			quest::emote("grants you 5 AA Points!");
			$client->AddAAPoints(5);
		}

	elsif($platinum ==5000)
		{
			quest::emote("grants you 1 level!");
			quest::level(quest::getlevel(0) +1);
		}
			
	elsif($platinum ==500)
		{
			quest::scribespells(quest::getlevel(0));
			quest::emote("points at your spellbook");
		}

	elsif($platinum ==2000)
		{
			quest::emote("strips you of your abilities and refreshes your spirit");
			$client->RefundAA();
		}
}