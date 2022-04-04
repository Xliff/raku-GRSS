use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GRSS::Raw::Definitions;
use GRSS::Raw::Structs;

unit package GRSS::Raw::Feed::Formatter;


### /usr/src/libgrss-0.7.0/src/feed-formatter.h

sub grss_feed_formatter_add_item (
  GrssFeedFormatter $formatter,
  GrssFeedItem      $item
)
  is native(grss)
  is export
{ * }

sub grss_feed_formatter_add_items (GrssFeedFormatter $formatter, GList $items)
  is native(grss)
  is export
{ * }

sub grss_feed_formatter_format (GrssFeedFormatter $formatter)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_formatter_get_channel (GrssFeedFormatter $formatter)
  returns GrssFeedChannel
  is native(grss)
  is export
{ * }

sub grss_feed_formatter_get_items (GrssFeedFormatter $formatter)
  returns GList
  is native(grss)
  is export
{ * }

sub grss_feed_formatter_get_type ()
  returns GType
  is native(grss)
  is export
{ * }

sub grss_feed_formatter_reset (GrssFeedFormatter $formatter)
  is native(grss)
  is export
{ * }

sub grss_feed_formatter_set_channel (
  GrssFeedFormatter $formatter,
  GrssFeedChannel   $channel
)
  is native(grss)
  is export
{ * }
