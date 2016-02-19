function fileArray = recursiveFileSearch(searchFolder)
%RECURSIVEFILESEARCH Summary of this function goes here
%   Detailed explanation goes here

filePattern = '\.cdf$';

[fileArray,fldrArray] = getFiles(searchFolder,filePattern);

nFldr = numel(fldrArray);

if nFldr >= 1
    fileCollector = cell(nFldr,1);
    for iFldr = 1:nFldr
        tmp = recursiveFileSearch(fldrArray{iFldr});
        if ~isempty(tmp)
            fileCollector{iFldr,1} = tmp;
        end
    end
    
    fileCollector = vertcat(fileCollector{:});
    fileArray = [fileArray;fileCollector];
end

end

