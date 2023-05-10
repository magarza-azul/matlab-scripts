function GO16120192611524dat = import2019(filename, dataLines)
%IMPORTFILE1 Import data from a text file
%  GO16120192611524DAT = IMPORTFILE1(FILENAME) reads data from text file
%  FILENAME for the default selection.  Returns the data as a table.
%
%  GO16120192611524DAT = IMPORTFILE1(FILE, DATALINES) reads data for the
%  specified row interval(s) of text file FILENAME. Specify DATALINES as
%  a positive scalar integer or a N-by-2 array of positive scalar
%  integers for dis-contiguous row intervals.
%
%  Example:
%  GO16120192611524dat = importfile1("C:\Users\usuario\Desktop\Renate-files\2019\02102019\GO161_2019-261-1524dat.txt", [1, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 02-May-2023 13:24:37

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [1, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 35);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = "\t";

% Specify column names and types
opts.VariableNames = ["Type", "error", "PCDate", "PCTime", "GPSDate", "gpsTime", "latitude", "longitude", "equTemp", "stdVal", "CO2Mv", "CO2Umm", "H2OMv", "H2OMmm", "licorTemp", "licorPress", "atmPress", "equPress", "H2OFlow", "licorFlow", "equPump", "ventFlow", "atmCond", "equCond", "drip1", "NA", "condTemp", "dryBoxTemp", "deckBoxTemp", "TSGTemp", "TSGSalt", "IntakeTemp", "Oxygen", "Saturation", "Temp"];
opts.VariableTypes = ["string", "double", "datetime", "datetime", "datetime", "datetime", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, "Type", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "Type", "EmptyFieldRule", "auto");
opts = setvaropts(opts, "PCDate", "InputFormat", "dd/MM/yy");
opts = setvaropts(opts, "PCTime", "InputFormat", "HH:mm:ss");
opts = setvaropts(opts, "GPSDate", "InputFormat", "dd/MM/yy");
opts = setvaropts(opts, "gpsTime", "InputFormat", "HH:mm:ss");

% Import the data
GO16120192611524dat = readtable(filename, opts);

end