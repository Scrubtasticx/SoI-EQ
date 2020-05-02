sub EVENT_COMBAT {
  if($combat_state == 1) {
  quest::say("You won't be the first to desecrate the land of the unliving.");
  quest::settimer("dostuff",int(rand(24)) + 1);
  quest::settimer("spawncorpse",1);
  }
  elsif($combat_state == 0) {
  $npc->SetHP($npc->GetMaxHP());
  quest::depopall(999348);
  quest::stoptimer("dostuff"); 
  quest::stoptimer("spawncorpse"); 
  }  
}

sub EVENT_DEATH {
  quest::stoptimer("dostuff"); 
  quest::stoptimer("spawncorpse"); 
  quest::depopall(999348);
  quest::say("My ancestors will make you pay for this intrusion.");
 }
 
sub EVENT_TIMER {  
  if($timer == "dostuff") { 
   quest::stoptimer("dostuff"); 
   quest::emote("begins to draw power from his undead victims.");
   quest::signalwith(999348,1,0); #signal 1 to adventurercorpse for damage increase.. if alive they signal back signal 2
   quest::settimer("dostuff",int(rand(24)) + 1);
   }
   if($timer == "spawncorpse") {
   quest::stoptimer("spawncorpse");  
   quest::spawn2(999348,0,0,$x + int(rand(35)),$y + int(rand(35)),$z,0);
   quest::settimer("spawncorpse",int(rand(24)) + 1);
   }   
}

 
sub EVENT_SIGNAL {
  if($signal == 2) { #Players didn't kill corpses.. increase min/max damage by 10/25 respectively
   quest::modifynpcstat("min_hit", $npc->GetMinDMG() + 10);
   quest::modifynpcstat("max_hit", $npc->GetMaxDMG() + 25);
   }
  if($signal == 3) { #Player killed corpse reducing damage
   quest::modifynpcstat("min_hit", $npc->GetMinDMG() - 10);
   quest::modifynpcstat("max_hit", $npc->GetMaxDMG() - 25);
   quest::emote("has lost a portion of his stolen power.");
   }
}