classdef ValidateProps
    % The ValidateProps class defines three properties with validation
    
    % Copyright 2018 MathWorks Inc.
    properties
        Location(1,3) double {mustBeReal, mustBeFinite}
        Label(1,:) char {mustBeMember(Label,{'High','Medium','Low'})} = 'Low'
        State(1,1) matlab.lang.OnOffSwitchState
    end
end