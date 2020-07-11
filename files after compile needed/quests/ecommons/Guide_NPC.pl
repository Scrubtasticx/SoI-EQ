sub EVENT_SAY{
	if($text=~/hail/i){
	my $TextToCenter = plugin::PWAutoCenter("Welcome to Return of the Sleeper");
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
}