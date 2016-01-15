# Add support for acronyms
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
   $dir = dirname($_[0]);
   $file = basename($_[0]);
   if ( $silent ) {
      system "makeglossaries -q -d '$dir' '$file'";
   }
   else {
      system "makeglossaries -d '$dir' '$file'";
   };
}
push @generated_exts, 'glo', 'gls', 'glsdefs', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
$clean_ext .= ' %R.ist %R.xdy';

# Automatically call pdflatex (instead of latex)
$pdf_mode = 1;

# Add additional arguments
$pdflatex = 'pdflatex -shell-escape -file-line-error -interaction=nonstopmode --synctex=-1 %O %S';
$xelatex = 'xelatex -shell-escape -file-line-error -interaction=nonstopmode --synctex=-1 %O %S';

