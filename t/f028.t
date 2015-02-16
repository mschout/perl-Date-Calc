#!perl -w

BEGIN { eval { require bytes; }; }
use strict;
no strict "vars";

BEGIN { $Date::Calc::XS_DISABLE = $Date::Calc::XS_DISABLE = 1; }

use Date::Calc qw( Decode_Date_EU2 Language Decode_Language );

# ======================================================================
#   ($year,$mm,$dd) = Decode_Date_EU2($date);
# ======================================================================
my $Y = 1900 + (localtime)[5] - 50;     # wanted year (e.g. 1965)
my $y = sprintf('%02d', $Y % 100);      # short year  (e.g. 65)

print "1..46\n";

$n = 1;
unless (($year,$mm,$dd) = Decode_Date_EU2(""))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = Decode_Date_EU2("__"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = Decode_Date_EU2("_31_"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_314_")) &&
($year==2004) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_0314_")) &&
($year==2004) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_00314_")) &&
($year==2004) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_31${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_031${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_0031${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_301${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_0301${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_00301${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_1103${y}_")) &&
($year==$Y) && ($mm==3) && ($dd==11))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_01103${y}_")) &&
($year==$Y) && ($mm==3) && ($dd==11))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_001103${y}_")) &&
($year==$Y) && ($mm==3) && ($dd==11))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_3011964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_03011964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_003011964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_11031964_")) &&
($year==1964) && ($mm==3) && ($dd==11))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_011031964_")) &&
($year==1964) && ($mm==3) && ($dd==11))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_0011031964_")) &&
($year==1964) && ($mm==3) && ($dd==11))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_3_1_${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_3_1_1964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_3_jan_${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_3_Jan_${y}_",0)) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_3_jAN_${y}_",1)) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_3-JAN-${y}_",2)) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_3-Jan-1964_",3)) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_3-January-1964_",'')) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_000003-Jan-0000${y}_",undef)) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_000003-Jan-001964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_3_ja_${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = Decode_Date_EU2("_3_j_${y}_"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_3ja${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_03ja${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_003ja${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_000003ja0000${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_3ja1964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_03ja1964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_003ja1964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_000003ja001964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = Decode_Date_EU2("_33ja${y}_"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = Decode_Date_EU2("_33ja1964_"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("x000003x000001x0000${y}x")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("x000003_ja_0000${y}x")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_EU2("_dia_tres_3_janeiro_1964_mil_novecentos_sessenta_e_seis_",Decode_Language("Portug"))) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

__END__

