use v6.c;

use NativeCall;

use GLib::Raw::Traits;
use GRSS::Raw::Types;
use GRSS::Raw::Feed::Enclosure;

use GIO::Roles::GFile;
use GLib::Roles::Object;

our subset GrssFeedEnclosureAncestry is export of Mu
  where GrssFeedEnclosure | GObject;

class GRSS::Feed::Enclosure {
  also does GLib::Roles::Object;

  has GrssFeedEnclosure $!gfe is implementor;

  method setGrssFeedEnclosure (GrssFeedEnclosureAncestry $_) {
    my $to-parent;

    $!gfe = do {
      when GrssFeedEnclosure {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GrssFeedEnclosure, $_);
      }
    }
    self!setObject($to-parent);
  }

  method GRSS::Raw::Structs::GrssFeedEnclosure
  { $!gfe }

  multi method new (GrssFeedEnclosureAncestry $grss-feed-enclosure, :$ref = True) {
    return Nil unless $grss-feed-enclosure;

    my $o = self.bless( :$grss-feed-enclosure );
    $o.ref if $ref;
    $o;
  }
  multi method new (Str() $url) {
    my $gss-feed-enclosure = grss_feed_enclosure_new($url);

    $gss-feed-enclosure ?? self.bless( :$gss-feed-enclosure ) !! Nil;
  }

  method format is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_format    },
      STORE => -> $, \v { self.set_format(v) }
  }

  method length is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_length    },
      STORE => -> $, \v { self.set_length(v) }
  }

  method fetch (CArray[Pointer[GError]] $error = gerror, :$raw = False) {
    clear_error;
    my $f = grss_feed_enclosure_fetch($!gfe, $error);
    set_error($error);

    propReturnObject($f, $raw, |GIO::GFile.getTypePair);
  }

  method fetch_async (&callback, gpointer $user_data = gpointer) {
    grss_feed_enclosure_fetch_async($!gfe, &callback, $user_data);
  }

  method fetch_finish (
    GAsyncResult()                    $res,
    CArray[Pointer[GError]]           $error = gerror,
                                     :$raw   = False
  ) {
    clear_error;
    my $f = grss_feed_enclosure_fetch_finish($!gfe, $res, $error);
    set_error($error);

    propReturnObject($f, $raw, |GIO::GFile.getTypePair);
  }

  method get_format {
    grss_feed_enclosure_get_format($!gfe);
  }

  method get_length {
    grss_feed_enclosure_get_length($!gfe);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &grss_feed_enclosure_get_type, $n, $t );
  }

  method get_url {
    grss_feed_enclosure_get_url($!gfe);
  }

  method set_format (Str() $type) {
    grss_feed_enclosure_set_format($!gfe, $type);
  }

  method set_length (Int() $length) {
    my gsize $l = $length;

    grss_feed_enclosure_set_length($!gfe, $l);
  }

}
