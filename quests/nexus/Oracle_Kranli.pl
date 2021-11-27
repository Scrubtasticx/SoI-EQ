sub EVENT_SAY:{
my $go1 = quest::saylink("FuryIII");
my $go2 = quest::saylink("MagicIII");
my $go3 = quest::saylink("HealIII");
        if($text=~/hail/i){
			plugin::Whisper ("Good day, $name. I can give you: [$go1],[$go2], or [$go3].");
           }
		elsif($text=~/FuryIII/i )
		{
          if(quest::istaskcompleted(5100) && !quest::istaskactive(5200) && !quest::istaskcompleted(5200))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(5200);
          }
	}
		elsif($text=~/MagicIII/i )
		{
          if(quest::istaskcompleted(5101) && !quest::istaskactive(5201) && !quest::istaskcompleted(5201))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(5201);
          }
	}
		elsif($text=~/HealIII/i )
		{
          if(quest::istaskcompleted(5103) && !quest::istaskactive(5203) && !quest::istaskcompleted(5203))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(5203);
          }
	}
}