use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GRSS::Raw::Definitions;
use GRSS::Raw::Structs;

unit package GRSS::Raw::Feed::Item;


### /usr/src/libgrss-0.7.0/src/feed-item.h

sub grss_feed_item_add_category (GrssFeedItem $item, Str $category)
  is native(grss)
  is export
{ * }

sub grss_feed_item_add_contributor (
  GrssFeedItem $item,
  GrssPerson   $contributor
)
  is native(grss)
  is export
{ * }

sub grss_feed_item_add_enclosure (
  GrssFeedItem      $item,
  GrssFeedEnclosure $enclosure
)
  is native(grss)
  is export
{ * }

sub grss_feed_item_get_author (GrssFeedItem $item)
  returns GrssPerson
  is native(grss)
  is export
{ * }

sub grss_feed_item_get_categories (GrssFeedItem $item)
  returns GList
  is native(grss)
  is export
{ * }

sub grss_feed_item_get_comments_url (GrssFeedItem $item)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_item_get_contributors (GrssFeedItem $item)
  returns GList
  is native(grss)
  is export
{ * }

sub grss_feed_item_get_copyright (GrssFeedItem $item)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_item_get_description (GrssFeedItem $item)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_item_get_enclosures (GrssFeedItem $item)
  returns GList
  is native(grss)
  is export
{ * }

sub grss_feed_item_get_geo_point (
  GrssFeedItem $item,
  gdouble      $latitude  is rw,
  gdouble      $longitude is rw
)
  returns uint32
  is native(grss)
  is export
{ * }

sub grss_feed_item_get_id (GrssFeedItem $item)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_item_get_parent (GrssFeedItem $item)
  returns GrssFeedChannel
  is native(grss)
  is export
{ * }

sub grss_feed_item_get_publish_time (GrssFeedItem $item)
  returns time_t
  is native(grss)
  is export
{ * }

sub grss_feed_item_get_real_source (
  GrssFeedItem $item,
  CArray[Str]  $realsource,
  CArray[Str]  $title
)
  is native(grss)
  is export
{ * }

sub grss_feed_item_get_related (GrssFeedItem $item)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_item_get_source (GrssFeedItem $item)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_item_get_title (GrssFeedItem $item)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_item_get_type ()
  returns GType
  is native(grss)
  is export
{ * }

sub grss_feed_item_new (GrssFeedChannel $parent)
  returns GrssFeedItem
  is native(grss)
  is export
{ * }

sub grss_feed_item_set_author (GrssFeedItem $item, GrssPerson $author)
  is native(grss)
  is export
{ * }

sub grss_feed_item_set_comments_url (GrssFeedItem $item, Str $url)
  returns uint32
  is native(grss)
  is export
{ * }

sub grss_feed_item_set_copyright (GrssFeedItem $item, Str $copyright)
  is native(grss)
  is export
{ * }

sub grss_feed_item_set_description (GrssFeedItem $item, Str $description)
  is native(grss)
  is export
{ * }

sub grss_feed_item_set_geo_point (
  GrssFeedItem $item,
  gdouble      $latitude,
  gdouble      $longitude
)
  is native(grss)
  is export
{ * }

sub grss_feed_item_set_id (GrssFeedItem $item, Str $id)
  is native(grss)
  is export
{ * }

sub grss_feed_item_set_publish_time (GrssFeedItem $item, time_t $publish)
  is native(grss)
  is export
{ * }

sub grss_feed_item_set_real_source (
  GrssFeedItem $item,
  Str          $realsource,
  Str          $title
)
  returns uint32
  is native(grss)
  is export
{ * }

sub grss_feed_item_set_related (GrssFeedItem $item, Str $related)
  is native(grss)
  is export
{ * }

sub grss_feed_item_set_source (GrssFeedItem $item, Str $source)
  returns uint32
  is native(grss)
  is export
{ * }

sub grss_feed_item_set_title (GrssFeedItem $item, Str $title)
  is native(grss)
  is export
{ * }
