function Renate1001 = import20192(filename, dataLines)
%IMPORTFILE1 Import data from a text file
%  RENATE1001 = IMPORTFILE1(FILENAME) reads data from text file FILENAME
%  for the default selection.  Returns the data as a table.
%
%  RENATE1001 = IMPORTFILE1(FILE, DATALINES) reads data for the
%  specified row interval(s) of text file FILENAME. Specify DATALINES as
%  a positive scalar integer or a N-by-2 array of positive scalar
%  integers for dis-contiguous row intervals.
%
%  Example:
%  Renate1001 = importfile1("C:\Users\usuario\Desktop\Renate-files\files2\Renate_1001.txt", [1, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 03-May-2023 10:43:40

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [1, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 42);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = "\t";

% Specify column names and types
opts.VariableNames = ["Type", "error", "PCDate", "PCTime", "GPSDate", "gpsTime", "latitude", "longitude", "equTemp", "stdVal", "CO2aW", "CO2bW", "CO2Umm", "H2OaW", "H2ObW", "H2OMmm", "licorTemp", "licorPress", "Diag", "RH", "C_AGC", "H_AGC", "flowV", "atmPress", "equPress", "H2OFlow", "licorFlow", "equPump", "ventFlow", "atmCond", "equCond", "drip1", "NA", "condTemp", "dryBoxTemp", "deckBoxTemp", "TSGTemp", "TSGSalt", "IntakeTemp", "Oxygen", "Saturation", "Temp"];
opts.VariableTypes = ["string", "double", "datetime", "datetime", "datetime", "datetime", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["Type", "atmCond", "equCond", "drip1", "NA", "condTemp", "dryBoxTemp", "deckBoxTemp", "TSGTemp", "TSGSalt", "IntakeTemp", "Oxygen", "Saturation", "Temp"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Type", "atmCond", "equCond", "drip1", "NA", "condTemp", "dryBoxTemp", "deckBoxTemp", "TSGTemp", "TSGSalt", "IntakeTemp", "Oxygen", "Saturation", "Temp"], "EmptyFieldRule", "auto");
opts = setvaropts(opts, "PCDate", "InputFormat", "dd/MM/yy");
opts = setvaropts(opts, "PCTime", "InputFormat", "HH:mm:ss");
opts = setvaropts(opts, "GPSDate", "InputFormat", "dd/MM/yy");
opts = setvaropts(opts, "gpsTime", "InputFormat", "HH:mm:ss");

% Import the data
Renate1001 = readtable(filename, opts);

end