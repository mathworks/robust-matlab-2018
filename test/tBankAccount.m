classdef tBankAccount < matlab.unittest.TestCase
    % Tests the BankAccount class.
    
    % Copyright 2018 MathWorks Inc.
    
    methods (Test)
        
        function testCreation(testCase)
            ba = BankAccount(1234, 100);
            testCase.verifyEqual(ba.AccountNumber, 1234, ...
                'Constructor failed to correctly set account number');
            testCase.verifyEqual(ba.AccountBalance, 100, ...
                'Constructor failed to correctly set account balance');
        end
       
        function testDesposit(testCase)
            ba = BankAccount(1234, 100);
            ba = ba.deposit(25);
            testCase.verifyEqual(ba.AccountBalance, 125);
        end
        
        function testWithdraw(testCase)
            ba = BankAccount(1234, 100);
            ba = ba.withdraw(25);
            testCase.verifyEqual(ba.AccountBalance, 75);
        end
   
    end
end