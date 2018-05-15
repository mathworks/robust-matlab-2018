%% Run tests and collect coverage information

import matlab.unittest.TestRunner
import matlab.unittest.TestSuite
import matlab.unittest.plugins.CodeCoveragePlugin
import matlab.unittest.plugins.codecoverage.CoberturaFormat

% Define test suite
tests = fullfile( pwd, 'TraderTest.m' );
suite = TestSuite.fromFile( tests );

% Create and configure the runner
runner = TestRunner.withTextOutput('Verbosity',3);
src = fullfile(pwd,'tbx','robust2018');
coverageFile = fullfile(pwd, 'coverage.xml');
runner.addPlugin(CodeCoveragePlugin.forFolder(src,...
    'Producing', CoberturaFormat(coverageFile)));

results = runner.run(suite)

%%
token = '8d46bba7-22e7-4ce1-9dc5-02a052fd6b8e';
setenv( 'CODECOV_TOKEN', token );

!C:\PROGRA~1\Git\mingw64\bin\curl.exe -s https://codecov.io/bash | C:\PROGRA~1\Git\bin\bash.exe -s || - echo "Codecov did not collect coverage reports"
web( 'https://codecov.io/gh/ppeeling/robust-matlab-2018/' )