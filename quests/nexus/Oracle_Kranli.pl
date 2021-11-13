sub EVENT_SAY:{
my $go1 = quest::saylink("FuryIII");
my $go2 = quest::saylink("MagicIII");
my $go3 = quest::saylink("HealIII");
        if($text=~/hail/i){
			plugin::Whisper ("Good day, $name. I can give you: [$go1],[$go2], or [$go3].");
           }
		elsif($text=~/FuryIII/i )
		{
          if(quest::istaskcompleted(293) && !quest::istaskactive(296) && !quest::istaskcompleted(296))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(296);
          }
	}
		elsif($text=~/MagicIII/i )
		{
          if(quest::istaskcompleted(294) && !quest::istaskactive(297) && !quest::istaskcompleted(297))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(297);
          }
	}
		elsif($text=~/HealIII/i )
		{
          if(quest::istaskcompleted(295) && !quest::istaskactive(298) && !quest::istaskcompleted(298))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(298);
          }
	}
}