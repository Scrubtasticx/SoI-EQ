sub EVENT_SAY:{
my $go1 = quest::saylink("FuryV");
my $go2 = quest::saylink("MagicV");
my $go3 = quest::saylink("HealV");
        if($text=~/hail/i){
			plugin::Whisper ("Good day, $name. I can give you: [$go1],[$go2], or [$go3].");
           }
		elsif($text=~/FuryIII/i )
		{
          if(quest::istaskcompleted(299) && !quest::istaskactive(302) && !quest::istaskcompleted(302))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(302);
          }
	}
		elsif($text=~/MagicIII/i )
		{
          if(quest::istaskcompleted(300) && !quest::istaskactive(303) && !quest::istaskcompleted(303))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(303);
          }
	}
		elsif($text=~/HealIII/i )
		{
          if(quest::istaskcompleted(301) && !quest::istaskactive(304) && !quest::istaskcompleted(304))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(304);
          }
	}
}