#!/usr/bin/perl
#use strict;
#use warnings FATAL => 'all';

open F1, "<input.txt" or die "Ошибка открытия файла input.txt:$!";
open F2, ">output.txt" or die "Ошибка открытия файла output.txt:$!";

@_ = <F1>;
close F1 or die $!;

$_ = join" ",@_;
print "Исходные данные: ", "$_";

@mas = /\b[A-z_]\w*\b/g;

print F2 @mas, "\n";

print "\n", "Результат: ", "@mas";
close F2 or die $!;
