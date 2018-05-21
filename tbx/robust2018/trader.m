function trader(dataService,broker,ticker,numShares)
% an algorithm for buying stock

% Copyright 2018 MathWorks Inc.

    yesterday = datetime('yesterday');
    priceYesterday = dataService.lookupPrice(ticker,yesterday);
    price2DaysAgo = dataService.lookupPrice(ticker,yesterday-days(1));
    
    if priceYesterday < price2DaysAgo
        broker.buy(ticker,numShares);
    end
end