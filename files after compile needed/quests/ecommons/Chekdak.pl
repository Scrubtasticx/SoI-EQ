sub EVENT_SAY {
$armour = quest::saylink("armour");
$materials = quest::saylink("materials");
	if($text=~/hail/i) {
		plugin::Whisper("Hail $class. Do you seek to earn some $armour?");
	} 
	elsif($text=~/armour/i) {
		plugin::Whisper("I can make you armor provided you have the proper $materials for me.");
	}
	elsif($text=~/materials/i) {
		plugin::Whisper(" Bring me a armor $Link_pattern and a $Link_crafting piece.");
	} 
}

sub EVENT_ITEM {
%ItemDB = (
	1387 => { "ReqItem1" => 1458, "ReqItem2" => 1380}, #Plate Boots
	1386 => { "ReqItem1" => 1458, "ReqItem2" => 1374}, #Plate Arms
	1384 => { "ReqItem1" => 1458, "ReqItem2" => 1375}, #Plate Wrist
	1386 => { "ReqItem1" => 1458, "ReqItem2" => 1379}, #Plate Hands
	1389 => { "ReqItem1" => 1458, "ReqItem2" => 1373}, #Plate Head
	1388 => { "ReqItem1" => 1458, "ReqItem2" => 1381}, #Plate Legs
	1383 => { "ReqItem1" => 1458, "ReqItem2" => 1382}, #Plate Chest
	1391 => { "ReqItem1" => 1503, "ReqItem2" => 1380}, #Leather boots
	1399 => { "ReqItem1" => 1503, "ReqItem2" => 1374}, #Leather arms
	1392 => { "ReqItem1" => 1503, "ReqItem2" => 1375}, #Leather wrists
	1394 => { "ReqItem1" => 1503, "ReqItem2" => 1379}, #Leather hands
	1396 => { "ReqItem1" => 1503, "ReqItem2" => 1373}, #Leather head
	1395 => { "ReqItem1" => 1503, "ReqItem2" => 1381}, #Leather legs
	1393 => { "ReqItem1" => 1503, "ReqItem2" => 1382}, #Leather Chest
	1434 => { "ReqItem1" => 1450, "ReqItem2" => 1380}, #chain boots
	1432 => { "ReqItem1" => 1450, "ReqItem2" => 1374}, #chain arms
	1435 => { "ReqItem1" => 1450, "ReqItem2" => 1375}, #chain wrists
	1439 => { "ReqItem1" => 1450, "ReqItem2" => 1379}, #chain hands
	1440 => { "ReqItem1" => 1450, "ReqItem2" => 1373}, #chain head
	1441 => { "ReqItem1" => 1450, "ReqItem2" => 1381}, #chain legs
	1436 => { "ReqItem1" => 1450, "ReqItem2" => 1382}, #chain Chest
	1443 => { "ReqItem1" => 1502, "ReqItem2" => 1380}, #silk boots
	1442 => { "ReqItem1" => 1502, "ReqItem2" => 1374}, #silk arms
	1445 => { "ReqItem1" => 1502, "ReqItem2" => 1375}, #silk wrists
	1447 => { "ReqItem1" => 1502, "ReqItem2" => 1379}, #silk hands
	1449 => { "ReqItem1" => 1502, "ReqItem2" => 1373}, #silk head
	1448 => { "ReqItem1" => 1502, "ReqItem2" => 1381}, #silk legs
	1446 => { "ReqItem1" => 1502, "ReqItem2" => 1382} #silk Chest
);
			foreach $id (sort keys %ItemDB)
			{
				if(plugin::check_handin(\%itemcount, $ItemDB{$id}{"ReqItem1"} => 1, $ItemDB{$id}{"ReqItem2"} => 1)) {
					quest::summonitem($id);
				}
			}
			plugin::return_items(\%itemcount);
}