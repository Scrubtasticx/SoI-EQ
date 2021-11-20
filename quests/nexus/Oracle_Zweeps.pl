sub EVENT_SAY:{
my $go1 = quest::saylink("Fury");
my $go2 = quest::saylink("Magic");
my $go3 = quest::saylink("Heal");
        if($text=~/hail/i){
			plugin::Whisper ("Good day, $name. I can give you: [$go1],[$go2], or [$go3].");
           }
		elsif($text=~/Fury/i )
		{
          if(!quest::istaskactive(4797) && !quest::istaskcompleted(4797))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(4797);
          }
	}
		elsif($text=~/Magic/i )
		{
          if(!quest::istaskactive(4798) && !quest::istaskcompleted(4798))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(4798);
          }
	}
		elsif($text=~/Heal/i )
		{
          if(!quest::istaskactive(4799) && !quest::istaskcompleted(4799))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(4799);
          }
	}
}