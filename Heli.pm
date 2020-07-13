package Heli;

use strict;
use warnings;

use base 'Tech';

sub new {
	my( $class, %extra ) =  @_;

	my $values =  {
		armor                 =>     1,
		ammo                  =>    10,
		altitude              => undef,
		fuel                  =>  1000,
		fuel_waste_up         =>   100,
		fuel_waste_down       =>    10,
		fuel_waste_horizontal =>    15,
		%extra,
	};
	
	my $heli =  $class->SUPER::new( %$values );

	return $heli;
}


sub takeoff {
	my ( $heli, $altitude ) =  @_;
	
	$heli->{ fuel } -=  $altitude * $heli->{ fuel_waste_up };
	
	if( $heli->{ fuel } > 0) {
		$heli->{ altitude } = $altitude;
		print " Heli_altitude= ";
		return $heli->{ altitude };
	}
	else {
		$heli->{ altitude } =  0;
		print " Crashed ";
		return  $heli->{ altitude };
	}
}


sub landing {
	my ( $heli ) =  @_;
	$heli->{ fuel} -=   $heli->{ altitude } *  $heli->{ fuel_waste_down } ;
	$heli->{ altitude } =  0;
	
	if( $heli->{ fuel} >= 0 ) {
		print " OK_have_landed ";
		return  $heli->{ altitude };
	}
	else {
		print " Crashed ";
		return  $heli->{ altitude }; 
	}
}


sub move {
	my( $heli, $dx, $dy ) =  @_;

	$heli->{ 'x' } +=  $dx;
	$heli->{ 'y' } +=  $dy;
	$heli->{ fuel }  -=  $heli->track( $dx, $dy ) * $heli->{ fuel_waste_horizontal };
	
	if( $heli->{ fuel } > 0 ) {
		print  " Heli_on_point ";
		return $heli->{ 'x' }, $heli->{ 'y' };
	}
	else {
		if( $heli->{ altitude } > 0 ) {
			print  " Heli_crush!!! ";
			$heli->{ 'x' } =  0;
			$heli->{ 'y' } =  0;
			return $heli->{ 'x' }, $heli->{ 'y' };
		}
		else {
			print  " No_more_fuel_heli_on_ground ";
			$heli->{ 'x' } -=  $dx;
			$heli->{ 'y' } -=  $dy;
			return $heli->{ 'x' }, $heli->{ 'y' };
		}

	}
	
}


sub show_altitude {
	my ( $heli ) =  @_;
	return $heli->{ altitude };
}



1;