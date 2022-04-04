use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GRSS::Raw::Definitions;
use GRSS::Raw::Structs;

unit package GRSS::Raw::Person;

### /usr/src/libgrss-0.7.0/src/person.h

sub grss_person_get_email (GrssPerson $person)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_person_get_name (GrssPerson $person)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_person_get_type ()
  returns GType
  is native(grss)
  is export
{ * }

sub grss_person_get_uri (GrssPerson $person)
  returns Str
  is native(grss)
  is export
{ * }

sub grss_person_new (Str $name, Str $email, Str $uri)
  returns GrssPerson
  is native(grss)
  is export
{ * }

sub grss_person_ref (GrssPerson $person)
  returns GrssPerson
  is native(grss)
  is export
{ * }

sub grss_person_unref (GrssPerson $person)
  is native(grss)
  is export
{ * }
