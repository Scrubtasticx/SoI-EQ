# Higher_Lower.pl Game
# written by Sturm

sub DiceRoll {
	quest::ChooseRandom(1..20);
}

sub CleanUP {
	quest::delglobal(permissions);
	quest::delglobal(dealerroll);
	quest::delglobal(playerdice);
	quest::delglobal(bet);
}

sub EVENT_SAY {
	my $permissions = $qglobals{"permissions"}; # have you place a wager
	my $dealerroll = $qglobals{"dealerroll"}; # the dealer's dice roll
	my $playerdice  = $qglobals{"playerdice"};
	if ($text =~ /hail/i) {
		plugin::Whisper("Hello $name! Would you like to play Higher or Lower? It's easy, just hand me your bet and I'll roll a dice between 1 and 20. Then you guess if the next roll is going to be higher or lower. If you're right you get double your bet back! The Maximum wager is 1,000pp.");
	}
	elsif ($text =~ /Higher/i) {
		if ($permissions < 1) {
			plugin::Whisper("You must place a wager to play.");
		}
		else {
			$playerdice = DiceRoll();
			if ($playerdice == $dealerroll) {
				# push - cards are the same. Return bet.
				plugin::Whisper("You rolled a $playerdice. It's a draw. Returning your wager. Thanks for playing.");
				my $cash = $qglobals{"bet"};
				$copper	= ($cash % 10);
				$silver	= (int ($cash / 20) % 10);
				$gold = (int ($cash / 200) % 10);
				$platinum = int ($cash / 2000);
				quest::givecash($copper, $silver, $gold, $platinum); #Give money back
				CleanUP();
			}
			elsif ($playerdice < $dealerroll) {
				# players dice is lower than dealers - player lost.
				plugin::Whisper("You rolled a $playerdice. It's lower, you lost. Thanks for playing.");
				CleanUP();
			}
			elsif ($playerdice > $dealerroll) {
				# players dice is greater than dealers - player won.
				plugin::Whisper("You rolled a $playerdice. It's higher, you win! Thanks for playing.");
				my $cash = $qglobals{"bet"};
				$copper	= ($cash % 10);
				$silver	= (int ($cash / 10) % 10);
				$gold = (int ($cash / 100) % 10);
				$platinum = int ($cash / 1000);
				quest::givecash($copper, $silver, $gold, $platinum); #Give money
				CleanUP();
			}
		}
	}
	elsif ($text =~ /Lower/i) {
		if ($permissions < 1) {
			plugin::Whisper("You must place a wager to play.");
		}
		else {
			$playerdice = DiceRoll();
			if ($playerdice == $dealerroll) {
				# push - cards are the same. Return bet.
				plugin::Whisper("You rolled a $playerdice. It's a draw. Returning your wager. Thanks for playing.");
				my $cash = $qglobals{"bet"};
				$copper	= ($cash % 10);
				$silver	= (int ($cash / 20) % 10);
				$gold = (int ($cash / 200) % 10);
				$platinum = int ($cash / 2000);
				quest::givecash($copper, $silver, $gold, $platinum); #Give money back
				CleanUP();
			}
			elsif ($playerdice < $dealerroll) {
				# players dice is lower than dealers - player wins.
				plugin::Whisper("You rolled a $playerdice. It's lower, you win! Thanks for playing.");
				my $cash = $qglobals{"bet"};
				$copper	= ($cash % 10);
				$silver	= (int ($cash / 10) % 10);
				$gold = (int ($cash / 100) % 10);
				$platinum = int ($cash / 1000);
				quest::givecash($copper, $silver, $gold, $platinum); #Give money
				CleanUP();
			}
			elsif ($playerdice > $dealerroll) {
				# players dice is greater than dealers - player lost.
				plugin::Whisper("You rolled a $playerdice. It's higher, you lost! Thanks for playing.");
				CleanUP();
			}
		}
	}
}

sub EVENT_ITEM {
	my $Higher = quest::saylink("Higher",1);
	my $Lower = quest::saylink("Lower",1);
	if ($platinum > 0 && $platinum <= 1000) {
	my $cash = $copper + ($silver * 10) + ($gold * 100) + ($platinum * 1000);

	if ($cash < 1 ) {
		plugin::Whisper("You must give me money to play.");
		return;
	}

	if ($qglobals{"permissions"} > 0) {
		plugin::Whisper("You still have a game going on.");
		return;
	}
	$cash = $cash * 2; #double the bet
	$dice = DiceRoll();
	plugin::Whisper("Your bet of $platinum platinum has been saved. I'm showing a $dice on the dice. What do you choose: $Higher or $Lower?");
	quest::setglobal("dealerroll", $dice, 0, "F"); # set dealer's roll
	quest::setglobal("bet", $cash, 0, "F"); #easier to just set all money.
	quest::setglobal("permissions", 1, 0, "F"); #set permissions
	}
	else {
		quest::givecash($copper, $silver, $gold, $platinum);
		plugin::Whisper("You may only bet coins and only upto a maximum of 10,000 platinum.");
		return;
	}
	plugin::return_items(\%itemcount);
}