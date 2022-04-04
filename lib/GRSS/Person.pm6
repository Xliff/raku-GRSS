use v6.c;

use GRSS::Raw::Types;
use GRSS::Raw::Person;

use GLib::Roles::Implementor;

# BOXED
class GRSS::Person {
  also does GLib::Roles::Implementor;

  has GrssPerson $!gp is implementor;

  submethod BUILD ( :$grss-person ) {
    $!gp = $grss-person;
  }

  method new (Str() $name, Str() $email, Str() $uri) {
    my $grss-person = grss_person_new($name, $email, $uri);

    $grss-person ?? self.bless( :$grss-person ) !! Nil;
  }

  method get_email {
    grss_person_get_email($!gp);
  }

  method get_name {
    grss_person_get_name($!gp);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &grss_person_get_type, $n, $t );
  }

  method get_uri {
    grss_person_get_uri($!gp);
  }

  method ref {
    grss_person_ref($!gp);
    self;
  }

  method unref {
    grss_person_unref($!gp);
  }

}
