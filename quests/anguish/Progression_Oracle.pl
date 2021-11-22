# items: 29147
sub EVENT_SPAWN {
  quest::settimer(1,600);
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::setglobal("thulehouse", 1, 5, "F");
    $client->Message(4, "You receive a character flag!");
  }
}

sub EVENT_TIMER {
  quest::spawn_condition($zonesn,2,0);
  quest::stoptimer(1);
  quest::depop();
}
