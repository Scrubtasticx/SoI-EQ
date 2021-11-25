my $InstanceID = 0;
my @Data = undef;
my @ZoneArray =
	(
		"Kurns Tower",
		"The Citadel of Runnyeye",
		"Marus Seru",
		"Dulak's Harbor",
		"The Temple of Droga",
		"The Ruins of Sebilis",
		"Vex Thal",
		"The Crypt of Decay",
		"The Plane of Fire",
		"Riwwi, Coliseum of Games",
		"Kod'Taz, Broken Trial Grounds",
		"Muramite Proving Grounds",
		"Feerrott The Dream",
		"House of Thule"

	);

sub EVENT_SAY {
	my $NPCName = $npc->GetCleanName();
	if ($text=~/hail/i) {
		#:: Key a data bucket to protect functions
		$key = $NPCName . "-current-name";
		#:: Match if the key exists
		if (quest::get_data($key)) {
			#:: Match if the person talking is the focus of our attention
			if (quest::get_data($key) eq "$name") {
				$client->Message(315, "$NPCName says, 'Hello, $name.  Are you interested in a [" . quest::saylink("Teleport") . "]?'");
				$client->Message(315, "");
			}
			#:: Match if the person talking rudely interrupted
			else {
				$Name = quest::get_data($key);
				quest::say("I am sorry, $name, but I was right in the middle of speaking with " . $Name . ".  Is " . $Name . " [" . quest::saylink("gone") . "]?");
			}
		}
		else {
			#:: Set the data bucket
			quest::set_data($key, $name);
			$client->Message(315, "$NPCName says, 'Hello, $name.  Are you interested in a [" . quest::saylink("Teleport") . "]?'");
			$client->Message(315, "");
		}
	}
	elsif ($text=~/gone/i) {
		#:: Key a data bucket to protect functions
		$key = $NPCName . "-cool-down";
		#:: Match if the key exists
		if (quest::get_data($key)) {
			quest::say("Give me a minute, $name.  I seem to keep losing people.");
		}
		else {
			#:: Protect gone from switching for 60 seconds
			quest::set_data($key, 1, 60);
			#:: Key a data bucket to protect functions
			$key = $NPCName . "-current-name";
			#:: Set the data bucket
			quest::set_data($key, $name);
			$client->Message(315, "$NPCName says, 'Well then, $name...are you interested in a [" . quest::saylink("Teleport") . "]?'");
			$client->Message(315, "");
		}
	}
	elsif ($text=~/Teleport/i) {
		#:: Key a data bucket to protect functions
		$key = $NPCName . "-current-name";
		#:: Match if the person talking is the focus of our attention
		if (quest::get_data($key) eq "$name") {
			#:: Speak the elements of the zone array
			my $count = 1;
			my $n = 0;
			while ($ZoneArray[$n]) {
				if ($ZoneArray[$n]) {
					my $ZoneName = quest::saylink($ZoneArray[$n]);
					$client->Message(315, "$NPCName says, 'Would you like to go to [$ZoneName]?'");
					$client->Message(315, "");
				}
				$n++;
				$count++;
			}
		}
		#:: Match if the person talking rudely interrupted
		else {
			$Name = quest::get_data($key);
			quest::say("I am sorry, $name, but I was right in the middle of speaking with " . $Name . ".  Is " . $Name . " [" . quest::saylink("gone") . "]?");
		}
	}
	elsif ($text=~/\bKurns Tower\b/i) {
		#:: Key a data bucket to protect functions
		$key = $NPCName . "-current-name";
		#:: Match if the person talking is the focus of our attention
		if (quest::get_data($key) eq "$name") {
			@Data = undef;  
			@Data = ("kurns", 97, 73.50, -275.55, 2.19);
			#:: Key a data bucket to check the player's existing zone instance setting
			$key = $client->CharacterID() . "-active-instance-zone";
			#:: Match if the data bucket does not exist
			if (!quest::get_data($key)) {
				#:: Set a data bucket to track player zone instance
				quest::set_data($key, "$Data[0]", 86400);
				#:: Create the Instance of that zone and store the ID in a scalar variable
				$InstanceID = quest::CreateInstance("$Data[0]", 0, 86400);
				#:: Key a data bucket to track the player's instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Set a data bucket to track player's instance ID
				quest::set_data($key, $InstanceID, 86400);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists for this zone shortname
			elsif (quest::get_data($key) eq "$Data[0]") {
				#:: Key a data bucket to pull the instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Update the scalar variable
				$InstanceID = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists but is set to a different zone
			else {
				$CharInstance = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Sorry $name, but it looks like you already have an instance for" . $CharInstance . ". Would you like to [" . quest::saylink("delete") . "] it for 500 AAs?'");
			}
		}
		#:: Match if the person talking rudely interrupted
		else {
			$Name = quest::get_data($key);
			quest::say("I am sorry, $name, but I was right in the middle of speaking with " . $Name . ".  Is " . $Name . " [" . quest::saylink("gone") . "]?");
		}
	}
	elsif ($text=~/\bThe Citadel of Runnyeye\b/i) {
		#:: Key a data bucket to protect functions
		$key = $NPCName . "-current-name";
		#:: Match if the person talking is the focus of our attention
		if (quest::get_data($key) eq "$name") {
			@Data = undef;  
			@Data = ("runnyeye" , 11, -21.85, -108.88, 3.75);
			#:: Key a data bucket to check the player's existing zone instance setting
			$key = $client->CharacterID() . "-active-instance-zone";
			#:: Match if the data bucket does not exist
			if (!quest::get_data($key)) {
				#:: Set a data bucket to track player zone instance
				quest::set_data($key, "$Data[0]", 86400);
				#:: Create the Instance of that zone and store the ID in a scalar variable
				$InstanceID = quest::CreateInstance("$Data[0]", 0, 86400);
				#:: Key a data bucket to track the player's instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Set a data bucket to track player's instance ID
				quest::set_data($key, $InstanceID, 86400);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists for this zone shortname
			elsif (quest::get_data($key) eq "$Data[0]") {
				#:: Key a data bucket to pull the instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Update the scalar variable
				$InstanceID = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists but is set to a different zone
			else {
				$CharInstance = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Sorry $name, but it looks like you already have an instance for" . $CharInstance . ". Would you like to [" . quest::saylink("delete") . "] it for 500 AAs?'");
			}
		}
		#:: Match if the person talking rudely interrupted
		else {
			$Name = quest::get_data($key);
			quest::say("I am sorry, $name, but I was right in the middle of speaking with " . $Name . ".  Is " . $Name . " [" . quest::saylink("gone") . "]?");
		}
	}
	elsif ($text=~/\bMarus Seru\b/i) {
		#:: Key a data bucket to protect functions
		$key = $NPCName . "-current-name";
		#:: Match if the person talking is the focus of our attention
		if (quest::get_data($key) eq "$name") {
			@Data = undef;  
			@Data = ("mseru" , 168, -1668, 539, -4.6);
			#:: Key a data bucket to check the player's existing zone instance setting
			$key = $client->CharacterID() . "-active-instance-zone";
			#:: Match if the data bucket does not exist
			if (!quest::get_data($key)) {
				#:: Set a data bucket to track player zone instance
				quest::set_data($key, "$Data[0]", 86400);
				#:: Create the Instance of that zone and store the ID in a scalar variable
				$InstanceID = quest::CreateInstance("$Data[0]", 0, 86400);
				#:: Key a data bucket to track the player's instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Set a data bucket to track player's instance ID
				quest::set_data($key, $InstanceID, 86400);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists for this zone shortname
			elsif (quest::get_data($key) eq "$Data[0]") {
				#:: Key a data bucket to pull the instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Update the scalar variable
				$InstanceID = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists but is set to a different zone
			else {
				$CharInstance = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Sorry $name, but it looks like you already have an instance for" . $CharInstance . ". Would you like to [" . quest::saylink("delete") . "] it for 500 AAs?'");
			}
		}
		#:: Match if the person talking rudely interrupted
		else {
			$Name = quest::get_data($key);
			quest::say("I am sorry, $name, but I was right in the middle of speaking with " . $Name . ".  Is " . $Name . " [" . quest::saylink("gone") . "]?");
		}
	}
	elsif ($text=~/\bDulak's Harbor\b/i) {
		#:: Key a data bucket to protect functions
		$key = $NPCName . "-current-name";
		#:: Match if the person talking is the focus of our attention
		if (quest::get_data($key) eq "$name") {
			@Data = undef;  
			@Data = ("dulak" , 225, 438, 548, 4);
			#:: Key a data bucket to check the player's existing zone instance setting
			$key = $client->CharacterID() . "-active-instance-zone";
			#:: Match if the data bucket does not exist
			if (!quest::get_data($key)) {
				#:: Set a data bucket to track player zone instance
				quest::set_data($key, "$Data[0]", 86400);
				#:: Create the Instance of that zone and store the ID in a scalar variable
				$InstanceID = quest::CreateInstance("$Data[0]", 0, 86400);
				#:: Key a data bucket to track the player's instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Set a data bucket to track player's instance ID
				quest::set_data($key, $InstanceID, 86400);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists for this zone shortname
			elsif (quest::get_data($key) eq "$Data[0]") {
				#:: Key a data bucket to pull the instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Update the scalar variable
				$InstanceID = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists but is set to a different zone
			else {
				$CharInstance = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Sorry $name, but it looks like you already have an instance for" . $CharInstance . ". Would you like to [" . quest::saylink("delete") . "] it for 500 AAs?'");
			}
		}
		#:: Match if the person talking rudely interrupted
		else {
			$Name = quest::get_data($key);
			quest::say("I am sorry, $name, but I was right in the middle of speaking with " . $Name . ".  Is " . $Name . " [" . quest::saylink("gone") . "]?");
		}
	}
	elsif ($text=~/\bThe Temple of Droga\b/i) {
		#:: Key a data bucket to protect functions
		$key = $NPCName . "-current-name";
		#:: Match if the person talking is the focus of our attention
		if (quest::get_data($key) eq "$name") {
			@Data = undef;  
			@Data = ("droga" , 81, 294.11, 1371.43, 3.75);
			#:: Key a data bucket to check the player's existing zone instance setting
			$key = $client->CharacterID() . "-active-instance-zone";
			#:: Match if the data bucket does not exist
			if (!quest::get_data($key)) {
				#:: Set a data bucket to track player zone instance
				quest::set_data($key, "$Data[0]", 86400);
				#:: Create the Instance of that zone and store the ID in a scalar variable
				$InstanceID = quest::CreateInstance("$Data[0]", 0, 86400);
				#:: Key a data bucket to track the player's instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Set a data bucket to track player's instance ID
				quest::set_data($key, $InstanceID, 86400);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists for this zone shortname
			elsif (quest::get_data($key) eq "$Data[0]") {
				#:: Key a data bucket to pull the instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Update the scalar variable
				$InstanceID = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists but is set to a different zone
			else {
				$CharInstance = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Sorry $name, but it looks like you already have an instance for" . $CharInstance . ". Would you like to [" . quest::saylink("delete") . "] it for 500 AAs?'");
			}
		}
		#:: Match if the person talking rudely interrupted
		else {
			$Name = quest::get_data($key);
			quest::say("I am sorry, $name, but I was right in the middle of speaking with " . $Name . ".  Is " . $Name . " [" . quest::saylink("gone") . "]?");
		}
	}
	elsif ($text=~/\bThe Ruins of Sebilis\b/i) {
		#:: Key a data bucket to protect functions
		$key = $NPCName . "-current-name";
		#:: Match if the person talking is the focus of our attention
		if (quest::get_data($key) eq "$name") {
			@Data = undef;  
			@Data = ("sebilis" , 89, 0, 235, 40);
			#:: Key a data bucket to check the player's existing zone instance setting
			$key = $client->CharacterID() . "-active-instance-zone";
			#:: Match if the data bucket does not exist
			if (!quest::get_data($key)) {
				#:: Set a data bucket to track player zone instance
				quest::set_data($key, "$Data[0]", 86400);
				#:: Create the Instance of that zone and store the ID in a scalar variable
				$InstanceID = quest::CreateInstance("$Data[0]", 0, 86400);
				#:: Key a data bucket to track the player's instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Set a data bucket to track player's instance ID
				quest::set_data($key, $InstanceID, 86400);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists for this zone shortname
			elsif (quest::get_data($key) eq "$Data[0]") {
				#:: Key a data bucket to pull the instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Update the scalar variable
				$InstanceID = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists but is set to a different zone
			else {
				$CharInstance = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Sorry $name, but it looks like you already have an instance for" . $CharInstance . ". Would you like to [" . quest::saylink("delete") . "] it for 500 AAs?'");
			}
		}
		#:: Match if the person talking rudely interrupted
		else {
			$Name = quest::get_data($key);
			quest::say("I am sorry, $name, but I was right in the middle of speaking with " . $Name . ".  Is " . $Name . " [" . quest::saylink("gone") . "]?");
		}
	}
	elsif ($text=~/\bVex Thal\b/i) {
		#:: Key a data bucket to protect functions
		$key = $NPCName . "-current-name";
		#:: Match if the person talking is the focus of our attention
		if (quest::get_data($key) eq "$name") {
			@Data = undef;  
			@Data = ("vexthal" , 158, -1400, 343, -40.4);
			#:: Key a data bucket to check the player's existing zone instance setting
			$key = $client->CharacterID() . "-active-instance-zone";
			#:: Match if the data bucket does not exist
			if (!quest::get_data($key)) {
				#:: Set a data bucket to track player zone instance
				quest::set_data($key, "$Data[0]", 86400);
				#:: Create the Instance of that zone and store the ID in a scalar variable
				$InstanceID = quest::CreateInstance("$Data[0]", 0, 86400);
				#:: Key a data bucket to track the player's instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Set a data bucket to track player's instance ID
				quest::set_data($key, $InstanceID, 86400);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists for this zone shortname
			elsif (quest::get_data($key) eq "$Data[0]") {
				#:: Key a data bucket to pull the instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Update the scalar variable
				$InstanceID = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists but is set to a different zone
			else {
				$CharInstance = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Sorry $name, but it looks like you already have an instance for" . $CharInstance . ". Would you like to [" . quest::saylink("delete") . "] it for 500 AAs?'");
			}
		}
		#:: Match if the person talking rudely interrupted
		else {
			$Name = quest::get_data($key);
			quest::say("I am sorry, $name, but I was right in the middle of speaking with " . $Name . ".  Is " . $Name . " [" . quest::saylink("gone") . "]?");
		}
	}
	elsif ($text=~/\bThe Crypt of Decay\b/i) {
		#:: Key a data bucket to protect functions
		$key = $NPCName . "-current-name";
		#:: Match if the person talking is the focus of our attention
		if (quest::get_data($key) eq "$name") {
			@Data = undef;  
			@Data = ("codecay" , 200, -153.7, -66.1, -95.8);
			#:: Key a data bucket to check the player's existing zone instance setting
			$key = $client->CharacterID() . "-active-instance-zone";
			#:: Match if the data bucket does not exist
			if (!quest::get_data($key)) {
				#:: Set a data bucket to track player zone instance
				quest::set_data($key, "$Data[0]", 86400);
				#:: Create the Instance of that zone and store the ID in a scalar variable
				$InstanceID = quest::CreateInstance("$Data[0]", 0, 86400);
				#:: Key a data bucket to track the player's instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Set a data bucket to track player's instance ID
				quest::set_data($key, $InstanceID, 86400);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists for this zone shortname
			elsif (quest::get_data($key) eq "$Data[0]") {
				#:: Key a data bucket to pull the instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Update the scalar variable
				$InstanceID = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists but is set to a different zone
			else {
				$CharInstance = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Sorry $name, but it looks like you already have an instance for" . $CharInstance . ". Would you like to [" . quest::saylink("delete") . "] it for 500 AAs?'");
			}
		}
		#:: Match if the person talking rudely interrupted
		else {
			$Name = quest::get_data($key);
			quest::say("I am sorry, $name, but I was right in the middle of speaking with " . $Name . ".  Is " . $Name . " [" . quest::saylink("gone") . "]?");
		}
	}
	elsif ($text=~/\bThe Plane of Fire\b/i) {
		#:: Key a data bucket to protect functions
		$key = $NPCName . "-current-name";
		#:: Match if the person talking is the focus of our attention
		if (quest::get_data($key) eq "$name") {
			@Data = undef;  
			@Data = ("pofire" , 217, -1387, 1210, -180.84);
			#:: Key a data bucket to check the player's existing zone instance setting
			$key = $client->CharacterID() . "-active-instance-zone";
			#:: Match if the data bucket does not exist
			if (!quest::get_data($key)) {
				#:: Set a data bucket to track player zone instance
				quest::set_data($key, "$Data[0]", 86400);
				#:: Create the Instance of that zone and store the ID in a scalar variable
				$InstanceID = quest::CreateInstance("$Data[0]", 0, 86400);
				#:: Key a data bucket to track the player's instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Set a data bucket to track player's instance ID
				quest::set_data($key, $InstanceID, 86400);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists for this zone shortname
			elsif (quest::get_data($key) eq "$Data[0]") {
				#:: Key a data bucket to pull the instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Update the scalar variable
				$InstanceID = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists but is set to a different zone
			else {
				$CharInstance = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Sorry $name, but it looks like you already have an instance for" . $CharInstance . ". Would you like to [" . quest::saylink("delete") . "] it for 500 AAs?'");
			}
		}
		#:: Match if the person talking rudely interrupted
		else {
			$Name = quest::get_data($key);
			quest::say("I am sorry, $name, but I was right in the middle of speaking with " . $Name . ".  Is " . $Name . " [" . quest::saylink("gone") . "]?");
		}
	}
	elsif ($text=~/\bRiwwi, Coliseum of Games\b/i) {
		#:: Key a data bucket to protect functions
		$key = $NPCName . "-current-name";
		#:: Match if the person talking is the focus of our attention
		if (quest::get_data($key) eq "$name") {
			@Data = undef;  
			@Data = ("riwwi" , 282, 454, -650, 35);
			#:: Key a data bucket to check the player's existing zone instance setting
			$key = $client->CharacterID() . "-active-instance-zone";
			#:: Match if the data bucket does not exist
			if (!quest::get_data($key)) {
				#:: Set a data bucket to track player zone instance
				quest::set_data($key, "$Data[0]", 86400);
				#:: Create the Instance of that zone and store the ID in a scalar variable
				$InstanceID = quest::CreateInstance("$Data[0]", 0, 86400);
				#:: Key a data bucket to track the player's instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Set a data bucket to track player's instance ID
				quest::set_data($key, $InstanceID, 86400);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists for this zone shortname
			elsif (quest::get_data($key) eq "$Data[0]") {
				#:: Key a data bucket to pull the instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Update the scalar variable
				$InstanceID = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists but is set to a different zone
			else {
				$CharInstance = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Sorry $name, but it looks like you already have an instance for" . $CharInstance . ". Would you like to [" . quest::saylink("delete") . "] it for 500 AAs?'");
			}
		}
		#:: Match if the person talking rudely interrupted
		else {
			$Name = quest::get_data($key);
			quest::say("I am sorry, $name, but I was right in the middle of speaking with " . $Name . ".  Is " . $Name . " [" . quest::saylink("gone") . "]?");
		}
	}
	elsif ($text=~/\bKod'Taz, Broken Trial Grounds\b/i) {
		#:: Key a data bucket to protect functions
		$key = $NPCName . "-current-name";
		#:: Match if the person talking is the focus of our attention
		if (quest::get_data($key) eq "$name") {
			@Data = undef;  
			@Data = ("kodtaz" , 293, -1475, 1548, -302.12);
			#:: Key a data bucket to check the player's existing zone instance setting
			$key = $client->CharacterID() . "-active-instance-zone";
			#:: Match if the data bucket does not exist
			if (!quest::get_data($key)) {
				#:: Set a data bucket to track player zone instance
				quest::set_data($key, "$Data[0]", 86400);
				#:: Create the Instance of that zone and store the ID in a scalar variable
				$InstanceID = quest::CreateInstance("$Data[0]", 0, 86400);
				#:: Key a data bucket to track the player's instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Set a data bucket to track player's instance ID
				quest::set_data($key, $InstanceID, 86400);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists for this zone shortname
			elsif (quest::get_data($key) eq "$Data[0]") {
				#:: Key a data bucket to pull the instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Update the scalar variable
				$InstanceID = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists but is set to a different zone
			else {
				$CharInstance = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Sorry $name, but it looks like you already have an instance for" . $CharInstance . ". Would you like to [" . quest::saylink("delete") . "] it for 500 AAs?'");
			}
		}
		#:: Match if the person talking rudely interrupted
		else {
			$Name = quest::get_data($key);
			quest::say("I am sorry, $name, but I was right in the middle of speaking with " . $Name . ".  Is " . $Name . " [" . quest::saylink("gone") . "]?");
		}
	}
	elsif ($text=~/\bMuramite Proving Grounds\b/i) {
		#:: Key a data bucket to protect functions
		$key = $NPCName . "-current-name";
		#:: Match if the person talking is the focus of our attention
		if (quest::get_data($key) eq "$name") {
			@Data = undef;  
			@Data = ("provinggrounds" , 316, -124, -5676, -306);
			#:: Key a data bucket to check the player's existing zone instance setting
			$key = $client->CharacterID() . "-active-instance-zone";
			#:: Match if the data bucket does not exist
			if (!quest::get_data($key)) {
				#:: Set a data bucket to track player zone instance
				quest::set_data($key, "$Data[0]", 86400);
				#:: Create the Instance of that zone and store the ID in a scalar variable
				$InstanceID = quest::CreateInstance("$Data[0]", 0, 86400);
				#:: Key a data bucket to track the player's instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Set a data bucket to track player's instance ID
				quest::set_data($key, $InstanceID, 86400);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists for this zone shortname
			elsif (quest::get_data($key) eq "$Data[0]") {
				#:: Key a data bucket to pull the instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Update the scalar variable
				$InstanceID = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists but is set to a different zone
			else {
				$CharInstance = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Sorry $name, but it looks like you already have an instance for" . $CharInstance . ". Would you like to [" . quest::saylink("delete") . "] it for 500 AAs?'");
			}
		}
		#:: Match if the person talking rudely interrupted
		else {
			$Name = quest::get_data($key);
			quest::say("I am sorry, $name, but I was right in the middle of speaking with " . $Name . ".  Is " . $Name . " [" . quest::saylink("gone") . "]?");
		}
	}
	elsif ($text=~/\bFeerrott the Dream\b/i) {
		#:: Key a data bucket to protect functions
		$key = $NPCName . "-current-name";
		#:: Match if the person talking is the focus of our attention
		if (quest::get_data($key) eq "$name") {
			@Data = undef;  
			@Data = ("feerrott2", 700, -2693.37, -974.36, 2.31082);
			#:: Key a data bucket to check the player's existing zone instance setting
			$key = $client->CharacterID() . "-active-instance-zone";
			#:: Match if the data bucket does not exist
			if (!quest::get_data($key)) {
				#:: Set a data bucket to track player zone instance
				quest::set_data($key, "$Data[0]", 86400);
				#:: Create the Instance of that zone and store the ID in a scalar variable
				$InstanceID = quest::CreateInstance("$Data[0]", 0, 86400);
				#:: Key a data bucket to track the player's instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Set a data bucket to track player's instance ID
				quest::set_data($key, $InstanceID, 86400);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists for this zone shortname
			elsif (quest::get_data($key) eq "$Data[0]") {
				#:: Key a data bucket to pull the instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Update the scalar variable
				$InstanceID = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists but is set to a different zone
			else {
				$CharInstance = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Sorry $name, but it looks like you already have an instance for" . $CharInstance . ". Would you like to [" . quest::saylink("delete") . "] it for 500 AAs?'");
			}
		}
		#:: Match if the person talking rudely interrupted
		else {
			$Name = quest::get_data($key);
			quest::say("I am sorry, $name, but I was right in the middle of speaking with " . $Name . ".  Is " . $Name . " [" . quest::saylink("gone") . "]?");
		}
	}
	elsif ($text=~/\bHouse of Thule\b/i) {
		#:: Key a data bucket to protect functions
		$key = $NPCName . "-current-name";
		#:: Match if the person talking is the focus of our attention
		if (quest::get_data($key) eq "$name") {
			@Data = undef;  
			@Data = ("thulehouse1" , 701, 0, -332, 4);
			#:: Key a data bucket to check the player's existing zone instance setting
			$key = $client->CharacterID() . "-active-instance-zone";
			#:: Match if the data bucket does not exist
			if (!quest::get_data($key)) {
				#:: Set a data bucket to track player zone instance
				quest::set_data($key, "$Data[0]", 86400);
				#:: Create the Instance of that zone and store the ID in a scalar variable
				$InstanceID = quest::CreateInstance("$Data[0]", 0, 86400);
				#:: Key a data bucket to track the player's instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Set a data bucket to track player's instance ID
				quest::set_data($key, $InstanceID, 86400);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists for this zone shortname
			elsif (quest::get_data($key) eq "$Data[0]") {
				#:: Key a data bucket to pull the instance ID
				$key = $client->CharacterID() . "-active-instance-id";
				#:: Update the scalar variable
				$InstanceID = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Alright, $name.  Please tell me when you are ready to [" . quest::saylink("Go") . "].'");
			}
			#:: Match if the data bucket exists but is set to a different zone
			else {
				$CharInstance = quest::get_data($key);
				$client->Message(315, "$NPCName says, 'Sorry $name, but it looks like you already have an instance for" . $CharInstance . ". Would you like to [" . quest::saylink("delete") . "] it for 500 AAs?'");
			}
		}
		#:: Match if the person talking rudely interrupted
		else {
			$Name = quest::get_data($key);
			quest::say("I am sorry, $name, but I was right in the middle of speaking with " . $Name . ".  Is " . $Name . " [" . quest::saylink("gone") . "]?");
		}
	}
	elsif ($text=~/Go/i) {
		#:: Key a data bucket to protect functions
		$key = $NPCName . "-current-name";
		#:: Match if the person talking is the focus of our attention
		if (quest::get_data($key) eq "$name") {
			#:: Key a data bucket to check for existing instances
			$key = $client->CharacterID() . "-active-instance-zone";
			#:: Match if the data bucket exists and matches zone data
			if (quest::get_data($key) eq "$Data[0]") {
				DoTeleport();
			}
			else {
				$client->Message(315, "$NPCName says, 'I am sorry, $name...I seem to have lost my train of thought.  Where did you want to go again?");
				#:: Speak the elements of the zone array
				my $count = 1;
				my $n = 0;
				while ($ZoneArray[$n]) {
					if ($ZoneArray[$n]) {
						my $ZoneName = quest::saylink($ZoneArray[$n]);
						$client->Message(315, "$NPCName says, 'Would you like to go to $ZoneName?'");
					}
					$n++;
					$count++;
				}
			}
		}
		#:: Match if the person talking rudely interrupted
		else {
			$Name = quest::get_data($key);
			quest::say("I am sorry, $name, but I was right in the middle of speaking with " . $Name . ".  Is " . $Name . " [" . quest::saylink("gone") . "]?");
		}

	}
	elsif ($text=~/delete/i) {
		#:: Key a data bucket to protect functions
		$key = $NPCName . "-current-name";
		#:: Match if the person talking is the focus of our attention
		if (quest::get_data($key) eq "$name") {
			#:: Create a scalar variable to store total aa points
			my $total = $client->GetAAPoints();
			#:: Create a scalar variable to store the cost of deletion
			my $cost = (500);
			#:: Match if the player who triggered the event has more AAs than the reset costs
			if ($total >= $cost) {
				#:: Key a data bucket to check for existing instances by zone
				$key = $client->CharacterID() . "-active-instance-zone";
				#:: Match if the data bucket exists
				if (quest::get_data($key)) {
					#:: Destroy the data bucket
					quest::delete_data($key);
					#:: Key a data bucket to check for existing instances by ID
					$key = $client->CharacterID() . "-active-instance-id";
					#:: Match if the data bucket exists
					if (quest::get_data($key)) {
						#:: Destroy the data bucket just to be tidy
						quest::delete_data($key);
					}
					$total = int($total-$cost);    
					$client->SetAAPoints($total);
					$client->Message(315, "$NPCName says, 'Easy come, easy go, right $name?  You are now free to [" . quest::saylink("Teleport") . "] wherever you would like to go.'");
				}
				else {
					$client->Message(315, "$NPCName says, 'You have no instances, $name.  You are free to [" . quest::saylink("Teleport") . "] wherever you would like to go.'");
				}
			}
			else {
				$client->Message(315, "$NPCName says, 'Sorry, $name, but you do not have the $cost AA points required to reset an instance.'");
			}
		}
		#:: Match if the person talking rudely interrupted
		else {
			$Name = quest::get_data($key);
			quest::say("I am sorry, $name, but I was right in the middle of speaking with " . $Name . ".  Is " . $Name . " [" . quest::saylink("gone") . "]?");
		}
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub DoTeleport {
	quest::say("Zone: " . $Data[0] . ", Instance ID: $InstanceID, Zone ID: " . $Data[1] . ", X: " . $Data[2] . ", Y: " . $Data[3] . ", Z: " . $Data[4] . ".");
	#:: Assign to an instance
	quest::AssignToInstance($InstanceID);
	#:: Create a scalar variable to store client Raid information
	$raid = $entity_list->GetRaidByClient($client);
	#:: Create a scalar variable to store client Group information
	$group = $entity_list->GetGroupByClient($client);
	#:: Move the client who triggered the event to the specified location
	$client->MovePCInstance($Data[1], $InstanceID, $Data[2], $Data[3], $Data[4], 0);
	#:: Match if the player is in a Raid
	if ($raid) {
		#:: Loop through each member of the Raid
		for ($count = 0; $count < $raid->RaidCount(); $count++) {
			#:: Create a scalar variable to store the Raid's member count
			$pc = $raid->GetMember($count);
			#:: Match if the Raid member is near the client who triggered the event
			if ($pc->CalculateDistance($x,$y,$z) <= 150) {
				#:: Assign to the instance
				$pc->AssignToInstance($InstanceID);
				#:: Move the Raid member to the specified location
				$pc->MovePCInstance($Data[1], $InstanceID, $Data[2], $Data[3], $Data[4], 0);
			}
		}
	}
	#:: Match if the player is in a Group
	elsif ($group) {
		#:: Loop through each member of the Group
		for ($count = 0; $count < $group->GroupCount(); $count++) {
			#:: Create a scalar variable to store the Group's member count
			$pc = $group->GetMember($count);
			#:: Match if the Group member is near the client who triggered the event
			if ($pc->CalculateDistance($x,$y,$z) <= 150) {
				#:: Assign to the instance
				$pc->AssignToInstance($InstanceID);
				#:: Move the Group member to the specified location
				$pc->MovePCInstance($Data[1], $InstanceID, $Data[2], $Data[3], $Data[4], 0);
			}
		}
	}
	#:: Key a data bucket to protect functions
	$key = $NPCName . "-current-name";
	#:: Destroy the data bucket
	quest::delete_data($key);
}