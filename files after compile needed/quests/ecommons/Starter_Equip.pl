sub EVENT_SAY 
{
my $Items = quest::saylink("Items");
my %rewards = ("Warrior" => 1119, 
    "Cleric" => 1119 , 
    "Paladin" => 1119 , 
    "Ranger" => 1096, 
    "Shadowknight" => 1119 ,
    "Druid" => 1119 , 
    "Monk" => 1119 , 
    "Bard" => 1119, 
    "Rogue" => 1096, 
    "Shaman" => 1119 , 
    "Necromancer" => 1096, 
    "Wizard" => 1096, 
    "Magician" => 1096, 
    "Enchanter" => 1096, 
    "Beastlord" => 1119 , 
    "Berserker" => 201042);

if($ulevel <= 15 && !defined($qglobals{startitems})){
	if($text=~/Hail/i) 
	{
		plugin::Whisper("Greetings $name. Would you like starter [$Items]?"); 
	}
	elsif($text=~/Items/i)
	{
		quest::summonitem(1266);
		quest::summonitem(1079);
		quest::summonitem($rewards{$class});
		quest::setglobal("startitems", ($qglobals{"starteritems"} + 1), 5, "F");
	}
	}
	else {
	plugin::Whisper("I'm sorry you either already claimed the items or you are to high of level., $name.");
		}
	}
	