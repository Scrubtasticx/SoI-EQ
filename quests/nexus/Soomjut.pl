sub EVENT_SAY:{
my $go = quest::saylink("Quest");
        if($text=~/hail/i){
			plugin::Whisper ("Good day to you, $name. I can assign you to a [$go] for a set of starter armor.");
           }
		elsif($text=~/Quest/i )
		{
          if(!quest::istaskactive(292) && !quest::istaskcompleted(292))
          {
           quest::say("Assigning you task to kill monsters,");
           quest::assigntask(292);
          }
	}
}