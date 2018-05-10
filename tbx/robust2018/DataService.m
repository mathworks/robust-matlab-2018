classdef DataService
    methods (Abstract,Static)
        price = lookupPrice(ticker,date)
    end
end