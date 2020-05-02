#Perl Script for Albert to teleport People to their respective starting cities
sub EVENT_SAY {
my $go = quest::saylink("Go Home");
    if ($text =~/Hail/i) {
        plugin::Whisper ("Good day to you, $name. I can teleport you to you're home city, are you ready to [$go]?");
}
    if ($text =~/Go Home/i) {
      if ($race eq 'Dark Elf') {
        quest::movepc(40, 156.92, -2.94, 31.75) ;
}
     if ($race eq 'Troll') {
        quest::movepc(52, 0, -100, 4) ;
}
     if ($race eq 'Wood Elf') {
        quest::movepc(54, 10, -20, 0) ;
}
     if ($race eq 'Half-Elf') {
        quest::movepc(54, 10, -20, 0) ;
}
     if ($race eq 'Vah Shir') {
        quest::movepc(54, 10, -20, 0) ;
}
     if ($race eq 'Froglok') {
        quest::movepc(105, -18, -123, -16) ;
}
     if ($race eq 'High Elf') {
        quest::movepc(61, 94, -25, 3.75) ;
}
     if ($race eq 'Gnome') {
        quest::movepc(55, -35, -47, 4) ;
}
     if ($race eq 'Human') {
        quest::movepc(8, 211, -296, 4) ;
}
     if ($race eq 'Halfling') {
        quest::movepc(19, 45.3, 1.6, 3.8) ;
}
     if ($race eq 'Erudite') {
        quest::movepc(24, -309.75, 109.64, 23.75) ;
}
     if ($race eq 'Drakkin') {
        quest::movepc(394, -550, -430, 80) ;
}
     if ($race eq 'Iksar') {
        quest::movepc(106, -416, 1343, 4) ;
}
     if ($race eq 'Troll') {
        quest::movepc(52, 0, -100, 4) ;
}
     if ($race eq 'Ogre') {
        quest::movepc(37, -99, -345, 4) ;
}
     if ($race eq 'Barbarian') {
        quest::movepc(29, 0, 0, 3.75) ;
}
     if ($race eq 'Dwarf') {
        quest::movepc(60, -2, -18, 3.75) ;
}
}
}