classdef TraderTest < matlab.mock.TestCase
    methods(Test)
        function buysStockWhenDrops(testCase)
            import matlab.unittest.constraints.IsLessThan
            import matlab.unittest.constraints.IsAnything
            import matlab.mock.constraints.WasCalled
            yesterday = datetime('yesterday');
            
            % Create mocks
            [stubDataService,dataServiceBehavior] = createMock(testCase, ...
                ?DataService);
            [spyBroker,brokerBehavior] = createMock(testCase, ...
                'AddedMethods',{'buy'});
            
            % Set up behavior
            testCase.assignOutputsWhen(dataServiceBehavior.lookupPrice(...
                "FOO",yesterday),123);
            testCase.assignOutputsWhen(dataServiceBehavior.lookupPrice(...
                "FOO",IsLessThan(yesterday)),234);
            
            % Call function under test
            trader(stubDataService,spyBroker,"FOO",100)
            trader(stubDataService,spyBroker,"FOO",75)
            
            % Verify interactions
            testCase.verifyCalled(brokerBehavior.buy("FOO",100))
            testCase.verifyThat(brokerBehavior.buy("FOO",IsAnything), ...
                WasCalled('WithCount',2))
        end
        function doesNotBuyStockWhenIncreases(testCase)
            import matlab.unittest.constraints.IsLessThan
            yesterday = datetime('yesterday');
            
            % Create mocks
            [stubDataService,dataServiceBehavior] = createMock(testCase, ...
                ?DataService);
            [spyBroker,brokerBehavior] = createMock(testCase, ...
                'AddedMethods',{'buy'});
            
            % Set up behavior
            testCase.assignOutputsWhen(dataServiceBehavior.lookupPrice(...
                "BAR",yesterday),765);
            testCase.assignOutputsWhen(dataServiceBehavior.lookupPrice(...
                "BAR",IsLessThan(yesterday)),543);
            
            % Call function under test
            trader(stubDataService,spyBroker,"BAR",100)
            
            % Verify interactions
            testCase.verifyNotCalled(brokerBehavior.buy("BAR",100))
        end
    end
end