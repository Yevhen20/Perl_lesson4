use strict;
use warnings;

use Bron;
use Tank;

Tank::move( 3, 4 );
print Tank::show_position(), "\n";
Bron::move( 8, 15 );
print Bron::show_position(), " \n ";

Bron::move( 10, 10 );
print Bron::show_position(), " \n ";

print Bron::fire( 15, 66 ), " \n ";  			#pushka
print Bron::ammo_indicator(), " \n "; 			#ostalos snaryadov

print Bron::flamethrower( 50, 60 ), " \n ";  	#ognemet
print Bron::burn_mixture_indicator(), " \n ";   #ostalos zazhygatelnoy smesi

print Bron::tansfer( 12 ), " \n "; 				#perevozim soldat


print Bron::fire( Tank::show_position() );

@pos =  Tank::show_position();
$res =  Bron::fire( @pos ); # @_ =  @pos;
print $res;


my $tank1 = {
	armor => 7,
	ammo  => 3,
	speed => undef,
	x     => 8,
	y     => 2,
};

my $tank2 = {
	armor => 7,
	ammo  => 3,
	speed => undef,
	x     => 3,
	y     => 9,
};

Tank::move( $tank1, 3, 3 );
Tank::move( $tank2, 2, 2 );



__END__