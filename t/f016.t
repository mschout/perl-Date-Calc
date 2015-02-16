#!perl -w

BEGIN { eval { require bytes; }; }
use strict;
no strict "vars";

BEGIN { $Date::Calc::XS_DISABLE = $Date::Calc::XS_DISABLE = 1; }

use Date::Calc qw( Decode_Date_EU Decode_Date_US );

# ======================================================================
#   ($year,$mm,$dd) = Decode_Date_EU($buffer);
#   ($year,$mm,$dd) = Decode_Date_US($buffer);
# ======================================================================

my $Y = 1900 + (localtime)[5] - 45;     # expected year (e.g. 1965 in 2009)
my $y = sprintf("%02d", $Y % 100);      # short year    (e.g. 65)

print "1..25\n";

$n = 1;
if ((($year,$mm,$dd) = Decode_Date_EU("3.1.$y")) &&
($year==$Y)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = Decode_Date_EU("3 1 $y")) &&
($year==$Y)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = Decode_Date_EU("03.01.$y")) &&
($year==$Y)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = Decode_Date_EU("03/01/$y")) &&
($year==$Y)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = Decode_Date_EU("3. Ene $Y",4)) &&
($year==$Y)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = Decode_Date_EU("Geburtstag: 3. Januar '$y in Backnang/Württemberg",3)) &&
($year==$Y)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = Decode_Date_EU("03-Jan-$y")) &&
($year==$Y)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = Decode_Date_EU("3.Jan$Y",6)) &&
($year==$Y)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = Decode_Date_EU("3Jan$y",0)) &&
($year==$Y)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = Decode_Date_EU("0301$y")) &&
($year==$Y)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = Decode_Date_EU("3ja$y")) &&
($year==$Y)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = Decode_Date_EU("31$y")) &&
($year==$Y)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU("28.2.1995")) &&
($year==1995)&&($mm==2)&&($dd==28))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
unless (($year,$mm,$dd) = Decode_Date_EU("29.2.1995"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US("1 3 $y")) &&
($year==$Y)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = Decode_Date_US("01/03/$y")) &&
($year==$Y)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = Decode_Date_US("Jan 3 '$y")) &&
($year==$Y)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = Decode_Date_US("Jan 3 1964")) &&
($year==1964)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = Decode_Date_US("===> January 3rd 1964 (birthday)")) &&
($year==1964)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = Decode_Date_US("Jan31964")) &&
($year==1964)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = Decode_Date_US("Jan3$y")) &&
($year==$Y)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = Decode_Date_US("ja3$y")) &&
($year==$Y)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ((($year,$mm,$dd) = Decode_Date_US("13$y")) &&
($year==$Y)&&($mm==1)&&($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US("2.28.1995")) &&
($year==1995)&&($mm==2)&&($dd==28))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
unless (($year,$mm,$dd) = Decode_Date_US("2.29.1995"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

__END__

