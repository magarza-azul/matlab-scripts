function BoyaGando1 = GandoImportXML3(filename, dataLines)
%IMPORTFILE Import data from a text file
%  BOYAGANDO1 = IMPORTFILE(FILENAME) reads data from text file FILENAME
%  for the default selection.  Returns the data as a table.
%
%  BOYAGANDO1 = IMPORTFILE(FILE, DATALINES) reads data for the specified
%  row interval(s) of text file FILENAME. Specify DATALINES as a
%  positive scalar integer or a N-by-2 array of positive scalar integers
%  for dis-contiguous row intervals.
%
%  Example:
%  BoyaGando1 = importfile("C:\Users\TESTER\OneDrive\Escritorio\Datos_Boya_Gando\files\BoyaGando_70.xml", [5, 6]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 02-Mar-2023 10:49:18

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [5, 6];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 2);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = "/";

% Specify column names and types
opts.VariableNames = ["sostemplateswe_bridge_GMX501", "Var2"];
opts.SelectedVariableNames = "sostemplateswe_bridge_GMX501";
opts.VariableTypes = ["string", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["sostemplateswe_bridge_GMX501", "Var2"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["sostemplateswe_bridge_GMX501", "Var2"], "EmptyFieldRule", "auto");

% Import the data
BoyaGando1 = readtable(filename, opts);
BoyaGando1 = rows2vars(BoyaGando1);
BoyaGando1(:, 1) = [];
end