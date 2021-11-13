sub EVENT_SAY:{
my $go1 = quest::saylink("FuryIV");
my $go2 = quest::saylink("MagicIV");
my $go3 = quest::saylink("HealIV");
        if($text=~/hail/i){
			plugin::Whisper ("Good day, $name. I can give you: [$go1],[$go2], or [$go3].");
           }
		elsif($text=~/FuryIII/i )
		{
          if(quest::istaskcompleted(297) && !quest::istaskactive(299) && !quest::istaskcompleted(299))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(299);
          }
	}
		elsif($text=~/MagicIII/i )
		{
          if(quest::istaskcompleted(297) && !quest::istaskactive(300) && !quest::istaskcompleted(300))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(300);
          }
	}
		elsif($text=~/HealIII/i )
		{
          if(quest::istaskcompleted(298) && !quest::istaskactive(301) && !quest::istaskcompleted(301))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(301);
          }
	}
}