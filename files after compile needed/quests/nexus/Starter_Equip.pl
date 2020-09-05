sub EVENT_SAY 
{
my $Items = quest::saylink("Items");
my %rewards = ("Warrior" => 60332, 
    "Cleric" => 20076 , 
    "Paladin" => 48147 , 
    "Ranger" => 62649, 
    "Shadowknight" => 48136 ,
    "Druid" => 62880 , 
    "Monk" => 67742 , 
    "Bard" => 77640, 
    "Rogue" => 52347, 
    "Shaman" => 57405 , 
    "Necromancer" => 64067, 
    "Wizard" => 16576, 
    "Magician" => 19839, 
    "Enchanter" => 52962, 
    "Beastlord" => 57054 , 
    "Berserker" => 18609);

if($ulevel <= 15 && !defined($qglobals{startitems})){
	if($text=~/Hail/i) 
	{
		plugin::Whisper("Greetings $name. Would you like starter [$Items]?"); 
	}
	elsif($text=~/Items/i)
	{
		quest::summonitem(1266);
		quest::summonitem($rewards{$class});
		quest::setglobal("startitems", ($qglobals{"starteritems"} + 1), 5, "F");
	}
	}
	else {
	plugin::Whisper("I'm sorry you either already claimed the items or you are to high of level., $name.");
		}
	}
	