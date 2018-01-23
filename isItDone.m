fclose('all');
close all
clear
clc

searchFolder = '\\ROOT\projects\GSA_Daysimeter';
indexName = 'gsaIndex.mat';
[fileArray2,snArray2Num] = test(searchFolder,indexName);

w = @(sn) whereUsed(sn,snArray2Num,fileArray2);

r = cellfun(w,num2cell(snArray2Num),'UniformOutput',false);

t = vertcat(r{:});

t.fileArray = [];

C = unique(t);