#!/usr/bin/perl
#use strict;
#use warnings FATAL => 'all';

open F1, "<input.java" or die "Ошибка открытия файла input.java:$!";
open F2, ">output.java" or die "Ошибка открытия файла output.java:$!";

@_ = <F1>;
close F1 or die $!;

$_ = join" ",@_;

print "Исходный файл: ", "\n", $_;

my @stringMas = m/\".*?\"/sg;
foreach my $i (0..$#stringMas)
{
    my $str = $i."str";
    $_=~s/@stringMas[$i]/$str/g;
}

my @mas = ('int', 'float', 'char', 'boolean');

$_=~tr/ //s;
$_=~tr/\n//s;
$_=~tr/\t//s;

$_=~s/\/\*.*?\*\///sg;
$_=~s/\/\/.*?\n//g;

my $firstString = $_;
#print $firstStr;

my @classNames = m/class\s\w+[\{\n ]/g;
my $classString = join" ",@classNames;
$classString=~s/class//g;
$_ = $classString;
#print $classString;

@classNames = m/\b[a-zA-Z_][\w]*\b/g;
$_ = $firstString;

foreach my $i (0..$#classNames)
{
    my $classRename = "C".$i;
    push @mas, $classRename;
    $_=~s/\b@classNames[$i]\b/$classRename/g;
}

my @masStr;
my $secodString = $_;

foreach my $i (0..$#mas)
{
    push @masStr, m/$mas[$i]\s.+?[;\)=]/g;
}

my $idWithClassnamesString = join" ", @masStr;
foreach my $i (0..$#mas) {
    $idWithClassnamesString=~s/\b$mas[$i]\b//g;
}

$_ = $idWithClassnamesString;

my @masID = m/\b[a-zA-Z_][\w]*\b/g;

foreach my $i (0..$#masID)
{
    my $IDRename = "_".$i;
    $secodString=~s/\b@masID[$i]\b/$IDRename/g;
}

foreach my $i (0..$#stringMas) {
    my $str = $i."str";
    $secodString=~s/$str\b/@stringMas[$i]/g;
}

print "Результат: ", "\n", $secodString;
print F2 "$secodString";
close F2 or die $!;
