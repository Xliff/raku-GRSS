use v6.c;

use NativeCall;

use GLib::Raw::Traits;
use GRSS::Raw::Types;

use GLib::GList;

use GLib::Roles::Object;

our subset GrssFeedAtomFormatterAncestry is export of Mu
  where GrssFeedAtomFormatter | GObject;

class GRSS::Feed::Formatter::Atom {
  also does GLib::Roles::Object;

  has GrssFeedAtomFormatter $!gffa is implementor;

  submethod BUILD ( :$grss-feed-formatter-atom ) {
    self.setGrssFeedAtomFormatter($grss-feed-formatter-atom) if $grss-feed-formatter-atom;
  }

  method setGrssFeedAtomFormatter (GrssFeedAtomFormatterAncestry $_) {
    my $to-parent;

    $!gffa = do {
      when GrssFeedAtomFormatter {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GrssFeedAtomFormatter, $_);
      }
    }
  }

  multi method new (GrssFeedAtomFormatterAncestry $grss-feed-formatter-atom, :$ref = True) {
    return Nil unless $grss-feed-formatter-atom;

    my $o = self.bless( :$grss-feed-formatter-atom );
    $o.ref if $ref;
    $o;
  }
  multi method new {
	my $grss-feed-formatter-atom = grss_feed_atom_formatter_new;

	$grss-feed-formatter-atom ?? self.bless( :$grss-feed-formatter-atom ) !! Nil 
  }

  method GRSS::Raw::Structs::GrssFeedAtomFormatter
  { $!gffa }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &grss_feed_atom_formatter_get_type, $n, $t );
  }

}

sub grss_feed_atom_formatter_new ()
	returns GrssFeedAtomFormatter
	is export
	is native(grss)
{ * }

sub grss_feed_atom_formatter_get_type ()
	returns GType
	is export
	is native(grss)
{ * }
