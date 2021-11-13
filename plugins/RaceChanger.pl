sub RaceChanger {
    my $t = shift;
    my $c = plugin::val('class');
    if ($t eq "List") {
        if ($c !~ @{["Monk", "Necromancer", "Wizard", "Magician", "Enchanter"]}) {
            plugin::Whisper(quest::saylink($_, 1, plugin::Race($_))) for (1..12, 128, 130, 330, 522);
        } elsif ($c eq "Monk") {
            plugin::Whisper(quest::saylink($_, 1, plugin::Race($_))) for (1, 128, 522);
        } elsif ($c ~~ @{["Necromancer", "Wizard", "Magician", "Enchanter"]}) {
            plugin::Whisper(quest::saylink($_, 1, plugin::Race($_))) for (1, 3, 5, 6, 12, 128, 330, 522);
        }
    } else {
        if ($c !~ @{["Monk", "Necromancer", "Wizard", "Magician", "Enchanter"]}) {
            quest::permarace($t);
        } elsif ($c eq "Monk") {
            if ($t ~~ @{[1, 128, 522]}) {
                quest::permarace($t);
            }
        } elsif ($c ~~ @{["Necromancer", "Wizard", "Magician", "Enchanter"]}) {
            if ($t ~~ @{[1, 3, 5, 6, 12, 128, 330, 522]}) {
                quest::permarace($t);
            }
        }
    }
}

return 1;