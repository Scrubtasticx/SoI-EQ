use strict;
use warnings;
sub CreateI {
    my ($name, $id, $minhp, $maxhp, $minac, $maxac, $mins, $maxs, $minhs, $maxhs, $mincs, $maxcs, $minsh, $maxsh) = (shift, shift, shift, shift, shift, shift, shift, shift, shift, shift, shift, shift, shift, shift);
    my $material;
    chomp $name;
    $name =~ s/\'/\\'/ig;
    open my $file, ">>$name Armor.sql";
    my $n = 0;
    my $slot = 0;
    my %typeHash = (1 => ["Hood", "Robe", "Wristlet", "Covers", "Pantaloons", "Slippers", "Gloves"],
    2 => ["Visor", "Chain Body", "Bracelet", "Shoulderpads", "Greaves", "Boots", "Gauntlets"],
    3 => ["Helmet", "Breastplate", "Bracer", "Vambraces", "Greaves", "Boots", "Gauntlets"],
    4 => ["Cap", "Cheststraps", "Wristband", "Armbands", "Pants", "Shoes", "Gloves"]);
    my @slotArray = (4, 131072, 1536, 128, 262144, 524288, 4096);        
    my @materialArray = (10, 11, 12, 13, 14, 15, 16);
    my %classesHash = (1 => 15360, 2 => 33544, 3 => 151, 4 => 16480);
    my %iconsHash = (1 => [639, 838, 638, 670, 631, 525, 517],
    2 => [625, 538, 620, 543, 630, 545, 526],
    3 => [628, 624, 516, 622, 540, 524, 531],
    4 => [640, 632, 637, 634, 635, 633, 636]);
    
    my @hpa = (($minhp > 0) ? ($minhp..$maxhp) : (0));
    my @aca = (($minac > 0) ? ($minac..$maxac) : (0));
    my @stata = (($mins > 0) ? ($mins..$maxs) : (0));
    my @hsa = (($minhs > 0) ? ($minhs..$maxhs) : (0));
    my @csa = (($mincs > 0) ? ($mincs..$maxcs) : (0));
    my @sha = (($minsh > 0) ? ($minsh..$maxsh) : (0));
    
    foreach my $type (sort {$a <=> $b} keys %typeHash) {
        foreach my $item (@{$typeHash{$type}}) {
            $material = (($type == 1 && $item eq "Robe") ? $materialArray[rand @materialArray] : $type);
            print "ID: $id Name: $name $item Type: $item\n";
            my $query = "INSERT INTO `items` SET `id` = '$id', ";
            $query .= "`name` = '$name $item', ";
            $query .= "`slots` = '" . $slotArray[$slot] . "', ";
            $query .= "`classes` = '" . $classesHash{$type} . "', ";
            $query .= "`icon` = '" . $iconsHash{$type}[$n] . "', ";
            $query .= "`material` = '$material', ";
            $query .= "`hp` = '" . $hpa[rand @hpa] . "', ";
            $query .= "`mana` = '" . $hpa[rand @hpa] . "', ";
            $query .= "`endur` = '" . $hpa[rand @hpa] . "', ";
            $query .= "`regen` = '" . int($hpa[rand @hpa] / 10) . "', ";
            $query .= "`manaregen` = '" . int($hpa[rand @hpa] / 10) . "', ";
            $query .= "`enduranceregen` = '" . int($hpa[rand @hpa] / 10) . "', ";
            $query .= "`ac` = '" . $aca[rand @aca] . "', ";
            $query .= "`attack` = '" . $aca[rand @aca] . "', ";
            $query .= "`aagi` = '" . $stata[rand @stata] . "', ";
            $query .= "`acha` = '" . $stata[rand @stata] . "', ";
            $query .= "`adex` = '" . $stata[rand @stata] . "', ";
            $query .= "`aint` = '" . $stata[rand @stata] . "', ";
            $query .= "`asta` = '" . $stata[rand @stata] . "', ";
            $query .= "`astr` = '" . $stata[rand @stata] . "', ";
            $query .= "`awis` = '" . $stata[rand @stata] . "', ";
            $query .= "`cr` = '" . $stata[rand @stata] . "', ";
            $query .= "`dr` = '" . $stata[rand @stata] . "', ";
            $query .= "`fr` = '" . $stata[rand @stata] . "', ";
            $query .= "`mr` = '" . $stata[rand @stata] . "', ";
            $query .= "`pr` = '" . $stata[rand @stata] . "', ";
            $query .= "`svcorruption` = '" . $stata[rand @stata] . "', ";
            $query .= "`heroic_agi` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_cha` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_dex` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_int` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_sta` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_str` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_wis` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_cr` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_dr` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_fr` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_mr` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_pr` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_svcorrup` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`spellshield` = '" . $csa[rand @csa] . "', ";
            $query .= "`strikethrough` = '" . $csa[rand @csa] . "', ";
            $query .= "`stunresist` = '" . $csa[rand @csa] . "', ";
            $query .= "`clairvoyance` = '" . $csa[rand @csa] . "', ";
            $query .= "`dsmitigation` = '" . $csa[rand @csa] . "', ";
            $query .= "`healamt` = '" . $sha[rand @sha] . "', ";
            $query .= "`spelldmg` = '" . $sha[rand @sha] . "', ";
            $query .= "`itemtype` = '10', ";
            $query .= "`nodrop` = '0', ";
            $query .= "`races` = '65535', ";
            $query .= "`idfile` = 'IT63', ";
            $query .= "`augslot1visible` = '1', ";
            $query .= "`augslot2visible` = '1', ";
            $query .= "`augslot3visible` = '1', ";
            $query .= "`augslot4visible` = '1', ";
            $query .= "`augslot5visible` = '1', ";
            $query .= "`magic` = '1', ";
            $query .= "`norent` = '1', ";
            $query .= "`stacksize` = '1', ";
            $query .= "`clickeffect` = '-1', ";
            $query .= "`proceffect` = '-1', ";
            $query .= "`worneffect` = '-1', ";
            $query .= "`scrolleffect` = '-1', ";
            $query .= "`maxcharges` = '-1', ";
            $query .= "`unk132` = '-1';";
           print $file $query;
            $query = "";
            $id++;
            $n++;
            $slot++;
        }
        $n = 0;
        $slot = 0;
    }
    CreateA($name, $id, $minhp, $maxhp, $minac, $maxac, $mins, $maxs, $minhs, $maxhs, $mincs, $maxcs, $minsh, $maxsh);
    close $file;
    return;
}

