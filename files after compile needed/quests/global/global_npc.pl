sub EVENT_DEATH_COMPLETE {
	$roll = int(rand(1000));
	if($roll >= 990) {
		quest::spawn2(2000047,0,0,$x,$y,$z,$h);
	}
}