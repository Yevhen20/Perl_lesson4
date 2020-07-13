package Tank;

use strict;
use warnings;

use base 'Tech'; # push @ISA, 'Tech';

sub new {
	my( $class, %extra ) =  @_;

	my $values =  {
		armor => 7,
		ammo  => 3,
		%extra,
	};

	my $tank =  $class->SUPER::new( %$values ); # $values->%*

	return $tank;
}


1;