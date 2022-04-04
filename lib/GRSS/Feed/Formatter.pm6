use v6.c;

use GLib::Raw::Traits;
use GRSS::Raw::Types;
use GRSS::Raw::Feed::Formatter;

use GLib::GList;

use GLib::Roles::Object;

our subset GrssFeedFormatterAncestry is export of Mu
  where GrssFeedFormatter | GObject;

class GRSS::Feed::Formatter {
  also does GLib::Roles::Object;

  has GrssFeedFormatter $!gff;

  submethod BUILD ( :$grss-feed-formatter ) {
    self.setGrssFeedFormatter($grss-feed-formatter) if $grss-feed-formatter;
  }

  method setGrssFeedFormatter (GrssFeedFormatterAncestry $_) {
    my $to-parent;

    $!gff = do {
      when GrssFeedFormatter {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GrssFeedFormatter, $_);
      }
    }
  }

  method new (GrssFeedFormatterAncestry $grss-feed-formatter, :$ref = True) {
    return Nil unless $grss-feed-formatter;

    my $o = self.bless( :$grss-feed-formatter );
    $o.ref if $ref;
    $o;
  }

  method GRSS::Raw::Structs::GrssFeedFormatter
  { $!gff }

  method channel is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_channel    },
      STORE => -> $, \v { self.set_channel(v) }
  }

  method add_item (GrssFeedItem() $item) {
    grss_feed_formatter_add_item($!gff, $item);
  }


  proto method add_items (|)
  { * }

  multi method add_items (@items) {
    samewith( GLib::GList.new(@items, typed => GrssFeedItem) );
  }
  multi method add_items (GList() $items) {
    grss_feed_formatter_add_items($!gff, $items);
  }

  method format {
    grss_feed_formatter_format($!gff);
  }

  method get_channel ( :$raw = False ) {
    propReturnObject(
      grss_feed_formatter_get_channel($!gff),
      $raw,
      |GRSS::Feed::Channel.getTypePair
    );
  }

  method get_items ( :$raw = False, :$glist = False ) {
    returnGList(
      grss_feed_formatter_get_items($!gff),
      $raw,
      $glist,
      |GRSS::Feed::Item.getTypePair
    );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &grss_feed_formatter_get_type, $n, $t );
  }

  method reset {
    grss_feed_formatter_reset($!gff);
  }

  method set_channel (GrssFeedChannel() $channel) {
    grss_feed_formatter_set_channel($!gff, $channel);
  }

}
