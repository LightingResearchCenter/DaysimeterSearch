fclose('all');
close all
clear
clc

findSNs = {104,105,107,109,110,... % Auckland
    129,151,70,102,86,... % Broken
    75,103,143,153,261,... % Missing
    201,206,... % Error Testing
    165,... % Lost NIOSH
    17,124}'; % IAI

searchFolder = '\\ROOT\projects\GSA_Daysimeter';
indexName = 'gsaIndex.mat';
[fileArray2,snArray2Num] = test(searchFolder,indexName);

w = @(sn) whereUsed(sn,snArray2Num,fileArray2);

r = cellfun(w,findSNs,'UniformOutput',false);

t = vertcat(r{:});