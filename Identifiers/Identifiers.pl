#!/usr/bin/perl
#use strict;
#use warnings FATAL => 'all';

$_ = "Penza58 64_Saratov _Moscow197 12573";
@array = /\b[A-z_]\w*\b/g;
print "@array";