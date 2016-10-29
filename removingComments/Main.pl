#!/usr/bin/perl
#use strict;
#use warnings FATAL => 'all';

open F1, "<inputFile.java" or die "Ошибка открытия файла inputFile.java:$!";
open F2, ">outputFile.txt" or die "Ошибка открытия файла outputFile.txt:$!";

@_ = <F1>;
close F1 or die $!;

$_ = join" ",@_;

print "Исходный файл: ","\n", $_;

@mas = ~s/\/\*.*?\*\///sg;
@mas = ~s/\/\/.*?\n//g;

print F2 $_, "\n";

print "\n", "Результат: ", "\n", $_;
close F2 or die $!;
