% Matlab function to read setpoints data file from Allen-Bradley CF/SD card.
% Written by Tony Scarcia
% Jan 7, 2018
function[sp] = read_cf_file(filename)
format short g;
fileID = fopen(filename, 'r');
header =  fread(fileID,[3],'single');
sp_array1 = fread(fileID,[109],'single');
spacer = fread(fileID,[2],'single');
sp_array2 = fread(fileID,[91],'single');
fclose(fileID);
sp_index = [1:200]';
sp_array = [sp_array1;sp_array2];
sp = [sp_index, sp_array];
end