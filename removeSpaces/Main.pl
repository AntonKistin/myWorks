#!/usr/bin/perl
#use strict;
#use warnings FATAL => 'all';

open F1, "<initialFile.java" or die "Ошибка открытия файла initialFile.java:$!";
open F2, ">resultFile.txt" or die "Ошибка открытия файла resultFile.txt:$!";

@_ = <F1>;
close F1 or die $!;

$_ = join" ",@_;
print "Исходный файл: ", "\n","$_";

@mas = tr/\n" "\t\r//d;

print "\n", "Результат: ";
print "\n", $_;
print F2 "$_", "\n";
close F2 or die $!;
