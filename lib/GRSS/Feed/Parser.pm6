use v6.c;

use NativeCall;

use GRSS::Raw::Types;

use GLib::GList;

use GLib::Roles::Object;

our subset GrssFeedParserAncestry is export of Mu
  where GrssFeedParser | GObject;

class GRSS::Feed::Parser {
  also does GLib::Roles::Object;

  has GrssFeedParser $!gfp;

  method setGrssFeedParser (GrssFeedParserAncestry $_) {
    my $to-parent;

    $!gfc = do {
      when GrssFeedParser {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GrssFeedParser, $_);
      }
    }
    self!setObject($to-parent);
  }

  method GRSS::Raw::Structs::GrssFeedParser
  { $!gfc }

  multi method new (GrssFeedParserAncestry $grss-feed-parser, :$ref = True) {
    return Nil unless $grss-feed-parser;

    my $o = self.bless( :$grss-feed-parser )
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $grss-feed-parser = grss_feed_parser_new();

    $grss-feed-parser ?? self.bless( :$grss-feed-parser ) !! Nil;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &grss_feed_parser_get_type, $n, $t );
  }

  method parse (
    GrssFeedChannel()        $feed,
    xmlDoc()                 $doc,
    CArray[Pointer[GError]]  $error = gerror
                            :$raw   = False,
                            :$glist = False
  ) {
    clear_error;
    my $l = grss_feed_parser_parse($!gfp, $feed, $doc, $error);
    set_error($error);

    returnGList($l, $raw, $glist, |GRSS::Feed::Item.getTypePair);
  }

  method parse_channel (
    GrssFeedChannel()       $feed,
    xmlDoc()                $doc,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    grss_feed_parser_parse_channel($!gfp, $feed, $doc, $error);
    set_error($error);
  }

}


### /usr/src/libgrss-0.7.0/src/feed-parser.h

sub grss_feed_parser_get_type ()
  returns GType
  is native(grss)
  is export
{ * }

sub grss_feed_parser_new ()
  returns GrssFeedParser
  is native(grss)
  is export
{ * }

sub grss_feed_parser_parse (
  GrssFeedParser          $parser,
  GrssFeedChannel         $feed,
  xmlDoc                  $doc,
  CArray[Pointer[GError]] $error
)
  returns GList
  is native(grss)
  is export
{ * }

sub grss_feed_parser_parse_channel (
  GrssFeedParser          $parser,
  GrssFeedChannel         $feed,
  xmlDoc                  $doc,
  CArray[Pointer[GError]] $error
)
  is native(grss)
  is export
{ * }
