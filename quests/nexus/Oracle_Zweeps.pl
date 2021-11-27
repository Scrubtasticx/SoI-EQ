sub EVENT_SAY:{
my $go1 = quest::saylink("Fury");
my $go2 = quest::saylink("Magic");
my $go3 = quest::saylink("Heal");
        if($text=~/hail/i){
			plugin::Whisper ("Good day, $name. I can give you: [$go1],[$go2], or [$go3].");
           }
		elsif($text=~/Fury/i )
		{
          if(!quest::istaskactive(5100) && !quest::istaskcompleted(5100))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(5100);
          }
	}
		elsif($text=~/Magic/i )
		{
          if(!quest::istaskactive(5101) && !quest::istaskcompleted(5101))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(5101);
          }
	}
		elsif($text=~/Heal/i )
		{
          if(!quest::istaskactive(5102) && !quest::istaskcompleted(5102))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(5102);
          }
	}
}