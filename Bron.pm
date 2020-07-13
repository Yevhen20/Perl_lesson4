package Bron;


use strict;
use warnings;

use base 'Tech';

sub new {
	my( $class, %extra ) =  @_;

	my $values =  {
		armor        =>     3,
		ammo         =>   100,
		burn_mixture =>    10,
		team         =>    12,
		%extra,
	};
	
	my $bron =  $class->SUPER::new( %$values );

	return $bron;
}


sub flamethrower {
	my( $bron, $x, $y, $bron2 ) =  @_;	

	$bron->burn_mixture_indicator()   or return;

	$bron->do_burn(); #$bron->{ burn_mixture }--; $bron->some_action;

	# Bron::do_burn( $bron )
	# $bron->do_burn()

	my $success;
	if( $x == $bron2->{ x }  &&  $y == $bron2->{ y } ) {
		$success =  1;
	}

	return $success;
}


sub do_burn {
	my( $bron ) =  @_;

	$bron->{ burn_mixture }--;
	# $bron->some_action;
	return $bron->{ burn_mixture };
}


sub transfer {
	my ( $bron, $soldiers ) =  @_;
	my $success;
	if( $soldiers <= $bron->{ team } ) {
		print  " soldiers_delivered ";	
		$success =  1;
		return $success;
	}
	else {
		print  " too_much_people ";
		$success =  0;
		return $success;
	}
}

sub burn_mixture_indicator {
	my( $bron ) =  @_;
	return $bron->{ burn_mixture };  
}


1;