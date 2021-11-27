sub EVENT_SAY:{
my $go1 = quest::saylink("FuryIII");
my $go2 = quest::saylink("MagicIII");
my $go3 = quest::saylink("HealIII");
        if($text=~/hail/i){
			plugin::Whisper ("Good day, $name. I can give you: [$go1],[$go2], or [$go3].");
           }
		elsif($text=~/FuryIII/i )
		{
          if(quest::istaskcompleted(4797) && !quest::istaskactive(4800) && !quest::istaskcompleted(4800))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(4800);
          }
	}
		elsif($text=~/MagicIII/i )
		{
          if(quest::istaskcompleted(4798) && !quest::istaskactive(4801) && !quest::istaskcompleted(4801))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(4801);
          }
	}
		elsif($text=~/HealIII/i )
		{
          if(quest::istaskcompleted(4799) && !quest::istaskactive(4802) && !quest::istaskcompleted(4802))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(4802);
          }
	}
}