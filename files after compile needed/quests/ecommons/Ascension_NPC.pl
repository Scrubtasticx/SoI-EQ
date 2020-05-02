sub EVENT_SAY {

	my $Ascend = quest::saylink ("Ascend", 1);
	my $total = $client->GetAAPoints();
	my $cost = (2000);
	
		if ($text=~/Hail/i)
		{
			if (($client->GetAAPoints >=2000) && ($ulevel == 65) && (defined $qglobals{"Epic"}))
			{
			$client->Message(315, " ");
			$client->Message(315,"Hello, $name!  What an amazing world we live in. You have reached amazing Power. But there is more to learn for us all. You may now [$Ascend] ! ");
			$client->Message(315, " ");
			}
			else
			{
			$client->Message(315, " ");
			$client->Message(315,"Hello, $name you must be level 65 with 2k unspent AAs and your Epic finished to ascend!");
			$client->Message(315, " ");
			}
		}

		my $rebirth = quest::saylink ("Rebirth", 1);

		if ($text =~/Ascend/i){
			$client->Message(315, " ");
			$client->Message(315,"You may choose to be reborn as a new class. You will return to a state of a new life. You may remember some of your past life feats. And with your [$rebirth] you will be stronger than before.");
			$client->Message(315, " ");
		}


		my $Bard = quest::saylink ("Bard", 1);
		my $Beastlord = quest::saylink ("Beastlord", 1);
		my $Berserker = quest::saylink ("Berserker", 1);
		my $Cleric = quest::saylink ("Cleric", 1);
		my $Druid = quest::saylink ("Druid", 1);
		my $Enchanter = quest::saylink ("Enchanter", 1);
		my $Necromancer = quest::saylink ("Necromancer", 1);
		my $Magician = quest::saylink ("Mage", 1);
		my $Monk = quest::saylink ("Monk", 1);
		my $Paladin = quest::saylink ("Paladin", 1);
		my $Ranger = quest::saylink ("Ranger", 1);
		my $Rogue = quest::saylink ("Rogue", 1);
		my $Shadowknight = quest::saylink ("Shadowknight", 1);
		my $Shaman = quest::saylink ("Shaman", 1);
		my $Warrior = quest::saylink ("Warrior", 1);
		my $Wizard = quest::saylink ("Wizard", 1);


		if ($text =~/Rebirth/i){
			quest::say ("What would you like to become?");
			$client->Message(315, " ");
			$client->Message(315,"Your Rebirth will cause you to leave this world for a moment.");
			$client->Message(315, " ");

			$client->Message(315, "[ $Bard ] [ $Beastlord ] [ $Berserker ] [ $Cleric ] [ $Druid ] [ $Enchanter ] [ $Necromancer ] [ $Magician ]");
			$client->Message(315, " ");
			$client->Message(315, "[ $Monk ] [ $Paladin ] [ $Ranger ] [ $Rogue ] [ $Shadowknight ] [ $Shaman ] [ $Warrior ] [ $Wizard ]");
		}

		if ($text =~/Bard/i){
			quest::level(1);
			quest::incstat(0, +1);
			quest::incstat(3, +1);
			quest::incstat(6, +2);
			$total = int($total-$cost);     
			$client->SetAAPoints($total); 
			quest::summonitem(200002);
			if (!defined $qglobals{"Ascend"}) { quest::setglobal("Ascend", 1, 5, "F"); }
			quest::delglobal("CharMaxLevel");
			quest::permaclass(8);
		}
		if ($text =~/Beastlord/i){
			quest::level(1);
			quest::incstat(1, +1);
			quest::incstat(2, +2);
			quest::incstat(4, +1);
			$total = int($total-$cost);     
			$client->SetAAPoints($total);
			quest::summonitem(200001);
			if (!defined $qglobals{"Ascend"}) { quest::setglobal("Ascend", 1, 5, "F"); }
			quest::delglobal("CharMaxLevel");
			quest::permaclass(15);
		}
		if ($text =~/Berserker/i){
			quest::level(1);
			quest::incstat(0, +1);
			quest::incstat(1, +2);
			quest::incstat(3, +1);
			$total = int($total-$cost);     
			$client->SetAAPoints($total);
			quest::summonitem(200003);
			if (!defined $qglobals{"Ascend"}) { quest::setglobal("Ascend", 1, 5, "F"); }
			quest::delglobal("CharMaxLevel");
			quest::permaclass(16);
		}
		if ($text =~/Cleric/i){
			quest::level(1);
			quest::incstat(0, +1);
			quest::incstat(1, +1);
			quest::incstat(4, +2);
			$total = int($total-$cost);     
			$client->SetAAPoints($total);
			quest::summonitem(200009);
			if (!defined $qglobals{"Ascend"}) { quest::setglobal("Ascend", 1, 5, "F"); }
			quest::delglobal("CharMaxLevel");
			quest::permaclass(2);
		}
		if ($text =~/Druid/i){
			quest::level(1);
			quest::incstat(1, +2);
			quest::incstat(4, +2);
			$total = int($total-$cost);     
			$client->SetAAPoints($total);
			quest::summonitem(200009);
			if (!defined $qglobals{"Ascend"}) { quest::setglobal("Ascend", 1, 5, "F"); }
			quest::delglobal("CharMaxLevel");
			quest::permaclass(6);
		}
		if ($text =~/Enchanter/i){
			quest::level(1);
			quest::incstat(5, +2);
			quest::incstat(6, +2);
			$total = int($total-$cost);     
			$client->SetAAPoints($total);
			quest::summonitem(200009);
			if (!defined $qglobals{"Ascend"}) { quest::setglobal("Ascend", 1, 5, "F"); }
			quest::delglobal("CharMaxLevel");
			quest::permaclass(14);
		}
		if ($text =~/Mage/i){
			quest::level(1);
			quest::incstat(1, +2);
			quest::incstat(5, +2);
			$total = int($total-$cost);     
			$client->SetAAPoints($total);
			quest::summonitem(200009);
			if (!defined $qglobals{"Ascend"}) { quest::setglobal("Ascend", 1, 5, "F"); }
			quest::delglobal("CharMaxLevel");
			quest::permaclass(13);
		}
		if ($text =~/Monk/i){
			quest::level(1);
			quest::incstat(0, +1);
			quest::incstat(1, +1);
			quest::incstat(2, +1);
			quest::incstat(3, +1);
			$total = int($total-$cost);     
			$client->SetAAPoints($total);
			quest::summonitem(200004);
			if (!defined $qglobals{"Ascend"}) { quest::setglobal("Ascend", 1, 5, "F"); }
			quest::delglobal("CharMaxLevel");
			quest::permaclass(7);
		}
		if ($text =~/Necromancer/i){
			quest::level(1);
			quest::incstat(3, +2);
			quest::incstat(5, +2);
			$total = int($total-$cost);     
			$client->SetAAPoints($total);
			quest::summonitem(200009);
			if (!defined $qglobals{"Ascend"}) { quest::setglobal("Ascend", 1, 5, "F"); }
			quest::delglobal("CharMaxLevel");
			quest::permaclass(11);
		}
		if ($text =~/Paladin/i){
			quest::level(1);
			quest::incstat(0, +1);
			quest::incstat(1, +1);
			quest::incstat(4, +1);
			quest::incstat(6, +1);
			$total = int($total-$cost);     
			$client->SetAAPoints($total);
			quest::summonitem(200005);
			if (!defined $qglobals{"Ascend"}) { quest::setglobal("Ascend", 1, 5, "F"); }
			quest::delglobal("CharMaxLevel");
			quest::permaclass(3);
		}
		if ($text =~/Ranger/i){
			quest::level(1);
			quest::incstat(0, +1);
			quest::incstat(1, +1);
			quest::incstat(2, +1);
			quest::incstat(4, +1);
			$total = int($total-$cost);     
			$client->SetAAPoints($total);
			quest::summonitem(200006);
			if (!defined $qglobals{"Ascend"}) { quest::setglobal("Ascend", 1, 5, "F"); }
			quest::delglobal("CharMaxLevel");
			quest::permaclass(4);
		}
		if ($text =~/Rogue/i){
			quest::level(1);
			quest::incstat(2, +2);
			quest::incstat(3, +2);
			$total = int($total-$cost);     
			$client->SetAAPoints($total);
			quest::summonitem(200007);
			if (!defined $qglobals{"Ascend"}) { quest::setglobal("Ascend", 1, 5, "F"); }
			quest::delglobal("CharMaxLevel");
			quest::permaclass(9);
		}
		if ($text =~/Shadowknight/i){
			quest::level(1);
			quest::incstat(0, +1);
			quest::incstat(1, +1);
			quest::incstat(5, +1);
			quest::incstat(6, +1);
			$total = int($total-$cost);     
			$client->SetAAPoints($total);
			quest::summonitem(200008);
			if (!defined $qglobals{"Ascend"}) { quest::setglobal("Ascend", 1, 5, "F"); }
			quest::delglobal("CharMaxLevel");
			quest::permaclass(5);
		}
		if ($text =~/Shaman/i){
			quest::level(1);
			quest::incstat(1, +1);
			quest::incstat(4, +2);
			quest::incstat(6, +1);
			$total = int($total-$cost);     
			$client->SetAAPoints($total);
			quest::summonitem(200009);
			if (!defined $qglobals{"Ascend"}) { quest::setglobal("Ascend", 1, 5, "F"); }
			quest::delglobal("CharMaxLevel");
			quest::permaclass(10);
		}
		if ($text =~/Warrior/i){
			quest::level(1);
			quest::incstat(0, +1);
			quest::incstat(1, +2);
			quest::incstat(2, +1);
			$total = int($total-$cost);     
			$client->SetAAPoints($total);
			quest::summonitem(200000);
			if (!defined $qglobals{"Ascend"}) { quest::setglobal("Ascend", 1, 5, "F"); }
			quest::delglobal("CharMaxLevel");
			quest::permaclass(1);
		}
		if ($text =~/Wizard/i){
			quest::level(1);
			quest::incstat(1, +2);
			quest::incstat(5, +2);
			$total = int($total-$cost);     
			$client->SetAAPoints($total);
			quest::summonitem(200009);
			if (!defined $qglobals{"Ascend"}) { quest::setglobal("Ascend", 1, 5, "F"); }
			quest::delglobal("CharMaxLevel");
			quest::permaclass(12);
		}
	}