package Tech;

use strict;
use warnings;

sub new {
	my( $class, %extra ) =  @_;

	my $values =  {
		speed => undef,
		x     => 8,
		y     => 2,
		%extra,
	};

	my $tech =  bless $values, ( ref $class || $class );

	return $tech;
}


sub move {
	my( $tech, $dx, $dy ) =  @_;

	my $success;

	$tech->{ 'x' } +=  $dx;
	$tech->{ 'y' } +=  $dy;

	$success =  1;
	return $success;
}


sub search {
	my( $tech ) =  @_;
	return $tech->@{ "x", "y" }; 
}


sub fire {
	my( $tech, $x, $y, $tech2 ) =  @_;                      # INIT

	$tech->ammo_indicator()   or return;
	
	$tech->consume_ammo();

	my $success;
	if( $x == $tech2->{ x }  &&  $y == $tech2->{ y } ) {
		$success =  1;
	}

	return $success;
}



sub fire_with_comments {
	my( $tech, $x, $y, $tech2 ) =  @_;                      # INIT

	my $success =  $tech->fire( $x, $y, $tech2 );

	if( $success ) {
		return 'target_destroyed';
	}
	else {
		return 'promazal';
	}
}



sub fire_and_print {
	my( $tech, $x, $y, $tech2 ) =  @_;                      # INIT

	my $success =  $tech->fire( $x, $y, $tech2 );

	if( $success ) {
		print 'target_destroyed', "\n";
	}
	else {
		print 'promazal', "\n";
	}
}



sub position {
	my( $tech ) =  @_;
	return $tech->@{ "x", "y" };
}


sub ammo_indicator {
	my( $tech ) =  @_;
	return $tech->{ 'ammo' };
}



sub consume_ammo {
	my( $tech ) =  @_;

	$tech->{ ammo }--;
	
	return $tech->{ ammo };
}



sub track {
		my( $tech, $dx, $dy ) =  @_;
		
		my $track =  ( $dx**2 + $dy**2 )**0.5;
		
		return $track;
}


1;