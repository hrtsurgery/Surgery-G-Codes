%% Adjusts g-codes for the new robot, by dividing all numbers by 1.06 so that coordinates are 1mm/unit

[fileName, filePath] = uigetfile('V:\Surgery Robot\*','Select Files to convert','MultiSelect','on');
fileName = cellstr(fileName);

outputPath = uigetdir([],'Select output path');

scale_factor = 1 / 1.06;


for i = 1:length(fileName)
    fname = fullfile(filePath,fileName(i));
    fid = fopen(fname{:});
    t = fscanf(fid,'%c');
    fclose(fid);
    
    pattern = '([XYZ]-?\d*\.?\d*)';
    replace = '${[$1(1), num2str( scale_factor * str2num($1(2:end) ))]}';
    newCode = regexprep(t, pattern, replace);
    
    newCode = ['% 1.0 units/mm' char([13,10]) newCode char([13,10])];
    disp(newCode)
    
    fname = fullfile(filePath,fileName(i));
    fid = fopen(fname{:},'w');
    fwrite(fid,newCode);
    fclose(fid);
end
