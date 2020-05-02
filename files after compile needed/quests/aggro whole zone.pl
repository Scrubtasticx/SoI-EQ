sub EVENT_COMBAT
{
	if ($combat_state == 1)
	{
		AGGRO_ZONE();
		quest::shout("You aggroed the zone!"); #Random text
	}
	
	if ($combat_state == 0)
	{
		#Only turn this on if you use the GMMOVE 
		#quest::repopzone();
	}
}


sub AGGRO_ZONE 
{
#NPCIDs go in this skiplist that you DO NOT want to be aggroed!
my @skiplist = qw(
425022
1356
);
 if ($client)
		{
			my @trash = $entity_list->GetNPCList();
			foreach $ent (@trash)
			{
				my $trashaggro = $ent->CastToNPC();
				my $trashnpctype = $trashaggro->GetNPCTypeID();
					if ( grep { $_ eq $trashnpctype } @skiplist )
					{
					#DO NOTHING
					}
					else
					{
					#Only Turn this on if players are EXPLOITING with pets
					#$trashaggro->GMMove($x, $y, $z, 0);
					#Adding All Aggro onto the PET which will transfer to player
					$trashaggro->AddToHateList($client, 1);
					}
			}
		}
		else
		{
		my $hate_target = $npc->GetHateTop();
		my $hate_pet = $hate_target->CastToMob();
		my @trash = $entity_list->GetNPCList();
			foreach $ent (@trash)
			{
				my $trashaggro = $ent->CastToNPC();
				my $trashnpctype = $trashaggro->GetNPCTypeID();
					if ( grep { $_ eq $trashnpctype } @skiplist )
					{
					#DO NOTHING
					}
					else
					{
					#Only Turn this on if players are EXPLOITING with pets
					#$trashaggro->GMMove($x, $y, $z, 0);
					#Adding All Aggro onto the PET which will transfer to player
					$trashaggro->AddToHateList($hate_pet, 1);
					}
			}
		}
}