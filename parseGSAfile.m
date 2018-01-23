function [location,session,type] = parseGSAfile(filePath)
%PARSEGSAFILE Summary of this function goes here
%   Detailed explanation goes here

splitPath = regexp(filePath,['\',filesep],'split');

switch splitPath{6}
    case 'WashingtonDC'
        location = 'DC-1800F';
        session = splitPath{8};
        type = whatType(splitPath{7});
    case 'WashingtonDC-RegionalOfficeBldg-7th&Dstreet'
        location = 'DC-ROB';
        session = splitPath{8};
        type = whatType(splitPath{7});
    case 'Seattle_Washington'
        switch splitPath{8}
            case 'FCS_Building_1201'
                location = 'Seattle-1201';
            case 'FCS_Building_1202'
                location = 'Seattle-1202';
        end
        session = splitPath{9};
        type = whatType(splitPath{7});
    case 'GrandJunction_Colorado_site_data'
        location = 'Grand Junction';
        session = splitPath{8};
        type = whatType(splitPath{7});
    case 'Portland_Oregon_site_data'
        location = 'Portland';
        session = splitPath{8};
        type = whatType(splitPath{7});
end

end

function type = whatType(str)
switch str
    case 'Daysimeter_Stationary_Data'
        type = 'stationary';
    case 'Daysimeter_People_Data'
        type = 'person';
    otherwise
        warning('Unknown type');
end
end