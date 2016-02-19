function snNum = convertSN(snChar)
%CONVERTSN Summary of this function goes here
%   Detailed explanation goes here

if numel(snChar) >= 3
    snChar = snChar(end-2:end);
end

snNum = str2double(snChar);

end

