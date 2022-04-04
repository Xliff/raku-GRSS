use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Object;
use GRSS::Raw::Definitions;

use GLib::Roles::Pointers;

unit package GRSS::Raw::Structs;

class FeedAtomHandler is repr<CStruct> does GLib::Roles::Pointers is export {
	has GObject                $!parent;
	has Pointer                $!priv  ;
}

class FeedPieHandler is repr<CStruct> does GLib::Roles::Pointers is export {
	has GObject               $!parent;
	has Pointer               $!priv  ;
}

class FeedRssHandler is repr<CStruct> does GLib::Roles::Pointers is export {
	has GObject               $!parent;
	has Pointer               $!priv  ;
}

class FeedsOpmlGroupHandler is repr<CStruct> does GLib::Roles::Pointers is export {
	has GObject          $!parent;
	has Pointer          $!priv  ;
}

class FeedsXbelGroupHandler is repr<CStruct> does GLib::Roles::Pointers is export {
	has GObject          $!parent;
	has Pointer          $!priv  ;
}

class FeedsXoxoGroupHandler is repr<CStruct> does GLib::Roles::Pointers is export {
	has GObject          $!parent;
	has Pointer          $!priv  ;
}

class GrssFeedFormatter is repr<CStruct> does GLib::Roles::Pointers is export {
	has GObject          $!parent;
	has Pointer          $!priv  ;
}

class GrssFeedAtomFormatter is repr<CStruct> does GLib::Roles::Pointers is export {
	has GrssFeedFormatter $!parent;
}

class GrssFeedChannel is repr<CStruct> does GLib::Roles::Pointers is export {
	has GObject          $!parent;
	has Pointer          $!priv  ;
}

class GrssFeedEnclosure is repr<CStruct> does GLib::Roles::Pointers is export {
	has GObject          $!parent;
	has Pointer          $!priv  ;
}

class GrssFeedItem is repr<CStruct> does GLib::Roles::Pointers is export {
	has GObject          $!parent;
	has Pointer          $!priv  ;
}

class GrssFeedParser is repr<CStruct> does GLib::Roles::Pointers is export {
	has GObject          $!parent;
	has Pointer          $!priv  ;
}

class GrssFeedRssFormatter is repr<CStruct> does GLib::Roles::Pointers is export {
	has GrssFeedFormatter $!parent;
}

class GrssFeedsGroup is repr<CStruct> does GLib::Roles::Pointers is export {
	has GObject          $!parent;
	has Pointer          $!priv  ;
}

class GrssFeedsPool is repr<CStruct> does GLib::Roles::Pointers is export {
	has GObject          $!parent;
	has Pointer          $!priv  ;
}

class GrssFeedsPublisher is repr<CStruct> does GLib::Roles::Pointers is export {
	has GObject          $!parent;
	has Pointer          $!priv  ;
}

class GrssFeedsPubsubhubbubSubscriber is repr<CStruct> does GLib::Roles::Pointers is export {
	has GObject          $!parent;
	has Pointer          $!priv  ;
}

class GrssFeedsRsscloudSubscriber is repr<CStruct> does GLib::Roles::Pointers is export {
	has GObject          $!parent;
	has Pointer          $!priv  ;
}

class GrssFeedsStore is repr<CStruct> does GLib::Roles::Pointers is export {
	has GObject          $!parent;
	has Pointer          $!priv  ;
}

class GrssFeedsSubscriber is repr<CStruct> does GLib::Roles::Pointers is export {
	has GObject          $!parent;
	has Pointer          $!priv  ;
}

class NSHandler is repr<CStruct> does GLib::Roles::Pointers is export {
	has GObject          $!parent;
	has Pointer          $!priv  ;
}
