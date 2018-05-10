function myUnsafeFileWriter( filename, data )
% myUnsafeFileWriter writes data to a file without cleaning up

% Copyright 2018 MathWorks Inc.

fid = fopen( filename, 'w' );
fprintf( fid, '%s\n', data );
fclose( fid );

end
