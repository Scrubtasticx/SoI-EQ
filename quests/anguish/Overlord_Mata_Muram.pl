sub EVENT_DEATH_COMPLETE {
  quest::stoptimer(1);
  quest::ze(1,"Loud cries of hopelessness echo throughout the burning lands. The creatures of Anguish call out to their master, Overlord Mata, for his dead body now lies at the feet of the mighty adventurers.");
  quest::spawn2(2000075,0,0,$x,$y,$z,$h); #Progression Oracle
}
# End of File  Zone: Anguish  ID: 217054  -- Mata