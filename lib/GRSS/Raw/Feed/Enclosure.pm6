use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GIO::Raw::Definitions;
use GRSS::Raw::Definitions;
use GRSS::Raw::Structs;

unit package GRSS::Raw::Feed::Enclosure;

### /usr/src/libgrss-0.7.0/src/feed-enclosure.h

sub grss_feed_enclosure_fetch (GrssFeedEnclosure $enclosure, CArray[Pointer[GError]] $error)
  returns GFile
  is native(grss)
  is export
{ * }

sub grss_feed_enclosure_fetch_async (
  GrssFeedEnclosure $enclosure,
                    &callback (GrssFeedEnclosure, GAsyncResult, gpointer),
  gpointer          $user_data
)
  is native(grss)
  is export
{ * }

sub grss_feed_enclosure_fetch_finish (
  GrssFeedEnclosure       $enclosure,
  GAsyncResult            $res,
  CArray[Pointer[GError]] $error
)
  returns GFile
  is native(grss)
  is export
{ * }

sub grss_feed_enclosure_get_format (GrssFeedEnclosure $enclosure)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_enclosure_get_length (GrssFeedEnclosure $enclosure)
  returns gsize
  is native(grss)
  is export
{ * }

sub grss_feed_enclosure_get_type ()
  returns GType
  is native(grss)
  is export
{ * }

sub grss_feed_enclosure_get_url (GrssFeedEnclosure $enclosure)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_enclosure_new (Str $url)
  returns GrssFeedEnclosure
  is native(grss)
  is export
{ * }

sub grss_feed_enclosure_set_format (GrssFeedEnclosure $enclosure, Str $type)
  is native(grss)
  is export
{ * }

sub grss_feed_enclosure_set_length (
  GrssFeedEnclosure $enclosure,
  gsize             $length
)
  is native(grss)
  is export
{ * }
