use v6.c;

use GRSS::Raw::Types;
use GRSS::Raw::Feeds::Pool;

use GLib::GList;
use SOUP::Session;
use GRSS::Feed::Channel;

our subset GrssFeedsPoolAncestry is export of Mu
  where GrssFeedsPool | GObject;

class GRSS::Feeds::Pool {
  has GrssFeedsPool $!gfp;

  submethod BUILD ( :$grss-feed-pool ) {
    self.setGrssFeedsPool($grss-feed-pool) if $grss-feed-pool;
  }

  method setGrssFeedsPool (GrssFeedsPoolAncestry $_) {
    my $to-parent;

    $!gfp = do {
      when GrssFeedsPool {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GrssFeedsPool, $_);
      }
    }
  }

  method GRSS::Raw::Structs::GrssFeedsPool
  { $!gfp }

  multi method new (GrssFeedsPoolAncestry $grss-feed-pool, :$ref = True) {
    return Nil unless $grss-feed-pool;

    my $o = self.bless( :$grss-feed-pool );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $grss-feed-pool = grss_feeds_pool_new();

    $grss-feed-pool ?? self.bless( :$grss-feed-pool ) !! Nil;
  }

  method get_listened ( :$raw = False, :$glist = False ) {
    returnGList(
      grss_feeds_pool_get_listened($!gfp),
      $raw,
      $glist,
      |GRSS::Feeds::Channel.getTypePair
    )
  }

  method get_listened_num {
    grss_feeds_pool_get_listened_num($!gfp);
  }

  method get_session ( :$raw = False ) {
    propReturnObject(
      grss_feeds_pool_get_session($!gfp),
      $raw,
      |SOUP::Session.getTypePair
    );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &grss_feeds_pool_get_type, $n, $t );
  }

  method listen (GList() $feeds) {
    grss_feeds_pool_listen($!gfp, $feeds);
  }

  method switch (Int() $run) {
    my gboolean $r = $run.so.Int;

    grss_feeds_pool_switch($!gfp, $r);
  }

}
