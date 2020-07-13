use strict;
use warnings;

use Streams;

my @k =  ( 1, 33, 45, 55 );
my @l =  ( 3, 24, 34, 60 );
my @m =  ( 2, 17, 50, 90 );
my @n =  ( 4, 5, 6 );
my @p =  ( 7, 8 );


my @result =  Streams::merge ( \@k, \@l, \@m, \@n, \@p );
print " @result ";

__END__








