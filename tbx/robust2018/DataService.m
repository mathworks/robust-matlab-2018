classdef DataService
    % a data service to retrieve the stock price data
    
    % Copyright 2018 MathWorks Inc.   
    methods (Abstract,Static)
        price = lookupPrice(ticker,date)
    end
end