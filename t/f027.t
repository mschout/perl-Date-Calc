#!perl -w

BEGIN { eval { require bytes; }; }
use strict;
no strict "vars";

BEGIN { $Date::Calc::XS_DISABLE = $Date::Calc::XS_DISABLE = 1; }

use Date::Calc qw( Decode_Date_US2 Language Decode_Language );

# ======================================================================
#   ($year,$mm,$dd) = Decode_Date_US2($date);
# ======================================================================

my $Y = 1900 + (localtime)[5] - 50;     # expected year (e.g. 1965)
my $y = sprintf('%02d', $Y % 100);      # short year    (e.g. 65)

print "1..46\n";

$n = 1;
unless (($year,$mm,$dd) = Decode_Date_US2(""))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = Decode_Date_US2("__"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = Decode_Date_US2("_13_"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_134_")) &&
($year==2004) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_0134_")) &&
($year==2004) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_00134_")) &&
($year==2004) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_13${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_013${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_0013${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_103${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_0103${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_00103${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_1103${y}_")) &&
($year==$Y) && ($mm==11) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_01103${y}_")) &&
($year==$Y) && ($mm==11) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_001103${y}_")) &&
($year==$Y) && ($mm==11) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_10319${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_010319${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_0010319${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_110319${y}_")) &&
($year==$Y) && ($mm==11) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_0110319${y}_")) &&
($year==$Y) && ($mm==11) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_00110319${y}_")) &&
($year==$Y) && ($mm==11) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_1_3_${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_1_3_1964_")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_jan_3_${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_Jan_3_${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_jAN_3_${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_January_3_${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = Decode_Date_US2("_j_3_${y}_"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2(" January 3rd, 1964 ")) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_Jan3${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_Jan03${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_Jan003${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_Jan22${y}_")) &&
($year==$Y) && ($mm==1) && ($dd==22))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_Jan022${y}_",0)) &&
($year==$Y) && ($mm==1) && ($dd==22))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_Jan0022${y}_",'')) &&
($year==$Y) && ($mm==1) && ($dd==22))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_ja31964_",1)) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_ja031964_",2)) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_ja0031964_",3)) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_ja221964_",undef)) &&
($year==1964) && ($mm==1) && ($dd==22))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_ja0221964_")) &&
($year==1964) && ($mm==1) && ($dd==22))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_ja00221964_")) &&
($year==1964) && ($mm==1) && ($dd==22))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = Decode_Date_US2("_ja33${y}_"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

unless (($year,$mm,$dd) = Decode_Date_US2("_ja331964_"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("x000001x000003x0000${y}x")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_ja_000003x0000${y}x")) &&
($year==$Y) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if ((($year,$mm,$dd) = Decode_Date_US2("_Janeiro_3_dia_tres_de_janeiro_de_1964_mil_novecentos_sessenta_e_seis_",Decode_Language("Portug"))) &&
($year==1964) && ($mm==1) && ($dd==3))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

__END__

