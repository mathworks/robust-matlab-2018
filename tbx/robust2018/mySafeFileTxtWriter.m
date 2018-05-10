function mySafeFileTxtWriter( filename, data )
% mySafeFileTxtWriter writes data to a text file and cleans up

% Copyright 2018 MathWorks Inc.

[~,~,ext] = fileparts( filename );
if ~strcmpi( ext, '.txt' )
    error( 'mySafeFileTxtWriter:InvalidFileExtension', ...
        'Filename input must have a ''.txt'' extension. Extension supplied was ''%s''', ...
        ext );
    
end

fid = fopen( filename, 'w' );
c = onCleanup( @() fclose(fid) );

fprintf( '%s\n', data );

end
