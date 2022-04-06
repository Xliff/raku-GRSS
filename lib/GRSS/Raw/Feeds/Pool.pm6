use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use SOUP::Raw::Definitions;
use GRSS::Raw::Definitions;
use GRSS::Raw::Structs;

unit package GRSS::Raw::Feeds::Definition;

### /usr/src/libgrss-0.7.0/src/feeds-pool.h

sub grss_feeds_pool_get_listened (GrssFeedsPool $pool)
  returns GList
  is native(grss)
  is export
{ * }

sub grss_feeds_pool_get_listened_num (GrssFeedsPool $pool)
  returns gint
  is native(grss)
  is export
{ * }

sub grss_feeds_pool_get_session (GrssFeedsPool $pool)
  returns SoupSession
  is native(grss)
  is export
{ * }

sub grss_feeds_pool_get_type ()
  returns GType
  is native(grss)
  is export
{ * }

sub grss_feeds_pool_listen (GrssFeedsPool $pool, GList $feeds)
  is native(grss)
  is export
{ * }

sub grss_feeds_pool_new ()
  returns GrssFeedsPool
  is native(grss)
  is export
{ * }

sub grss_feeds_pool_switch (GrssFeedsPool $pool, gboolean $run)
  is native(grss)
  is export
{ * }
