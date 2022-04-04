use v6.c;

unit package GRSS::Raw::Exports;

our @rss-exports is export;

our %exported;

BEGIN {
  @rss-exports = <
    GRSS::Raw::Definitions
    GRSS::Raw::Structs
  >;
}
