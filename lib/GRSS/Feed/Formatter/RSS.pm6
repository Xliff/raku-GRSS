use v6.c;

use GLib::Raw::Traits;
use GRSS::Raw::Types;
use GRSS::Raw::Feed::Formatter;

use GLib::GList;

use GLib::Roles::Object;

our subset GrssFeedRssFormatterAncestry is export of Mu
  where GrssFeedRssFormatter | GObject;

class GRSS::Feed::Formatter {
  also does GLib::Roles::Object;

  has GrssFeedRssFormatter $!gffr is implementor;

  submethod BUILD ( :$grss-feed-formatter-rss ) {
    self.setGrssFeedRssFormatter($grss-feed-formatter-rss) if $grss-feed-formatter-rss;
  }

  method setGrssFeedRssFormatter (GrssFeedRssFormatterAncestry $_) {
    my $to-parent;

    $!gffr = do {
      when GrssFeedRssFormatter {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GrssFeedRssFormatter, $_);
      }
    }
  }

  multi method new (GrssFeedRssFormatterAncestry $grss-feed-formatter-rss, :$ref = True) {
    return Nil unless $grss-feed-formatter-rss;

    my $o = self.bless( :$grss-feed-formatter-rss );
    $o.ref if $ref;
    $o;
  }
  multi method new {
	my $grss-feed-formatter-rss = grss_feed_rss_formatter_new;

	$grss-feed-formatter-rss ?? self.bless( :$grss-feed-formatter-rss ) !! Nil 
  }

  method GRSS::Raw::Structs::GrssFeedRssFormatter
  { $!gffr }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &grss_feed_rss_formatter_get_type, $n, $t );
  }

}

sub grss_feed_rss_formatter_new ()
	returns GrssFeedRssFormatter
	is export
	is native(grss)
{ * }

sub grss_feed_rss_formatter_get_type ()
	returns GType
	is export
	is native(grss)
{ * }
