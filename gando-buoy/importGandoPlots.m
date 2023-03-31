function gando = importGandoPlots(workbookFile, sheetName, dataLines)
%IMPORTFILE Import data from a spreadsheet
%  GANDO = IMPORTFILE(FILE) reads data from the first worksheet in the
%  Microsoft Excel spreadsheet file named FILE.  Returns the data as a
%  table.
%
%  GANDO = IMPORTFILE(FILE, SHEET) reads from the specified worksheet.
%
%  GANDO = IMPORTFILE(FILE, SHEET, DATALINES) reads from the specified
%  worksheet for the specified row interval(s). Specify DATALINES as a
%  positive scalar integer or a N-by-2 array of positive scalar integers
%  for dis-contiguous row intervals.
%
%  Example:
%  gando = importfile("C:\Users\usuario\Desktop\Datos_Boya_Gando\gando.xlsx", "Sheet1", [2, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 31-Mar-2023 08:30:56

%% Input handling

% If no sheet is specified, read first sheet
if nargin == 1 || isempty(sheetName)
    sheetName = 1;
end

% If row start and end points are not specified, define defaults
if nargin <= 2
    dataLines = [2, Inf];
end

%% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 18);

% Specify sheet and range
opts.Sheet = sheetName;
opts.DataRange = dataLines(1, :);

% Specify column names and types
opts.VariableNames = ["DateCyc", "Fluorescece", "Chlorofila", "DateMicrocatSIP", "SST", "SSS", "YearFractionO2", "DateOptode", "Oxy", "Saturation", "TempO2", "O2Concentration", "YearFraccionProoceanus", "DateProOceanus", "pCO2", "DateSamipH", "pHTemp", "pHTis"];
opts.VariableTypes = ["datetime", "double", "double", "datetime", "double", "double", "double", "datetime", "double", "double", "double", "double", "double", "datetime", "double", "datetime", "double", "double"];

% Import the data
gando = readtable(workbookFile, opts, "UseExcel", false);

for idx = 2:size(dataLines, 1)
    opts.DataRange = dataLines(idx, :);
    tb = readtable(workbookFile, opts, "UseExcel", false);
    gando = [gando; tb]; %#ok<AGROW>
end

end