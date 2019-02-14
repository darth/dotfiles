$latex = 'latex --enable-write18 --synctex=1 %O %S';
$pdflatex = 'pdflatex --enable-write18 --synctex=1 %O %S';
$dvips = 'dvips %O -o %D %S && mv %D %D.tmp && sed \'/^SDict begin \[$/,/^end$/d\' %D.tmp >%D && rm %D.tmp';

$pvc_view_file_via_temporary = 0;

push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
push @generated_exts, 'lot', 'lof', 'loa';
$clean_ext .= 'synctex.gz tdo xdy';

$bibtex_use = 2;

add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
   my ($base_name, $path) = fileparse( $_[0] );
   pushd $path;
    if ( $silent ) {
      my $return = system "makeglossaries -q '$base_name'";
    }
    else {
      my $return = system "makeglossaries '$base_name'";
    };
   popd;
   return $return;
}
