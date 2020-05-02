sub EVENT_SAY {
    my $go = quest::saylink("Go Hall");

    if ($text =~/Hail/i) {
        if ($uguild_id < 1) {
            $client->Message(315,"You must be in a guild!");
        }
        else {
            $client->Message(315,"I can send you to your Guild Hall would you like to [$go]?");
        }
    }
    elsif ($text =~/Go Hall/i) {
        if ($uguild_id < 1) {
            $client->Message(315,"You must be in a guild!");
        }
        else {
            if (defined($qglobals{"ginstance$uguild_id"})) {
                $guildinstance = $qglobals{"ginstance$uguild_id"};
                quest::AssignToInstance($guildinstance);
                quest::MovePCInstance(345, $guildinstance, -1.00, -1.00, 3.34); # Zone: skyfire
            } else {
                $guildinstance = quest::CreateInstance("guildhall", 1, 86400);
                quest::AssignToInstance($guildinstance); 
                quest::setglobal("ginstance$uguild_id",$guildinstance,7,"H25");
                quest::MovePCInstance(345, $guildinstance, -1.00, -1.00, 3.34); # Zone: skyfire
            }
        }
    }
}