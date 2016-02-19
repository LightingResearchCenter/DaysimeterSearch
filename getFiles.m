function [fileArray,fldrArray] = getFiles(searchFolder,filePattern)
%GETFILES Summary of this function goes here
%   Detailed explanation goes here

tmpFileArray = cell(System.IO.Directory.GetFiles(searchFolder))';
matchIdx = ~cellfun(@isempty,regexp(tmpFileArray,filePattern));
fileArray = tmpFileArray(matchIdx);

fldrArray = cell(System.IO.Directory.GetDirectories(searchFolder))';

end

