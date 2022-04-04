use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use GRSS::Raw::Types;
use GRSS::Raw::Feed::Item;

use GLib::GList;
use GRSS::Person;
use GRSS::Feed::Channel;
use GRSS::Feed::Enclosure;

use GLib::Roles::Object;

our subset GrssFeedItemAncestry is export of Mu
  where GrssFeedItem | GObject;

class GRSS::Feed::Item {
  also does GLib::Roles::Object;

  has GrssFeedItem $!gfi is implementor;

  submethod BUILD ( :$grss-feed-item ) {
    self.setGrssFeedItem($grss-feed-item) if $grss-feed-item
  }

  method setGrssFeedItem (GrssFeedItemAncestry $_) {
    my $to-parent;

    $!gfi= do {
      when GrssFeedItem {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GrssFeedItem, $_);
      }
    }
    self!setObject($to-parent);
  }

  method GRSS::Raw::Structs::GrssFeedItem
    is also<GrssFeedItem>
  { $!gfi }

  proto method new (|)
  { * }

  multi method new (GrssFeedItemAncestry $grss-feed-item, :$ref = True) {
    return Nil unless $grss-feed-item;

    my $o = self.bless( :$grss-feed-item );
    $o.ref if $ref;
    $o;
  }
  multi method new (GrssFeedChannel $parent) {
    my $grss-feed-item = grss_feed_item_new($parent);

    $grss-feed-item ?? self.bless( :$grss-feed-item ) !! Nil;
  }


  method author is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_author    },
      STORE => -> $, \v { self.set_author(v) }
  }

  method comments_url is rw is g-property is also<comments-url> {
    Proxy.new:
      FETCH => -> $     { self.get_comments_url    },
      STORE => -> $, \v { self.set_comments_url(v) }
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

  # Set takes two arguments.
  # method geo_point is rw is g-property {
  #   Proxy.new:
  #     FETCH => -> $     { self.get_geo_point    },
  #     STORE => -> $, \v { self.set_geo_point(v) }
  # }

  method id is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_id    },
      STORE => -> $, \v { self.set_id(v) }
  }

  method publish_time is rw is g-property is also<publish-time> {
    Proxy.new:
      FETCH => -> $     { self.get_publish_time    },
      STORE => -> $, \v { self.set_publish_time(v) }
  }

  # Takes 2 arguments for set.
  # method real_source is rw is g-property {
  #   Proxy.new:
  #     FETCH => -> $     { self.get_real_source    },
  #     STORE => -> $, \v { self.set_real_source(v) }
  # }

  method related is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_related    },
      STORE => -> $, \v { self.set_related(v) }
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

  method add_category (Str() $category) is also<add-category> {
    grss_feed_item_add_category($!gfi, $category);
  }

  method add_contributor (GrssPerson() $contributor) is also<add-contributor> {
    grss_feed_item_add_contributor($!gfi, $contributor);
  }

  method add_enclosure (GrssFeedEnclosure() $enclosure) is also<add-enclosure> {
    grss_feed_item_add_enclosure($!gfi, $enclosure);
  }

  method get_author ( :$raw = False ) is also<get-author> {
    propReturnObject(
      grss_feed_item_get_author($!gfi),
      $raw,
      |GRSS::Person
    );
  }

  method get_categories ( :$glist = False ) is also<get-categories> {
    returnGList(
      grss_feed_item_get_categories($!gfi),
      True,
      $glist,
      Str
    )
  }

  method get_comments_url is also<get-comments-url> {
    grss_feed_item_get_comments_url($!gfi);
  }

  method get_contributors ( :$raw = False, :$glist = False )
    is also<get-contributors>
  {
    returnGList(
      grss_feed_item_get_contributors($!gfi),
      $raw,
      $glist,
      |GRSS::Person.getTypePair
    );
  }

  method get_copyright is also<get-copyright> {
    grss_feed_item_get_copyright($!gfi);
  }

  method get_description is also<get-description> {
    grss_feed_item_get_description($!gfi);
  }

  method get_enclosures ( :$raw = False, :$glist = False )
    is also<get-enclosures>
  {
    returnGList(
      grss_feed_item_get_enclosures($!gfi),
      $raw,
      $glist,
      |GRSS::Feed::Enclosure.getTypePair
    )
  }

  proto method get_geo_point(|)
  { * }

  multi method get_geo_point is also<get-geo-point> {
    samewith($, $);
  }
  multi method get_geo_point ($latitude is rw, $longitude is rw) {
    my gdouble ($lat, $lon) = 0e0 xx 2;

    my $rv = grss_feed_item_get_geo_point($!gfi, $lat, $lon);
    ($latitude, $longitude) = ($lat, $lon);
    $rv ?? ($latitude, $longitude) !! Nil;
  }

  method get_id is also<get-id> {
    grss_feed_item_get_id($!gfi);
  }

  method get_parent ( :$raw = False ) is also<get-parent> {
    propReturnObject(
      grss_feed_item_get_parent($!gfi),
      $raw,
      |GRSS::Feed::Channel.getTypePair
    );
  }

  method get_publish_time ( :$raw = False ) is also<get-publish-time> {
    my $t = grss_feed_item_get_publish_time($!gfi);
    return $t if $raw;
    DateTime.new($t);
  }

  proto method get_real_source (|)
    is also<get-real-source>
  { * }

  multi method get_real_source {
    samewith($, $);
  }
  multi method get_real_source ($realsource is rw, $title is rw) {
    my ($r, $t) = newCArray(Str) xx 2;
    my $rv      = samewith($r, $t);

    ($realsource, $title) = ($r, $t);
    $rv ?? ($realsource, $title) !! Nil;
  }
  multi method get_real_source (CArray[Str] $realsource, CArray[Str] $title) {
    so grss_feed_item_get_real_source($!gfi, $realsource, $title);
  }

  method get_related is also<get-related> {
    grss_feed_item_get_related($!gfi);
  }

  method get_source is also<get-source> {
    grss_feed_item_get_source($!gfi);
  }

  method get_title is also<get-title> {
    grss_feed_item_get_title($!gfi);
  }

  method get_type is also<get-type> {
    state ($n,$t);

    unstable_get_type( self.^name, &grss_feed_item_get_type, $n, $t );
  }

  method set_author (GrssPerson() $author) is also<set-author> {
    grss_feed_item_set_author($!gfi, $author);
  }

  method set_comments_url (Str() $url) is also<set-comments-url> {
    grss_feed_item_set_comments_url($!gfi, $url);
  }

  method set_copyright (Str() $copyright) is also<set-copyright> {
    grss_feed_item_set_copyright($!gfi, $copyright);
  }

  method set_description (Str() $description) is also<set-description> {
    grss_feed_item_set_description($!gfi, $description);
  }

  method set_geo_point (Num() $latitude, Num() $longitude)
    is also<set-geo-point>
  {
    my gdouble ($l1, $l2) = ($latitude, $longitude);

    grss_feed_item_set_geo_point($!gfi, $l1, $l2);
  }

  method set_id (Str() $id) is also<set-id> {
    grss_feed_item_set_id($!gfi, $id);
  }

  method set_publish_time (Int() $publish) is also<set-publish-time> {
    my time_t $p = $publish;

    grss_feed_item_set_publish_time($!gfi, $p);
  }

  method set_real_source (Str() $realsource, Str() $title)
    is also<set-real-source>
  {
    grss_feed_item_set_real_source($!gfi, $realsource, $title);
  }

  method set_related (Str() $related) is also<set-related> {
    grss_feed_item_set_related($!gfi, $related);
  }

  method set_source (Str() $source) is also<set-source> {
    grss_feed_item_set_source($!gfi, $source);
  }

  method set_title (Str() $title) is also<set-title> {
    grss_feed_item_set_title($!gfi, $title);
  }

}
