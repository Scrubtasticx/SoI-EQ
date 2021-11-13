sub EVENT_SAY:{
my $go1 = quest::saylink("Fury");
my $go2 = quest::saylink("Magic");
my $go3 = quest::saylink("Heal");
        if($text=~/hail/i){
			plugin::Whisper ("Good day, $name. I can give you: [$go1],[$go2], or [$go3].");
           }
		elsif($text=~/Fury/i )
		{
          if(!quest::istaskactive(293) && !quest::istaskcompleted(293))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(293);
          }
	}
		elsif($text=~/Magic/i )
		{
          if(!quest::istaskactive(294) && !quest::istaskcompleted(294))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(294);
          }
	}
		elsif($text=~/Heal/i )
		{
          if(!quest::istaskactive(295) && !quest::istaskcompleted(295))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(295);
          }
	}
}