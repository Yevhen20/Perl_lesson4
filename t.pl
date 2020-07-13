use strict;
use warnings;

use Tank;

Tank::move( 3, 5 );
print Tank::show_position(), " \n ";

Tank::move( 3, 5 );
print Tank::show_position(), " \n ";

print Tank::search( 50, 60 ), " \n "; #dannye razvedki priborami tanka

print Tank::fire( 55, 60 ), " \n ";   #ne pravilno pritselilis
print Tank::ammo_indicator(), " \n ";

print Tank::fire( 50, 60 ), " \n ";   #pravilno pritselilis
print Tank::ammo_indicator(), " \n ";

print Tank::search( 120, 98 ), " \n "; #novaya tsel razvedana

print Tank::fire( 121, 98 ), " \n ";   #ne pravilno pritselilis
print Tank::ammo_indicator(), " \n ";

print Tank::fire( 120, 98 ), " \n ";   #pravilno pritselilis, no uzhe konchilis patrony (bylo 3 patrona)
print Tank::ammo_indicator(), " \n ";


__END__