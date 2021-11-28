sub EVENT_SPAWN {
quest::setnexthpevent(90);
quest::shout("My Lands My Domain. Flee you filth.");
}

sub EVENT_AGGRO {
quest::say("You can NEVARUN!");
quest::settimer(1,30);
}

sub EVENT_HP {
my $hate1 = $npc->GetHateRandom();
my $hate2 = $npc->GetHateRandom();
my $hate3 = $npc->GetHateRandom();
my $hate4 = $npc->GetHateRandom();
my $hate5 = $npc->GetHateRandom();
my $hate6 = $npc->GetHateRandom();
my $hate7 = $npc->GetHateRandom();
my $hate8 = $npc->GetHateRandom();
my $hate9 = $npc->GetHateRandom();
my $hate10 = $npc->GetHateRandom();
my $hate11 = $npc->GetHateRandom();
my $hate12 = $npc->GetHateRandom();
 
if($hpevent == 90) {
quest::say("Assist me my undead friends!");
$guardian1 = quest::spawn2(59078,0,0,$x,$y,$z,0);
$guardian2 = quest::spawn2(59078,0,0,$x,$y,$z,0);
$guardian3 = quest::spawn2(59078,0,0,$x,$y,$z,0);
$guardian4 = quest::spawn2(59078,0,0,$x,$y,$z,0);
$guardian5 = quest::spawn2(59078,0,0,$x,$y,$z,0);
$guardian6 = quest::spawn2(59078,0,0,$x,$y,$z,0);
$attack1 = $entity_list->GetMobID($guardian1);
$attack2 = $entity_list->GetMobID($guardian2);
$attack3 = $entity_list->GetMobID($guardian3);
$attack4 = $entity_list->GetMobID($guardian4);
$attack5 = $entity_list->GetMobID($guardian5);
$attack6 = $entity_list->GetMobID($guardian6);
$guardian1atk = $attack1->CastToNPC();
$guardian2atk = $attack2->CastToNPC();
$guardian3atk = $attack3->CastToNPC();
$guardian4atk = $attack4->CastToNPC();
$guardian5atk = $attack5->CastToNPC();
$guardian6atk = $attack6->CastToNPC();
$guardian1atk->AddToHateList($hate1, 1);
$guardian2atk->AddToHateList($hate2, 1);
$guardian3atk->AddToHateList($hate3, 1);
$guardian4atk->AddToHateList($hate4, 1);
$guardian5atk->AddToHateList($hate5, 1);
$guardian6atk->AddToHateList($hate6, 1);
quest::setnexthpevent(70);
}

if($hpevent == 70) {
	$npc->CastSpell(15975, $mobid, 10, -1);
	quest::modifynpcstat("min_hit", 150);
	quest::modifynpcstat("max_hit", 250);
	quest::setnexthpevent(51);
}

if($hpevent == 51) {
	$npc->BuffFadeBySpellID(15975);
 	quest::modifynpcstat("min_hit", 50);
	quest::modifynpcstat("max_hit", 150);
	quest::setnexthpevent(50);
}

if($hpevent == 50) {
	quest::say("Assist me my undead friends!");
	$guardian4 = quest::spawn2(59109,0,0,$x,$y,$z,0);
	$guardian5 = quest::spawn2(59109,0,0,$x,$y,$z,0);
	$guardian6 = quest::spawn2(59109,0,0,$x,$y,$z,0);

	$attack4 = $entity_list->GetMobID($guardian4);
	$attack5 = $entity_list->GetMobID($guardian5);
	$attack6 = $entity_list->GetMobID($guardian6);

	$guardian4atk = $attack4->CastToNPC();
	$guardian5atk = $attack5->CastToNPC();
	$guardian6atk = $attack6->CastToNPC();

	$guardian4atk->AddToHateList($hate4, 1);
	$guardian5atk->AddToHateList($hate5, 1);
	$guardian6atk->AddToHateList($hate6, 1);
	quest::setnexthpevent(30);
}
  if($hpevent == 30) {
  
    $npc->CastSpell(15975, $mobid, 10, -1);
  	quest::modifynpcstat("min_hit", 150);
	quest::modifynpcstat("max_hit", 250);

	$guardian1 = quest::spawn2(59078,0,0,$x,$y,$z,0);
	$guardian2 = quest::spawn2(59078,0,0,$x,$y,$z,0);
	$guardian3 = quest::spawn2(59078,0,0,$x,$y,$z,0);
	$guardian4 = quest::spawn2(59078,0,0,$x,$y,$z,0);
	$guardian5 = quest::spawn2(59078,0,0,$x,$y,$z,0);
	$guardian6 = quest::spawn2(59078,0,0,$x,$y,$z,0);
	$guardian7 = quest::spawn2(59078,0,0,$x,$y,$z,0);
	$guardian8 = quest::spawn2(59078,0,0,$x,$y,$z,0);
    $attack1 = $entity_list->GetMobID($guardian1);
	$attack2 = $entity_list->GetMobID($guardian2);
	$attack3 = $entity_list->GetMobID($guardian3);
	$attack4 = $entity_list->GetMobID($guardian4);
	$attack5 = $entity_list->GetMobID($guardian5);
	$attack6 = $entity_list->GetMobID($guardian6);
	$attack7 = $entity_list->GetMobID($guardian7);
	$attack8 = $entity_list->GetMobID($guardian8);
    $guardian1atk = $attack1->CastToNPC();
	$guardian2atk = $attack2->CastToNPC();
	$guardian3atk = $attack3->CastToNPC();
	$guardian4atk = $attack4->CastToNPC();
	$guardian5atk = $attack5->CastToNPC();
	$guardian6atk = $attack6->CastToNPC();
	$guardian7atk = $attack7->CastToNPC();
	$guardian8atk = $attack8->CastToNPC();
    $guardian1atk->AddToHateList($hate1, 1);
	$guardian2atk->AddToHateList($hate2, 1);
	$guardian3atk->AddToHateList($hate3, 1);
	$guardian4atk->AddToHateList($hate4, 1);
	$guardian5atk->AddToHateList($hate5, 1);
	$guardian6atk->AddToHateList($hate6, 1);
	$guardian7atk->AddToHateList($hate7, 1);
	$guardian8atk->AddToHateList($hate8, 1);
}
}

sub EVENT_TIMER {
	my $hate = $npc->GetHateRandom();
	
	if($timer == 1) {
		$npc->SpellFinished(438,$hate);
		quest::say("You dont stand a chance!");
	}
}