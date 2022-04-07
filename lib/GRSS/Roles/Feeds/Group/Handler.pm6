use v6.c;

use NativeCall;

use LibXML::Raw;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GRSS::Raw::Definitions;

unit package GRSS::Raw::Feeds::Group::Handler;

### /usr/src/libgrss-0.7.0/src/feeds-group-handler.h

sub grss_feeds_group_handler_check_format (
  GrssFeedsGroupHandler $self,
  xmlDoc                $doc,
  xmlNode               $cur
)
  returns uint32
  is native(grss)
  is export
{ * }

sub grss_feeds_group_handler_dump (
  GrssFeedsGroupHandler   $self,
  GList                   $channels,
  CArray[Pointer[GError]] $error
)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feeds_group_handler_get_name (GrssFeedsGroupHandler $self)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_feeds_group_handler_get_type ()
  returns GType
  is native(grss)
  is export
{ * }

sub grss_feeds_group_handler_parse (
  GrssFeedsGroupHandler   $self,
  xmlDoc                  $doc,
  CArray[Pointer[GError]] $error
)
  returns GList
  is native(grss)
  is export
{ * }
