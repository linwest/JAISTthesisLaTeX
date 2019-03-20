# For English user, set the compiler as "pdfLaTeX". Then, this file does not make sense.
# For Japanese user, set the compiler as "LaTeX". Then, this file works.

$latex = 'platex'; 
$bibtex = 'pbibtex';
$dvipdf = 'dvipdfmx %O -o %D %S';
$makeindex = 'mendex %O -o %D %S';
$pdf_mode = 3; 

# The following codes support makeglossaries for Japanese user with "pdfLaTeX".
add_cus_dep('sbl', 'sym', 0, 'makeglossaries');
add_cus_dep('acn', 'acr', 0, 'makeglossaries');

sub makeglossaries {
   my ($base_name, $path) = fileparse( $_[0] );
   pushd $path;
   my $return = system "makeglossaries $base_name";
   popd;
   return $return;
}