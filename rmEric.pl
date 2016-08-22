print "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n";
print "\n------------------ delect Baicsson header ----------------\n";
print "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n";

$inputFileName = $ARGV[0];
print $inputFileName;
chomp ($inputFileName);
$outputFileName = $inputFileName;
#$outputFileName =~ s/.dec//;
$outputFileName1 = join($outputFileName,"Kingta_","");
print "\nOutput file is $outputFileName1\n";
       
open(inFile, "<$inputFileName")
	or die "Couldn't open input file $inputFileName !\n";
open(outFile1, ">$outputFileName1")
	or die "Couldn't open output file $outputFileName1 !\n";

while(<inFile>)
{
	$Line = $_;
	if ($Line =~ /.* Description .*/)
	{
		$indFlag = 1;
		next;
	}
	if ($Line =~ /.* Copyright Ericsson AB.*/)
	{
		$indFlag = 1;
		next;
	}
	if ($Line =~ /.* The copyright to the computer .*/)
	{
		$indFlag = 1;
		next;
	}
	if ($Line =~ /.* The programs may be used .*/)
	{
		$indFlag = 1;
		next;
	}
	if ($Line =~ /.* Ericsson AB or in accordance .*/)
	{
		$indFlag = 1;
		next;
	}
	if ($Line =~ /.*ntract under.*/)
	{
		$indFlag = 1;
		next;
	}
	else
	{
		print outFile1 "$Line";
	}	
}	
close(outFile1);
close(inFile);


