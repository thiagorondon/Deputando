
package Deputando::Util;

use utf8;
use Text::Unidecode;

require Exporter;

@ISA = qw(Exporter);
@EXPORT_OK = qw(remover_acentos);

# tr ? no... problems, fixme!
sub remover_acentos {
    my $var = shift;
    $var = unidecode($var);
    map {
        s/Á/A/g; s/À/A/g; s/Ã/A/g; s/Ä/A/g; s/Â/A/g;
        s/á/a/g; s/à/a/g; s/ã/a/g; s/ä/a/g; s/â/a/g;

        s/É/E/g; s/È/E/g; s/Ë/E/g; s/Ê/E/g;
        s/é/e/g; s/è/e/g; s/ë/e/g; s/ê/e/g;

        s/Í/I/g; s/Ì/I/g; s/Ï/I/g; s/Î/I/g;
        s/í/i/g; s/ì/i/g; s/ï/i/g; s/î/i/g;

        s/Ó/O/g; s/Ò/O/g; s/Õ/O/g; s/Ö/O/g; s/Ô/O/g;
        s/ó/o/g; s/ò/o/g; s/õ/o/g; s/ö/o/g; s/ô/o/g;

        s/Ú/U/g; s/Ù/U/g; s/Ü/U/g; s/Û/U/g;
        s/ú/u/g; s/ù/u/g; s/ü/u/g; s/û/u/g;

        s/ç/c/; s/Ç/C/;
    } $var;

    return $var;
}


1;

