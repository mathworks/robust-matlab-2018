classdef testFindArea < matlab.unittest.TestCase
    % testFindArea unit tests for findArea
    
    % Copyright 2018 MathWorks Inc.
    
    properties
        Circle
        Rectangle
        Figure
        Axes
    end
    
    methods ( TestClassSetup )
        
        function drawShapesOnAxes( test )
            
            test.Figure = figure;
            test.Axes = axes( 'Parent', test.Figure );
            test.Rectangle = rectangle( test.Axes, 'Position', [-1 -1 1 1] );
            test.Circle = rectangle( test.Axes, 'Position', [-1 -1 2 2], 'Curvature', 1 );
            
        end
        
    end
    
    methods ( Test )
        
        function circleIsRound( test )
            
            expectedArea = (test.Axes.YLim(2) - test.Axes.YLim(1))^2 * pi;
            actualArea = findArea( 'circle', test.Circle.Position(3) );
            
            test.verifyEqual( actualArea, expectedArea, 'AbsTol', 0.01 );
            
        end
        
        function rectangleIsSquare( test )
            
            expectedArea = test.Rectangle.Position(3)^2;
            % Second dimension is treated as 1
            actualArea = findArea( 'rectangle', test.Rectangle.Position(3) );
            
            test.verifyEqual( actualArea, expectedArea, 'AbsTol', 0.01 );
            
        end
        
        function shapeIsKnown( test )
            
            test.verifyError( @() findArea( 'circle' ), 'MATLAB:narginchk:notEnoughInputs' );
            test.verifyError( @() findArea( 'box', 3, 4 ), 'MATLAB:findArea:unrecognizedStringChoice' );
            
        end
        
    end
    
    methods ( TestClassTeardown )
        
        function closeFigure( test )
            
            close( test.Figure )
            
        end
        
    end
    
end
