use v6.c;

use GRSS::Raw::Types;
use GRSS::Raw::Feeds::Group::Handler;

role GRSS::Roles::Feeds::Group::Handler {
  has GrssFeedsGroupHandler $!gfgh;

  method check_format (xmlDoc() $doc, xmlNode() $cur) {
    so grss_feeds_group_handler_check_format($!gfh, $doc, $cur);
  }

  method dump (
    GList()                 $channels,
    CArray[Pointer[GError]] $error     = gerror
  ) {
    clear_error;
    my $d = grss_feeds_group_handler_dump($!gfh, $channels, $error);
    set_error($error);
    $d;
  }

  method get_name {
    grss_feeds_group_handler_get_name($!gfh);
  }

  method feeds_group-handler_get_type {
    state ($n, $t);

    unstable_get_type(
      ::?CLASS.^name,
      &grss_feeds_group_handler_get_type,
      $n,
      $t
    );
  }

  # GList type: GRSS::Feed::Channel
  method parse (
    xmlDoc()                 $doc,
    CArray[Pointer[GError]]  $error = gerror,
                            :$raw   = False,
                            :$glist = False
  ) {
    returnGList(
      grss_feeds_group_handler_parse($!gfh, $doc, $error),
      $raw,
      $glist,
      |GRSS::Feed::Channel.getTypePair
    );
  }

}
