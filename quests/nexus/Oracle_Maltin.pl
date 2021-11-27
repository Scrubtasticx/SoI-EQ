sub EVENT_SAY:{
my $go1 = quest::saylink("FuryIV");
my $go2 = quest::saylink("MagicIV");
my $go3 = quest::saylink("HealIV");
        if($text=~/hail/i){
			plugin::Whisper ("Good day, $name. I can give you: [$go1],[$go2], or [$go3].");
           }
		elsif($text=~/FuryIII/i )
		{
          if(quest::istaskcompleted(5200) && !quest::istaskactive(5300) && !quest::istaskcompleted(5300))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(5300);
          }
	}
		elsif($text=~/MagicIII/i )
		{
          if(quest::istaskcompleted(5201) && !quest::istaskactive(5301) && !quest::istaskcompleted(5301))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(5301);
          }
	}
		elsif($text=~/HealIII/i )
		{
          if(quest::istaskcompleted(5202) && !quest::istaskactive(5302) && !quest::istaskcompleted(5302))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(5302);
          }
	}
}