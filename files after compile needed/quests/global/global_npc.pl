sub EVENT_DEATH_COMPLETE {
	$roll = int(rand(100));
	if($roll >= 101) {
		quest::spawn2(2000060,0,0,$x,$y,$z,$h);
	}
}