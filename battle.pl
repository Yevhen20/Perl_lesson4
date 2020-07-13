use strict;
use warnings;

use Bron;
use Tank;
use Heli;

my $tank1 =  Tank->new( x =>   10,          ammo => 22 );   
my $tank2 =  Tank->new( x =>  100, y =>  50 );
my $tank3 =  Tank->new( x => 1000, y => 500 ); 
	
my $bron1 =  Bron->new( x =>    5, y =>   5 );
my $bron2 =  Bron->new( x =>   15, y =>  15 );
my $bron3 =  Bron->new( x =>   25, y =>  25 );

my $heli1 =  Heli->new( x =>  200, y => 200 );
my $heli2 =  Heli->new( x =>  200, y => 210 );
my $heli3 =  Heli->new( x =>  200, y => 220 );

# print ref $tank1, ref $bron1;

my $tank_d =  $tank1->new( x=> 5, y => 7 );

# my @mass = ( $tank1, $bron2, $heli3 );
# for my $item ( @mass ) {
# 	$item->new();
# }

# print $tank1;
# __END__


print "_" x20, "\n";
print " let's use tanks ", "\n";
print "_" x20, "\n";

print $tank1->position(), "\n";
$tank1->move( 3, 3 );
print $tank1->position(), "\n";

print $tank2->position(), "\n";
$tank2->move( 3, 3 );
print $tank2->position(), "\n";

print $tank3->position(), "\n";

my $success =  $tank1->fire( 1000, 500, $tank3 );
print $success, "\n";

$tank1->fire_and_print( 1000, 500, $tank3 );

$success =  $tank1->fire_with_comments( 100, 50, $tank2 );
print $success, "\n";

print "ammo left: ", $tank1->ammo_indicator(), "\n";

print "_" x20, "\n";
print " let's use brons ", "\n";
print "_" x20, "\n";

print $bron1->position(), "\n";
$bron1->move( 100, 100 );
print $bron1->position(), "\n";

print $bron2->flamethrower( 105, 105, $bron1 ), "\n";

print " mixture left: ", $bron2->burn_mixture_indicator(), "\n"; 

print $bron1->transfer( 10 ), "\n";

print "_" x20, "\n";
print " let's use helicopters ", "\n";
print "_" x20, "\n";

print $heli1->takeoff( 3 ),"\n";             #podnyalis na 3 km
print $heli2->takeoff( 12 ),"\n";            #podnimalis na 12 km, no koncilos toplivo
print $heli3->takeoff( 9.5 ),"\n";           #podnyalis na 9.5 km 

print $heli1->move( 2, 3 ),"\n";             #letim_vpered

print $heli1->show_altitude(),"\n";          #pokazhi vysotu

print $heli1->landing( ),"\n";               #hvatilo topliva dlya prizemlenia
print $heli3->landing( ),"\n";               # ne hvatilo topliva dlya prizemlenia


__END__


