function t = whereUsed(sn,snArray,fileArray)
%WHEREUSED Summary of this function goes here
%   Detailed explanation goes here

idx = snArray == sn;
snArray = snArray(idx);
fileArray = fileArray(idx);

nFile = numel(fileArray);
location = cell(nFile,1);
session = cell(nFile,1);
type = cell(nFile,1);
% uuid = cell(nFile,1);

for iFile = 1:nFile
    [location{iFile,1},session{iFile,1},type{iFile,1}] = parseGSAfile(fileArray{iFile});
    
%     uuid{iFile,1} = [num2str(snArray(iFile)),location{iFile,1},session{iFile,1},type{iFile,1}];
end

t = table(snArray,location,session,type,fileArray);

end

