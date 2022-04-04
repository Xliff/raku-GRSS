use v6.c;

use NativeCall;

use LibXML::Raw;

use GLib::Raw::Traits;
use GRSS::Raw::Types;
use GRSS::Raw::Feed::Channel;

use GLib::GList;
use GLib::GSList;

use GLib::Roles::Object;

our subset GrssFeedChannelAncestry is export of Mu
  where GrssFeedChannel | GObject;

class GRSS::Feed::Channel {
  also does GLib::Roles::Object;

  has GrssFeedChannel $!gfc is implementor;

  submethod BUILD ( :$grss-feed-channel ) {
    self.setGrssFeedChannel($grss-feed-channel) if $grss-feed-channel
  }

  method setGrssFeedChannel (GrssFeedChannelAncestry $_) {
    my $to-parent;

    $!gfc = do {
      when GrssFeedChannel {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GrssFeedChannel, $_);
      }
    }
    self!setObject($to-parent);
  }

  method GRSS::Raw::Structs::GrssFeedChannel
  { $!gfc }

  multi method new (GrssFeedChannelAncestry $grss-feed-channel, :$ref = True) {
    return Nil unless $grss-feed-channel;

    my $o = self.bless( :$grss-feed-channel );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $grss-feed-channel = grss_feed_channel_new();

    $grss-feed-channel ?? self.bless( :$grss-feed-channel ) !! Nil;
  }

  method new_from_file (
    Str()                   $path,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $grss-feed-channel = grss_feed_channel_new_from_file($path, $error);
    set_error($error);

    $grss-feed-channel ?? self.bless( :$grss-feed-channel ) !! Nil;
  }

  proto method new_from_memory (|)
  { * }

  multi method new_from_memory (
    Str                      $data,
    CArray[Pointer[GError]]  $error    = gerror,
                            :$encoding = 'utf8'
  ) {
    samewith( $data.encode($encoding), $error );
  }
  multi method new_from_memory (
    Buf                     $data,
    CArray[Pointer[GError]] $error = gerror
  ) {
    samewith( CArray[uint8].new($data), $error );
  }
  multi method new_from_memory (
    CArray[uint8]           $data,
    CArray[Pointer[GError]] $error = gerror
  ) {
    samewith( cast(Pointer, $data), $error );
  }
  multi method new_from_memory (
    Pointer                 $data,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $grss-feed-channel = grss_feed_channel_new_from_memory($data, $error);
    set_error($error);

    $grss-feed-channel ?? self.bless( :$grss-feed-channel ) !! Nil;
  }

  method new_from_xml (
    xmlDoc                  $doc,
    CArray[Pointer[GError]] $error = gerror
  ) {
    my $grss-feed-channel = grss_feed_channel_new_from_xml($doc, $error);

    $grss-feed-channel ?? self.bless( :$grss-feed-channel ) !! Nil;
  }

  method new_with_source (Str() $source) {
    my $grss-feed-channel =  grss_feed_channel_new_with_source($!gfc, $source);

    $grss-feed-channel ?? self.bless( :$grss-feed-channel ) !! Nil;
  }

  method category is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_category    },
      STORE => -> $, \v { self.set_category(v) }
  }

  method copyright is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_copyright    },
      STORE => -> $, \v { self.set_copyright(v) }
  }

  method description is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_description    },
      STORE => -> $, \v { self.set_description(v) }
  }

  method editor is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_editor    },
      STORE => -> $, \v { self.set_editor(v) }
  }

  method format is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_format    },
      STORE => -> $, \v { self.set_format(v) }
  }

  method generator is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_generator    },
      STORE => -> $, \v { self.set_generator(v) }
  }

  method gzip_compression is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_gzip_compression    },
      STORE => -> $, \v { self.set_gzip_compression(v) }
  }

  method homepage is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_homepage    },
      STORE => -> $, \v { self.set_homepage(v) }
  }

  method icon is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_icon    },
      STORE => -> $, \v { self.set_icon(v) }
  }

  method image is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_image    },
      STORE => -> $, \v { self.set_image(v) }
  }

  method language is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_language    },
      STORE => -> $, \v { self.set_language(v) }
  }

  method publish_time is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_publish_time    },
      STORE => -> $, \v { self.set_publish_time(v) }
  }

  method pubsubhub is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_pubsubhub    },
      STORE => -> $, \v { self.set_pubsubhub(v) }
  }

  method rsscloud is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_rsscloud    },
      STORE => -> $, \v { self.set_rsscloud(v) }
  }

  method source is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_source    },
      STORE => -> $, \v { self.set_source(v) }
  }

  method title is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_title    },
      STORE => -> $, \v { self.set_title(v) }
  }

  method update_interval is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_update_interval    },
      STORE => -> $, \v { self.set_update_interval(v) }
  }

  method update_time is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_update_time    },
      STORE => -> $, \v { self.set_update_time(v) }
  }

  method webmaster is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_webmaster    },
      STORE => -> $, \v { self.set_webmaster(v) }
  }

  method add_contributor (GrssPerson() $contributor) {
    grss_feed_channel_add_contributor($!gfc, $contributor);
  }

  method add_cookie (SoupCookie() $cookie) {
    grss_feed_channel_add_cookie($!gfc, $cookie);
  }

  method fetch (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $rv = so grss_feed_channel_fetch($!gfc, $error);
    set_error($error);
    $rv;
  }

  method fetch_all (
    CArray[Pointer[GError]]  $error = gerror,
                            :$raw   = False,
                            :$glist = False
  ) {
    clear_error;
    my $l = grss_feed_channel_fetch_all($!gfc, $error);
    set_error($error);

    returnGList($l, $raw, $glist, |::('GRSS::Feed::Item').getTypePair);
  }

  method fetch_all_async (&callback, gpointer $user_data = gpointer) {
    grss_feed_channel_fetch_all_async($!gfc, &callback, $user_data);
  }

  method fetch_all_finish (
    GAsyncResult()           $res,
    CArray[Pointer[GError]]  $error = gerror,
                            :$raw   = False,
                            :$glist = False
  ) {
    clear_error;
    my $l = grss_feed_channel_fetch_all_finish($!gfc, $res, $error);
    set_error($error);

    returnGList($l, $raw, $glist, |GList::Feed::Item.getTypePair);
  }

  method fetch_async (&callback, gpointer $user_data = gpointer) {
    grss_feed_channel_fetch_async($!gfc, &callback, $user_data);
  }

  method fetch_cancel {
    so grss_feed_channel_fetch_cancel($!gfc);
  }

  method fetch_finish (
    GAsyncResult()          $res,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $rv = so grss_feed_channel_fetch_finish($!gfc, $res, $error);
    set_error($error);
    $rv;
  }

  method get_category {
    grss_feed_channel_get_category($!gfc);
  }

  method get_contributors ( :$raw = False, :$glist = False ) {
    returnGList(
      grss_feed_channel_get_contributors($!gfc),
      $raw,
      $glist,
      |GRSS::Person.getTypePair
    )
  }

  method get_cookies ( :$raw = False, :$glist = False ) {
    returnGSList(
      grss_feed_channel_get_cookies($!gfc),
      $raw,
      $glist,
      |SOUP::Cookie.getTypePair
    );
  }

  method get_copyright {
    grss_feed_channel_get_copyright($!gfc);
  }

  method get_description {
    grss_feed_channel_get_description($!gfc);
  }

  method get_editor ( :$raw = False ) {
    propReturnObject(
      grss_feed_channel_get_editor($!gfc),
      $raw,
      |GRSS::Person.getTypePair
    );
  }

  method get_format {
    grss_feed_channel_get_format($!gfc);
  }

  method get_generator {
    grss_feed_channel_get_generator($!gfc);
  }

  method get_gzip_compression {
    so grss_feed_channel_get_gzip_compression($!gfc);
  }

  method get_homepage {
    grss_feed_channel_get_homepage($!gfc);
  }

  method get_icon {
    grss_feed_channel_get_icon($!gfc);
  }

  method get_image {
    grss_feed_channel_get_image($!gfc);
  }

  method get_language {
    grss_feed_channel_get_language($!gfc);
  }

  method get_publish_time ( :$raw = False ) {
    my $t = grss_feed_channel_get_publish_time($!gfc);
    return $t if $raw;
    DateTime.new($t);
  }

  proto method get_pubsubhub (|)
  { * }

  multi method get_pubsubhub {
    samewith($);
  }
  multi method get_pubsubhub ($hub is rw) {
    my $h = newCArray(Str);
    my $rv = samewith($h);
    $hub = $rv ?? ppr($h) !! Nil
  }
  multi method get_pubsubhub (CArray[Str] $hub is rw) {
    so grss_feed_channel_get_pubsubhub($!gfc, $hub);
  }

  proto method get_rsscloud (|)
  { * }

  multi method get_rsscloud {
    samewith($, $);
  }
  multi method get_rsscloud ($path is rw, $protocol is rw) {
    my ($p, $pr) = newCArray(Str) xx 2;
    my $rv = samewith($p, $pr);
    ($path, $protocol) = ( ppr($p), ppr($pr) );
    $rv ?? ($path, $protocol) !! Nil;
  }
  multi method get_rsscloud (CArray[Str] $path, CArray[Str] $protocol) {
    so grss_feed_channel_get_rsscloud($!gfc, $path, $protocol);
  }

  method get_source {
    grss_feed_channel_get_source($!gfc);
  }

  method get_title {
    grss_feed_channel_get_title($!gfc);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &grss_feed_channel_get_type, $n, $t );
  }

  method get_update_interval {
    grss_feed_channel_get_update_interval($!gfc);
  }

  method get_update_time ( :$raw = False ) {
    my $t = grss_feed_channel_get_update_time($!gfc);
    return $t if $raw;
    DateTime.new($t);
  }

  method get_webmaster {
    grss_feed_channel_get_webmaster($!gfc);
  }

  method set_category (Str() $category) {
    so grss_feed_channel_set_category($!gfc, $category);
  }

  method set_copyright (Str() $copyright) {
    so grss_feed_channel_set_copyright($!gfc, $copyright);
  }

  method set_description (Str() $description) {
    so grss_feed_channel_set_description($!gfc, $description);
  }

  method set_editor (GrssPerson() $editor) {
    so grss_feed_channel_set_editor($!gfc, $editor);
  }

  method set_format (Str() $format) {
    so grss_feed_channel_set_format($!gfc, $format);
  }

  method set_generator (Str() $generator) {
    so grss_feed_channel_set_generator($!gfc, $generator);
  }

  method set_gzip_compression (Int() $value) {
    my gboolean $v = $value.so.Int;

    grss_feed_channel_set_gzip_compression($!gfc, $v);
  }

  method set_homepage (Str() $homepage) {
    so grss_feed_channel_set_homepage($!gfc, $homepage);
  }

  method set_icon (Str() $icon) {
    so grss_feed_channel_set_icon($!gfc, $icon);
  }

  method set_image (Str() $image) {
    so grss_feed_channel_set_image($!gfc, $image);
  }

  method set_language (Str() $language) {
    so grss_feed_channel_set_language($!gfc, $language);
  }

  method set_publish_time (Int() $publish) {
    my time_t $p = $publish;

    grss_feed_channel_set_publish_time($!gfc, $p);
  }

  method set_pubsubhub (Str() $hub) {
    so grss_feed_channel_set_pubsubhub($!gfc, $hub);
  }

  method set_rsscloud (Str() $path, Str() $protocol) {
    so grss_feed_channel_set_rsscloud($!gfc, $path, $protocol);
  }

  method set_source (Str() $source) {
    so grss_feed_channel_set_source($!gfc, $source);
  }

  method set_title (Str() $title) {
    so grss_feed_channel_set_title($!gfc, $title);
  }

  method set_update_interval (Int() $minutes) {
    my gint $m = $minutes;

    grss_feed_channel_set_update_interval($!gfc, $m);
  }

  method set_update_time (Int() $update) {
    my time_t $u = $update;

    grss_feed_channel_set_update_time($!gfc, $u);
  }

  method set_webmaster (Str() $webmaster) {
    so grss_feed_channel_set_webmaster($!gfc, $webmaster);
  }

}
