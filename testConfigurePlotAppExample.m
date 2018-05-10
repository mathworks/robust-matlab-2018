classdef testConfigurePlotAppExample < matlab.uitest.TestCase
    
    % Copyright 2018 MathWorks Inc.
    
    methods (Test)
        function test_SampleSize(testCase)
            app = ConfigurePlotAppExample;
            testCase.addTeardown(@delete,app);
            
            testCase.type(app.SampleSizeEditField,12);
            testCase.press(app.UpdatePlotButton);
            
            ax = app.UIAxes;
            surfaceObj = ax.Children;
            testCase.verifySize(surfaceObj.ZData,[12 12]);
        end
        
        function test_Colormap(testCase)
            app = ConfigurePlotAppExample;
            testCase.addTeardown(@delete,app);
            
            testCase.choose(app.ColormapDropDown,'Winter');
            testCase.press(app.UpdatePlotButton);
            
            expectedMap = winter;
            ax = app.UIAxes;
            testCase.verifyEqual(ax.Colormap,expectedMap);
        end
    end
    
end