# For English user, set the compiler as "pdfLaTeX". Then, this file does not make sense.
# For Japanese user, set the compiler as "LaTeX". Then, this file works.

$latex = 'platex'; 
$bibtex = 'pbibtex';
$dvipdf = 'dvipdfmx %O -o %D %S';
$makeindex = 'mendex %O -o %D %S';
$pdf_mode = 3; 