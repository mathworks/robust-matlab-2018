classdef BankAccount 
    
    properties
        AccountNumber
        AccountBalance
        AccountStatus
    end
    
    methods
       
        function ba = BankAccount(accountNumber, accountBalance)
            ba.AccountNumber = accountNumber;
            ba.AccountBalance = accountBalance;
            ba.AccountStatus = 'Open';
        end 
        
        function ba = deposit(ba, amount)
            validateattributes(amount, {'double'}, {'scalar', 'positive'});
            ba.AccountBalance = ba.AccountBalance + amount;
        end 
        
        function ba = withdraw(ba, amount)
            ba.AccountBalance = ba.AccountBalance - amount;
            if ba.AccountBalance < 0
                ba.AccountStatus = 'Overdraft';
            end
        end 
        
    end
end 