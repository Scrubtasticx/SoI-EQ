sub EVENT_TASK_STAGE_COMPLETE {
  
  if($task_id == 290 && $activity_id == 2) {
    quest::summonitem(147495, 17); # Item: Sporeling Essence Potion
    $client->Message(315,"Congrats. Just right click me to buy armor.");
    quest::exp(1500);
    quest::ding();
  }
 
}

#sub EVENT_ENTERZONE {
 # if(($ulevel >= 15) && (!defined($qglobals{Wayfarer})) && ($client->GetStartZone()==$zoneid)) {
  #  $client->Message(15, "A mysterious voice whispers to you, 'Vladnelg Galvern has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
#  }
#}