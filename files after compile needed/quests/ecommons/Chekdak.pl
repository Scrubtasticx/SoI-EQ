sub EVENT_SAY {
$armor = quest::saylink("armor");
$materials = quest::saylink("materials");

	if($text=~/hail/i) {
		plugin::Whisper("Hail $class. Do you seek to earn some $armor?");
	} 
	elsif($text=~/armor/i) {
		plugin::Whisper("I can make you armor provided you have the proper $materials for me.");
	}
	elsif($text=~/materials/i) {
		plugin::Whisper(" Bring me a Illuminated Armor Pattern and a Illuminated Remnant.");
	} 
}

sub EVENT_ITEM {
%ItemDB = (
	201014 => { "ReqItem1" => 201042, "ReqItem2" => 201043}, #Plate Helm
	201015 => { "ReqItem1" => 201042, "ReqItem2" => 201044}, #Plate Chest
	201016 => { "ReqItem1" => 201042, "ReqItem2" => 201045}, #Plate Wrist
	201017 => { "ReqItem1" => 201042, "ReqItem2" => 201046}, #Plate Arms
	201018 => { "ReqItem1" => 201042, "ReqItem2" => 201047}, #Plate Legs
	201019 => { "ReqItem1" => 201042, "ReqItem2" => 201048}, #Plate Boots
	201020 => { "ReqItem1" => 201042, "ReqItem2" => 201049}, #Plate Gloves
	201021 => { "ReqItem1" => 201042, "ReqItem2" => 201050}, #Leather Helm
	201022 => { "ReqItem1" => 201042, "ReqItem2" => 201051}, #Leather Chest
	201023 => { "ReqItem1" => 201042, "ReqItem2" => 201052}, #Leather Wrist
	201024 => { "ReqItem1" => 201042, "ReqItem2" => 201053}, #Leather Arms
	201025 => { "ReqItem1" => 201042, "ReqItem2" => 201054}, #Leather Legs
	201026 => { "ReqItem1" => 201042, "ReqItem2" => 201055}, #Leather Boots
	201027 => { "ReqItem1" => 201042, "ReqItem2" => 201056}, #Leather Gloves
	201007 => { "ReqItem1" => 201042, "ReqItem2" => 201057}, #Chain Helm
	201008 => { "ReqItem1" => 201042, "ReqItem2" => 201058}, #Chain Chest
	201009 => { "ReqItem1" => 201042, "ReqItem2" => 201059}, #Chain Wrist
	201010 => { "ReqItem1" => 201042, "ReqItem2" => 201060}, #Chain Arms
	201011 => { "ReqItem1" => 201042, "ReqItem2" => 201061}, #Chain Legs
	201012 => { "ReqItem1" => 201042, "ReqItem2" => 201062}, #Chain Boots
	201013 => { "ReqItem1" => 201042, "ReqItem2" => 201063}, #Chain Gloves
	201000 => { "ReqItem1" => 201042, "ReqItem2" => 201064}, #Silk Helm
	201001 => { "ReqItem1" => 201042, "ReqItem2" => 201065}, #Silk Chest
	201002 => { "ReqItem1" => 201042, "ReqItem2" => 201066}, #Silk Wrist
	201003 => { "ReqItem1" => 201042, "ReqItem2" => 201067}, #Silk Arms
	201004 => { "ReqItem1" => 201042, "ReqItem2" => 201068}, #Silk Legs
	201005 => { "ReqItem1" => 201042, "ReqItem2" => 201069}, #Silk Boots
	201006 => { "ReqItem1" => 201042, "ReqItem2" => 201070} #Silk Gloves
);
			foreach $id (sort keys %ItemDB)
			{
				if(plugin::check_handin(\%itemcount, $ItemDB{$id}{"ReqItem1"} => 1, $ItemDB{$id}{"ReqItem2"} => 1)) {
					quest::summonitem($id);
				}
			}
			plugin::return_items(\%itemcount);
}