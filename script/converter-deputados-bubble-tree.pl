#!/usr/bin/perl

use strict;
use warnings;
use XML::Simple;
use Data::Dumper;
use Deputando::Util qw(remover_acentos);

our @colors = (
    qw/
      b8100b
      CA221D
      67b460
      44913D
      164a95
      2458A3
      c22769
      C22769
      00003a
      2458A3
      2a7a77
      42928F
      0d0965
      211D79
      2458a3
      2458A3
      000051
      211D79
      327f2b
      44913D
      216e1a
      44913D
      0f5c08
      44913D
      7c0023
      C22769
      cfde4f
      A5B425
      560c00
      E29826
      004b00
      44913D
      00125d
      2458A3
      bf7503
      E29826
      2b2783
      211D79
      5f3290
      481B79
      000001
      211D79
      e29826
      E29826
      55a24e
      44913D
      000000
      211D79
      00125d
      2458A3
      000015
      211D79
      59a9a6
      42928F
      3266b1
      2458A3
      ca221d
      CA221D
      78c571
      44913D
      a70000
      CA221D
      840000
      CA221D
      004c49
      42928F
      000029
      211D79
      020033
      481B79
      300361
      481B79
      a70000
      CA221D
      b97503
      E29826
      fe5651
      CA221D
      7b8a00
      A5B425
      4e82cd
      2458A3
      477bc6
      2458A3
      e54a8c
      C22769
      5f6e00
      A5B425
      950000
      CA221D
      b3c233
      A5B425
      db332e
      CA221D
      9f0446
      C22769
      002e79
      2458A3
      97a617
      A5B425
      44913d
      44913D
      2b2783
      2b2783
      211D79
      44104e
      ff5d58
      db332e
      CA221D
      e8b64a
      327f2b
      44913d
      44913D
      c14830
      a70000
      a70000
      CA221D
      7bb38f
      35822e
      67b460
      44913D
      112a49
      327f2b
      44913d
      44913D
      942933
      4d9d9a
      2a7a77
      42928F
      7bb38f
      398632
      0f5c08
      44913D
      145861
      35822e
      67b460
      44913D
      c29557
      950000
      950000
      CA221D
      c29557
      cd3274
      e54a8c
      C22769
      c14830
      003e3b
      004c49
      42928F
      942933
      00125d
      00125d
      2458A3
      a3a340
      59a9a6
      59a9a6
      42928F
      7bb38f
      cd2520
      db332e
      CA221D
      a3a340
      000029
      000029
      211D79
      935f72
      6a9ee9
      477bc6
      2458A3
      112a49
      ca221d
      ca221d
      CA221D
      7c6892
      8f0000
      a70000
      CA221D
      935f72
      35822e
      67b460
      44913D
      942933
      be1717
      a70000
      CA221D
      7c6892
      610000
      a70000
      CA221D
      44104e
      950000
      db332e
      CA221D
      935f72
      216e1a
      67b460
      44913D
      a3a340
      327f2b
      44913d
      44913D
      c29557
      0e5a57
      004c49
      42928F
      c14830
      99e692
      67b460
      44913D
      c29557
      899809
      cfde4f
      A5B425
      c29557
      9f0446
      9f0446
      C22769
      44104e
      fc61a3
      e54a8c
      C22769
      a3a340
      fc61a3
      e54a8c
      C22769
      a3a340
      5daa56
      67b460
      44913D
      44104e
      00002e
      00125d
      2458A3
      a3a340
      840000
      ca221d
      CA221D
      a3a340
      35822e
      67b460
      44913D
      935f72
      0f5c08
      44913d
      44913D
      a3a340
      950000
      db332e
      CA221D
      942933
      cd3274
      e54a8c
      C22769
      112a49
      360000
      7c0023
      C22769
      c29557
      a70000
      a70000
      CA221D
      a3a340
      920e0e
      840000
      CA221D
      942933
      660000
      950000
      CA221D
      c29557
      560c00
      560c00
      E29826
      44104e
      000000
      000000
      211D79
      c29557
      00125d
      2458a3
      2458A3
      a3a340
      000001
      000001
      211D79
      c29557
      b10904
      db332e
      CA221D
      44104e
      4d9d9a
      2a7a77
      42928F
      c29557
      000029
      000029
      211D79
      44104e
      003900
      327f2b
      44913D
      c29557
      00003d
      2b2783
      211D79
      e8b64a
      00003a
      00003a
      2458A3
      7bb38f
      00125d
      00125d
      2458A3
      935f72
      cfde4f
      cfde4f
      A5B425
      a3a340
      2b2783
      2b2783
      211D79
      e8b64a
      760000
      840000
      CA221D
      44104e
      b8100b
      fe5651
      CA221D
      942933
      b8100b
      fe5651
      CA221D
      a3a340
      b8100b
      fe5651
      CA221D
      935f72
      b10904
      db332e
      CA221D
      7c6892
      a70000
      a70000
      CA221D
      112a49
      6599e4
      4e82cd
      2458A3
      a3a340
      0f5c08
      44913d
      44913D
      7c6892
      660000
      950000
      CA221D
      c14830
      000017
      00125d
      2458A3
      7bb38f
      9f0446
      e54a8c
      C22769
      c29557
      236e23
      004b00
      44913D
      ff3300
      9900cc
      0099cc
      33cc33
      ff3300
      ff3300
      999933
      0099cc
      ff3300
      33cc33
      ff3300
      006633
      ff3300
      3333cc
      cc6666
      ff3300
      33cc33
      ff3300
      33cc33
      006633
      ff3300
      33cc33
      ff3300
      ff3300
      006633
      33cc33
      ff3300
      ff3300
      33cc33
      9900cc
      33cc33
      9900cc
      cc0066
      CCCC00
      33cc33
      9900cc
      0099cc
      006633
      0099cc
      ff3300
      9900cc
      006633
      9900cc
      ff3300
      33cc33
      3333cc
      ff3300
      33cc33
      3333cc
      33cc33
      ff3300
      ff3300
      006633
      CCCC00
      CCCC00
      ff3300
      ff3300
      006633
      0099cc
      3333cc
      ff3300
      006633
      cc6666
      ff3300
      ff3300
      ff3300
      9900cc
      cc0066
      ff3300
      ff3300
      CCCC00
      ff3300
      ff3300
      33cc33
      ff3300
      9900cc
      006633
      9900cc
      ff3300
      0099cc
      006633
      33cc33
      9900cc
      9900cc
      9900cc
      33cc33
      3333cc
      9900cc
      0099cc
      9900cc
      33cc33
      3333cc
      ff3300
      0099cc
      ff3300
      CCCC00
      CCCC00
      CCCC00
      9900cc
      33cc33
      006633
      9900cc
      9900cc
      0099cc
      3333cc
      999933
      3333cc
      ff3300
      CCCC00
      006633
      3333cc
      999933
      0099cc
            /
);

