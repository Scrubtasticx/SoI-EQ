sub EVENT_SAY:{
my $go = quest::saylink("Quest");
        if($text=~/hail/i){
		plugin::Whisper ("Good day to you, $name. I can assign you to a [$go] for armor. When you complete the quest I will give you currency that you can spend with ME on armor!");
		$client->Message(315, " ");
        
	}
		elsif($text=~/Quest/i)
		{
                if(!quest::istaskactive(290) && !quest::istaskcompleted(290))
                {
                        quest::say("Assigning you task to kill Fennin Ro,");
                        quest::assigntask(290);
                }
        }
		
}