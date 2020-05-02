sub EVENT_SAY
{
	if ($text=~/Hail/i && ($status <= 200))
			{
			plugin::Whisper("Welcome to Redemption! Please visist http://redemption.sytes.net for spell file and rules of server.");
			}
	elsif($status >= 200)
	{
		plugin::Whisper("Welcome to Redemption! Please visist http://redemption.servegame.com/forums for spell file and rules of server.");
		quest::gmsay("$name: $text", 14, 1, 0, 0);
	}
}