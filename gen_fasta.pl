#!/usr/bin/env perl
#################################################################
## Generates a FASTA sequence using rand()
## 02/04/2012 Navish Dadighat
#################################################################

use strict;
use warnings;

use Carp;
use Getopt::Long;

sub usage {
print qq{
perl $0
        
--length/-L <sequence length>
Number of basepairs to be in the sequence
        
--sequences/-S <number of sequences>
Number of FASTA sequences to be present
        
--N/-N
If you want N's in the sequence
        
[ --help    ]    # Print this message
};
    
    exit( 1 );
}


my $seqLength   = undef; # Number of basepairs to be present
my $numSeqs     = undef; # Number of sequences to be present
my $Ns          = undef; # If Ns need to be included

my $options = GetOptions(
'length=s'      => \$seqLength ,
'L=s'      => \$seqLength ,
'sequences=s'   => \$numSeqs,
'S=s'   => \$numSeqs,
'N'           => \$Ns,
'help'          => sub { usage },
);

usage if not defined $seqLength;
usage if not defined $numSeqs;

my $counter = 0;
my @chars = ("A","T","G","C");

if($Ns){
    push(@chars,"N");
}

foreach(1..$numSeqs){
		$counter++;
		print ">" . $counter . "\n";

		foreach(1..$seqLength){
				my $ranSeq .= $chars[rand @chars];
				print $ranSeq;
		}

		print "\n";
}
