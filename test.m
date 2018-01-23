function [fileArray2,snArray2Num] = test(searchFolder,indexName)

if exist(indexName,'file') == 2
    reindex = questdlg('Do you want to update the file index?','File Index Dialog','Yes','No','No');
else
    reindex = 'Yes';
end

switch reindex
    case 'Yes'
        fileArray = recursiveFileSearch(searchFolder);
        save(indexName,'fileArray');
    case 'No'
        tmp = load(indexName);
        fileArray = tmp.fileArray;
        clear tmp;
    otherwise
        fileArray = recursiveFileSearch(searchFolder);
        save(indexName,'fileArray');
end

if exist(indexName,'file') == 2
    tmp = load(indexName);
    if isfield(tmp,'snArray')
        rescan = questdlg('Do you want to rescan files for serial numbers?','File Scan Dialog','Yes','No','No');
    else
        rescan = 'Yes';
    end
else
    rescan = 'Yes';
end

switch rescan
    case 'Yes'
        snArray = scanFiles(fileArray);
        save(indexName,'fileArray','snArray');
    case 'No'
        snArray = tmp.snArray;
        clear tmp;
    otherwise
        snArray = scanFiles(fileArray);
        save(indexName,'fileArray','snArray');
end

% Remove files with no serial number
idxEmpty = cellfun(@isempty,snArray);
fileArray2 = fileArray(~idxEmpty);
snArray2 = snArray(~idxEmpty);

% Convert cell array of strings to matrix of numbers
snArray2Num = cellfun(@convertSN,snArray2);


end