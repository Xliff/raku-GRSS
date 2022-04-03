use NativeCall;

use GLib::Raw::Definitions;
use GRSS::Raw::Definitions;

unit package GRSS::Raw::Feed::Channel;

### /usr/src/libgrss-0.7.0/src/feed-channel.h

sub grss_feed_channel_add_contributor (
  GrssFeedChannel $channel,
  GrssPerson      $contributor
)
  is native(grss)
  is export
{ * }

sub grss_feed_channel_add_cookie (GrssFeedChannel $channel, SoupCookie $cookie)
  is native(grss)
  is export
{ * }

sub grss_feed_channel_fetch (
  GrssFeedChannel         $channel,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(grss)
  is export
{ * }

sub grss_feed_channel_fetch_all (
  GrssFeedChannel         $channel,
  CArray[Pointer[GError]] $error
)
  returns GList
  is native(grss)
  is export
{ * }

sub grss_feed_channel_fetch_all_async (
  GrssFeedChannel $channel,
                  &callback (GrssFeedChannel, GAsyncResult, gpointer),
  gpointer        $user_data
)
  is native(grss)
  is export
{ * }

sub grss_feed_channel_fetch_all_finish (
  GrssFeedChannel         $channel,
  GAsyncResult            $res,
  CArray[Pointer[GError]] $error
)
  returns GList
  is native(grss)
  is export
{ * }

sub grss_feed_channel_fetch_async (
  GrssFeedChannel $channel,
                  &callback (GrssFeedChannel, GAsyncResult, gpointer),
  gpointer        $user_data
)
  is native(grss)
  is export
{ * }

sub grss_feed_channel_fetch_cancel (GrssFeedChannel $channel)
  returns uint32
  is native(grss)
  is export
{ * }

sub grss_feed_channel_fetch_finish (
  GrssFeedChannel         $channel,
  GAsyncResult            $res,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_category (GrssFeedChannel $channel)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_contributors (GrssFeedChannel $channel)
  returns GList
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_cookies (GrssFeedChannel $channel)
  returns GSList
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_copyright (GrssFeedChannel $channel)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_description (GrssFeedChannel $channel)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_editor (GrssFeedChannel $channel)
  returns GrssPerson
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_format (GrssFeedChannel $channel)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_generator (GrssFeedChannel $channel)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_gzip_compression (GrssFeedChannel $channel)
  returns uint32
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_homepage (GrssFeedChannel $channel)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_icon (GrssFeedChannel $channel)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_image (GrssFeedChannel $channel)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_language (GrssFeedChannel $channel)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_publish_time (GrssFeedChannel $channel)
  returns time_t
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_pubsubhub (
  GrssFeedChannel $channel,
  CArray[Str]     $hub
)
  returns uint32
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_rsscloud (
  GrssFeedChannel $channel,
  CArray[Str]     $path,
  CArray[Str]     $protocol
)
  returns uint32
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_source (GrssFeedChannel $channel)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_title (GrssFeedChannel $channel)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_type ()
  returns GType
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_update_interval (GrssFeedChannel $channel)
  returns gint
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_update_time (GrssFeedChannel $channel)
  returns time_t
  is native(grss)
  is export
{ * }

sub grss_feed_channel_get_webmaster (GrssFeedChannel $channel)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feed_channel_new ()
  returns GrssFeedChannel
  is native(grss)
  is export
{ * }

sub grss_feed_channel_new_from_file (Str $path, CArray[Pointer[GError]] $error)
  returns GrssFeedChannel
  is native(grss)
  is export
{ * }

sub grss_feed_channel_new_from_memory (
  Str                     $data,
  CArray[Pointer[GError]] $error
)
  returns GrssFeedChannel
  is native(grss)
  is export
{ * }

sub grss_feed_channel_new_from_xml (
  xmlDocPtr               $doc,
  CArray[Pointer[GError]] $error
)
  returns GrssFeedChannel
  is native(grss)
  is export
{ * }

sub grss_feed_channel_new_with_source (Str $source)
  returns GrssFeedChannel
  is native(grss)
  is export
{ * }

sub grss_feed_channel_set_category (GrssFeedChannel $channel, Str $category)
  is native(grss)
  is export
{ * }

sub grss_feed_channel_set_copyright (GrssFeedChannel $channel, Str $copyright)
  is native(grss)
  is export
{ * }

sub grss_feed_channel_set_description (
  GrssFeedChannel $channel,
  Str             $description
)
  is native(grss)
  is export
{ * }

sub grss_feed_channel_set_editor (GrssFeedChannel $channel, GrssPerson $editor)
  is native(grss)
  is export
{ * }

sub grss_feed_channel_set_format (GrssFeedChannel $channel, Str $format)
  is native(grss)
  is export
{ * }

sub grss_feed_channel_set_generator (GrssFeedChannel $channel, Str $generator)
  is native(grss)
  is export
{ * }

sub grss_feed_channel_set_gzip_compression (
  GrssFeedChannel $channel,
  gboolean        $value
)
  is native(grss)
  is export
{ * }

sub grss_feed_channel_set_homepage (GrssFeedChannel $channel, Str $homepage)
  returns uint32
  is native(grss)
  is export
{ * }

sub grss_feed_channel_set_icon (GrssFeedChannel $channel, Str $icon)
  returns uint32
  is native(grss)
  is export
{ * }

sub grss_feed_channel_set_image (GrssFeedChannel $channel, Str $image)
  returns uint32
  is native(grss)
  is export
{ * }

sub grss_feed_channel_set_language (GrssFeedChannel $channel, Str $language)
  is native(grss)
  is export
{ * }

sub grss_feed_channel_set_publish_time (
  GrssFeedChannel $channel,
  time_t          $publish
)
  is native(grss)
  is export
{ * }

sub grss_feed_channel_set_pubsubhub (GrssFeedChannel $channel, Str $hub)
  returns uint32
  is native(grss)
  is export
{ * }

sub grss_feed_channel_set_rsscloud (
  GrssFeedChannel $channel,
  Str             $path,
  Str             $protocol
)
  is native(grss)
  is export
{ * }

sub grss_feed_channel_set_source (GrssFeedChannel $channel, Str $source)
  returns uint32
  is native(grss)
  is export
{ * }

sub grss_feed_channel_set_title (GrssFeedChannel $channel, Str $title)
  is native(grss)
  is export
{ * }

sub grss_feed_channel_set_update_interval (
  GrssFeedChannel $channel,
  gint            $minutes
)
  is native(grss)
  is export
{ * }

sub grss_feed_channel_set_update_time (
  GrssFeedChannel $channel,
  time_t          $update
)
  is native(grss)
  is export
{ * }

sub grss_feed_channel_set_webmaster (GrssFeedChannel $channel, Str $webmaster)
  is native(grss)
  is export
{ * }