sub CreateA {
    my ($name, $id, $minhp, $maxhp, $minac, $maxac, $mins, $maxs, $minhs, $maxhs, $mincs, $maxcs, $minsh, $maxsh) = (shift, shift, shift, shift, shift, shift, shift, shift, shift, shift, shift, shift, shift, shift);
    open my $file, ">>$name Accessories.sql";
    my $n = 0;
    my $slot = 0;
    my %typeHash = (1 => ["Visor", "Ear Ring", "Necklace", "Pauldrons", "Cloak", "Ring", "Girdle"],
    2 => ["Mask", "Hoop", "Choker", "Covers", "Cape", "Band", "Belt"]);
    my @slotArray = (8, 18, 32, 64, 256, 98304, 1048576);
    my %classesHash = (1 => 33245, 2 => 32290);
    my %iconsHash = (1 => [506, 535, 848, 626, 663, 615, 503],
    2 => [528, 757, 505, 664, 658, 616, 719]);
    
    my @hpa = (($minhp > 0) ? ($minhp..$maxhp) : (0));
    my @aca = (($minac > 0) ? ($minac..$maxac) : (0));
    my @stata = (($mins > 0) ? ($mins..$maxs) : (0));
    my @hsa = (($minhs > 0) ? ($minhs..$maxhs) : (0));
    my @csa = (($mincs > 0) ? ($mincs..$maxcs) : (0));
    my @sha = (($minsh > 0) ? ($minsh..$maxsh) : (0));
    
    foreach my $type (sort {$a <=> $b} keys %typeHash) {
        foreach my $item (@{$typeHash{$type}}) {
            print "ID: $id Name: $name $item\n";
            my $query = "INSERT INTO `items` SET `id` = '$id', ";
            $query .= "`name` = '$name $item', ";
            $query .= "`slots` = '" . $slotArray[$slot] . "', ";
            $query .= "`classes` = '" . $classesHash{$type} . "', ";
            $query .= "`icon` = '" . $iconsHash{$type}[$n] . "', ";
            $query .= "`hp` = '" . $hpa[rand @hpa] . "', ";
            $query .= "`mana` = '" . $hpa[rand @hpa] . "', ";
            $query .= "`endur` = '" . $hpa[rand @hpa] . "', ";
            $query .= "`regen` = '" . int($hpa[rand @hpa] / 10) . "', ";
            $query .= "`manaregen` = '" . int($hpa[rand @hpa] / 10) . "', ";
            $query .= "`enduranceregen` = '" . int($hpa[rand @hpa] / 10) . "', ";
            $query .= "`ac` = '" . $aca[rand @aca] . "', ";
            $query .= "`attack` = '" . $aca[rand @aca] . "', ";
            $query .= "`aagi` = '" . $stata[rand @stata] . "', ";
            $query .= "`acha` = '" . $stata[rand @stata] . "', ";
            $query .= "`adex` = '" . $stata[rand @stata] . "', ";
            $query .= "`aint` = '" . $stata[rand @stata] . "', ";
            $query .= "`asta` = '" . $stata[rand @stata] . "', ";
            $query .= "`astr` = '" . $stata[rand @stata] . "', ";
            $query .= "`awis` = '" . $stata[rand @stata] . "', ";
            $query .= "`cr` = '" . $stata[rand @stata] . "', ";
            $query .= "`dr` = '" . $stata[rand @stata] . "', ";
            $query .= "`fr` = '" . $stata[rand @stata] . "', ";
            $query .= "`mr` = '" . $stata[rand @stata] . "', ";
            $query .= "`pr` = '" . $stata[rand @stata] . "', ";
            $query .= "`svcorruption` = '" . $stata[rand @stata] . "', ";
            $query .= "`heroic_agi` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_cha` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_dex` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_int` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_sta` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_str` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_wis` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_cr` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_dr` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_fr` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_mr` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_pr` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`heroic_svcorrup` = '" . $hsa[rand @hsa] . "', ";
            $query .= "`spellshield` = '" . $csa[rand @csa] . "', ";
            $query .= "`strikethrough` = '" . $csa[rand @csa] . "', ";
            $query .= "`stunresist` = '" . $csa[rand @csa] . "', ";
            $query .= "`dsmitigation` = '" . $csa[rand @csa] . "', ";
            $query .= "`clairvoyance` = '" . $csa[rand @csa] . "', ";
            $query .= "`healamt` = '" . $sha[rand @sha] . "', ";
            $query .= "`spelldmg` = '" . $sha[rand @sha] . "', ";
            $query .= "`itemtype` = '10', ";
            $query .= "`nodrop` = '0', ";
            $query .= "`races` = '65535', ";
            $query .= "`idfile` = 'IT63', ";
            $query .= "`augslot1visible` = '1', ";
            $query .= "`augslot2visible` = '1', ";
            $query .= "`augslot3visible` = '1', ";
            $query .= "`augslot4visible` = '1', ";
            $query .= "`augslot5visible` = '1', ";
            $query .= "`magic` = '1', ";
            $query .= "`material` = '0', ";
            $query .= "`norent` = '1', ";
            $query .= "`stacksize` = '1', ";
            $query .= "`clickeffect` = '-1', ";
            $query .= "`proceffect` = '-1', ";
            $query .= "`worneffect` = '-1', ";
            $query .= "`scrolleffect` = '-1', ";
            $query .= "`maxcharges` = '-1', ";
            $query .= "`unk132` = '-1';";
            print $file $query;
            $id++;
            $n++;
            $slot++;
        }
        $n = 0;
        $slot = 0;
    }
    print "Done!";
    close $file;
    return;
}
print "Hello, what would you like the name in front of your items to be?\n";
my $name = <STDIN>;
print "Okay, what would you like the starting ID to be?\n";
my $id = int(<STDIN>);
print "What would you like to set the health range on the items to?\n";
my @hp = split(/ /, <STDIN>);
print "What would you like to set the armor class range on the items to?\n";
my @ac = split(/ /, <STDIN>);
print "What would you like to set the stat range on the items to?\n";
my @s = split(/ /, <STDIN>);
print "What would you like to set the heroic stat range on the items to?\n";
my @hs = split(/ /, <STDIN>);
print "What would you like to set the combat stats range on the items to?\n";
my @cs = split(/ /, <STDIN>);
print "What would you like to set the heal amount and spell damage range on the items to?\n";
my @sh = split(/ /, <STDIN>);
print "Okay, thank you!\n";
CreateI($name, $id, $hp[0], $hp[1], $ac[0], $ac[1], $s[0], $s[1], $hs[0], $hs[1], $cs[0], $cs[1], $sh[0], $sh[1]);