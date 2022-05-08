use v6.c;

use Test;

use GRSS::Raw::Types;

use GRSS::Feed::Channel;
use GRSS::Feed::Formatter::Atom;
use GRSS::Feed::Formatter::RSS;

constant TEST_CHANNEL_TITLE	  = "Test Feed";
constant TEST_CHANNEL_COPYRIGHT	  = "Copyright 2014 John Doe";
constant TEST_CHANNEL_DESCRIPTION = "A test fake feed";

sub do-the-job($f) {
	given (my $c = GRSS::Feed::Channel.new) {
		(.title, .copyright, .description) = (TEST_CHANNEL_TITLE, TEST_CHANNEL_COPYRIGHT, TEST_CHANNEL_DESCRIPTION);
	}
	$f.channel = $c;
	$c.unref;

	my Str $xml = $f.format;
	ok $xml.chars, "{ $f.^name } returns a non-Nil value";

	my $c2 = GRSS::Feed::Channel.new_from_memory($xml);
	if $ERROR {
		say $ERROR.message // '>> No message <<';
		fail;
	}
	pass "{ $f.^name }'s generated XML parses correctly";
}

subtest {
	do-the-job(GRSS::Feed::Formatter::Atom.new);
}, 'Atom Formatter';

subtest {
	do-the-job(GRSS::Feed::Formatter::RSS.new);
}, 'RSS Formatter';
