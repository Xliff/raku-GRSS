use v6.c;

use NativeCall;

use GLib::Raw::Definitions;

use GLib::Roles::Pointers;

unit package GRSS::Raw::Definitions;

constant grss is export = 'grss',v0;

class GrssPerson is repr<CPointer> is export does GLib::Roles::Pointers { }

constant FeedSubscriptionStatus is export := guint32;
our enum FeedSubscriptionStatusEnum is export <
  FEED_SUBSCRIPTION_IDLE
  FEED_SUBSCRIPTION_SUBSCRIBING
  FEED_SUBSCRIPTION_SUBSCRIBED
  FEED_SUBSCRIPTION_UNSUBSCRIBING
>;
