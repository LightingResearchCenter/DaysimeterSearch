function snArray = scanFiles(fileArray)
%SCANFILES Summary of this function goes here
%   Detailed explanation goes here

nFile = numel(fileArray);
snArray = cell(nFile,1);
h = waitbar(0,'Please wait. Scanning files...');
for iFile = 1:nFile
    try
        deviceSN = scancdf(fileArray{iFile});
        if ~isempty(deviceSN)
            snArray{iFile,1} = deviceSN;
        end
    catch
    end
    waitbar(iFile/nFile,h);
end
close(h)

end

function deviceSN = scancdf(filePath)
%READCDF Summary of this function goes here
%   Detailed explanation goes here

deviceSN = [];

% Open CDF
cdfId = cdflib.open(filePath);

nAtts = cdflib.getNumAttributes(cdfId);
nGatts = cdflib.getNumgAttributes(cdfId);

for attrNum = 0:nAtts+nGatts-1
    name = cdflib.getAttrName(cdfId,attrNum);
    if strcmpi(name,'deviceSN');
        deviceSN = cdflib.getAttrgEntry(cdfId,attrNum,0);
    end
end

% Close CDF
cdflib.close(cdfId)

end

