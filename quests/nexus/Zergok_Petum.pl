sub EVENT_SAY{

#	my $go = quest::saylink("PoK");
#	my $Items = quest::saylink("Items");
#	my %rewards = ("Warrior" => 60332, 
 #   "Cleric" => 20076 , 
  #  "Paladin" => 48147 , 
   # "Ranger" => 62649, 
    #"Shadowknight" => 48136 ,
    #"Druid" => 62880 , 
    #"Monk" => 67742 , 
    #"Bard" => 77640, 
    #"Rogue" => 52347, 
    #"Shaman" => 57405 , 
    #"Necromancer" => 64067, 
    #"Wizard" => 16576, 
    #"Magician" => 19839, 
    #"Enchanter" => 52962, 
    #"Beastlord" => 57054 , 
    #"Berserker" => 18609);
	if($text=~/hail/i){
	
	# plugin::Whisper ("Good day to you, $name. I can teleport you to PoK, are you ready to [$go]? I can also give you starter [$Items].");
	plugin::Whisper ("Good day to you, $name.");
	
	my $TextToCenter = plugin::PWAutoCenter("Welcome to Redemption EQ");
	my $TextToCenter2 = plugin::PWAutoCenter("All hotzones are in the Instance NPC");
	my $TextToCenter3 = plugin::PWAutoCenter("We have tons of custom NPCs in our hub. For link to our website for spell file and forums. Click the discord link below");
	my $Indent = plugin::PWIndent();
	my $TextToCenter4 = plugin::PWAutoCenter("");
	my $TextToCenter5 = plugin::PWAutoCenter("Alpha Phase");
	my $Link = plugin::PWHyperLink("https://discord.gg/nkPZBeU", "Return of the Sleeper (Discord Server!)");
	my $Yel = plugin::PWColor("Yellow");
	my $Blu = plugin::PWColor("Light Blue");
	my $Red = plugin::PWColor("Red");
	my $grn = plugin::PWColor("Forest Green");
	quest::popup("Guide NPC", "$TextToCenter <br>
	$Yel $TextToCenter2 </c> <br>
	$Blu $TextToCenter3 </c> <br>
	<br><br>
	$Red $TextToCenter4 </c> <br>
	$grn $TextToCenter5 </c> <br><br><br>
	$Indent $Link
	");
	}
#    if ($text =~/PoK/i) {
#        quest::movepc(202, 344.321, 391.287, -126.81);
#		}
		
#	if($text=~/Items/i){
#		if($ulevel <= 15 && !defined($qglobals{startitems})){
#	{
#		quest::summonitem(1266);
#		quest::summonitem($rewards{$class});
#		quest::setglobal("startitems", ($qglobals{"starteritems"} + 1), 5, "F");
#	}
#	}
#	else {
#	plugin::Whisper("I'm sorry you either already claimed the items or you are to high of level., $name.");
#		}
}