1;
my $ref = XMLin( $ARGV[0] );

my %tree;
my $color;

sub rand_color {
    return $colors[ rand( scalar(@colors) ) ];
}

# partido -> uf -> deputado -> comissoes titular|suplente -> nomes
foreach my $deputado ( @{ $ref->{deputado} } ) {

    # AHH!
    my $nome = remover_acentos( $deputado->{nome} );
    $nome =~ s/\'//g;

    # comissões
    my $dep;

    $dep->{titular} = 0;
    $dep->{suplente} = 0;
    warn $nome;
    if ( $deputado->{comissoes}->{titular}->{comissao} ) {

      if ( ref($deputado->{comissoes}->{titular}->{comissao}) eq 'ARRAY' ) {
    
        $dep->{titular} = scalar(@{$deputado->{comissoes}->{titular}->{comissao}});
        my @titular_n;
        foreach my $item (@{$deputado->{comissoes}->{titular}->{comissao}}) {
          push(@titular_n, $item->{sigla});
        }
        $dep->{titular_nomes} = \@titular_n;

      } else {
        $dep->{titular} = 1;
        $dep->{titular_nomes} = [ $deputado->{comissoes}->{titular}->{comissao}->{sigla} ];
      }

    }

    if ( $deputado->{comissoes}->{suplente}->{comissao} ) {

      $dep->{suplente} = ref($deputado->{comissoes}->{suplente}->{comissao}) eq 'ARRAY' ? 
        scalar(@{$deputado->{comissoes}->{suplente}->{comissao}}) : 1;
    }

    $tree{ $deputado->{partido} }{ $deputado->{uf} }{$nome} = $dep;
}

my $total_deputados = 0;
foreach my $children ( keys %tree ) {
    $total_deputados += keys $tree{$children};
}

print <<EOF;
var data = {
  label: 'Deputados',
  amount: $total_deputados,
  children: [
EOF

foreach my $children ( keys %tree ) {
    my $partido_total = keys $tree{$children};
    my $color         = &rand_color;
    print
      "{ \n\tlabel: '$children', \n\tamount: $partido_total, color: '#$color',";
    print "\n\tchildren:[";

    foreach my $children_uf ( keys %{ $tree{$children} } ) {
        my $estado_total = keys %{ $tree{$children}{$children_uf} };
        my $color         = &rand_color;
        print "{ \n\t\tlabel: '$children_uf', \n\t\tamount: $estado_total, color: '#$color',";

        print "\n\t\tchildren:[";

        foreach my $children_dep ( keys %{ $tree{$children}{$children_uf} } ) {
            my $color         = &rand_color;
            my $total_titular = $tree{$children}{$children_uf}{$children_dep}{titular};
            my $total_suplente = $tree{$children}{$children_uf}{$children_dep}{suplente};

            my $dep_total = $total_titular + $total_suplente;
            
            print "{ \n\t\t\tlabel: '$children_dep', \n\t\t\tamount: $dep_total,color: '#$color',";
            print "\n\t\t\tchildren:[";

              if ($total_titular) {
              print "{ \n\t\t\tlabel: 'titular', \n\t\t\tamount: $total_titular, color: '#$color',";
              print "\n\t\t\tchildren:[";
              foreach my $item (@{$tree{$children}{$children_uf}{$children_dep}{titular_nomes}}) {
                print "{ \n\t\t\tlabel: '$item', \n\t\t\tamount: 1, color: '#$color',},";
              }
              print "],},";
              }

              print "{ \n\t\t\tlabel: 'suplente', \n\t\t\tamount: $total_suplente, color: '#$color',},";# if $total_suplente;

            print "],";
            print "\n\t\t\t},";
        }
        print "\n\t\t],";
        print "\n\t\t},";
    }

    print "\n\t],";
    print "\n\t},\n";
}

print <<EOF;
  ]
};
EOF

