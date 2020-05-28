clear;
clc;

function sod=hhmm2sod(hhmm)
  // take HH.MM string hhmm, return second of day
  [n,h,m] = msscanf(hhmm,"%g:%g");
  sod     = 3600*h+60*m;
endfunction

function convert_corridor(csvName,moName)
  // corridor data: sod, temperature3m5, RH3m5
  M       = csvRead(csvName,";",[],"string",[],[],[],1);
  [nr,nc] = size(M);
  of      = mopen(moName,'wt');
  mfprintf(of,"#1\n");
  mfprintf(of,"double data(%d,3)\n",nr);
  for i=1:nr
      mfprintf(of,"%g,%g,%g\n",hhmm2sod(M(i,2)),...
               273.15+strtod(M(i,3)),strtod(M(i,4)));
  end
  mclose(of);
endfunction

function convert_room(csvName,moName)
  // room data: sod, temperature1m, RH1m
  M       = csvRead(csvName,";",[],"string",[],[],[],1);
  [nr,nc] = size(M);
  of      = mopen(moName,'wt');
  mfprintf(of,"#1\n");
  mfprintf(of,"double data(%d,3)\n",nr);
  for i=1:nr
      mfprintf(of,"%g,%g,%g\n",hhmm2sod(M(i,2)),...
               273.15+strtod(M(i,3)),strtod(M(i,4)));
  end
  mclose(of);
endfunction

function convert_weather(csvName,moName)
  // room data: sod, temperature, RH, sun_rad
  M       = csvRead(csvName,";",[],"string",[],[],[],1);
  [nr,nc] = size(M);
  of      = mopen(moName,'wt');
  mfprintf(of,"#1\n");
  mfprintf(of,"double data(%d,3)\n",nr);
  for i=1:nr
      mfprintf(of,"%g,%g,%g\n",hhmm2sod(M(i,2)),...
               273.15+strtod(M(i,3)),strtod(M(i,4)),...
               strtod(M(i,5)));
  end
  mclose(of);
endfunction

// Main ********************************************************************************************

convert_corridor("./RawData/Corridor/corridoioMaggio.csv","./MoTableData/corridor-May.txt");
convert_corridor("./RawData/Corridor/corridoioGiugno.csv","./MoTableData/corridor-Jun.txt");
convert_corridor("./RawData/Corridor/corridoioLuglio.csv","./MoTableData/corridor-Jul.txt");
convert_corridor("./RawData/Corridor/corridoioAgosto.csv","./MoTableData/corridor-Aug.txt");
convert_corridor("./RawData/Corridor/corridoioSettembre.csv","./MoTableData/corridor-Sep.txt");

convert_room("./RawData/Rooms/121Maggio.csv","./MoTableData/room-121-May.txt");
convert_room("./RawData/Rooms/121Giugno.csv","./MoTableData/room-121-Jun.txt");
convert_room("./RawData/Rooms/121Luglio.csv","./MoTableData/room-121-Jul.txt");
convert_room("./RawData/Rooms/121Agosto.csv","./MoTableData/room-121-Aug.txt");
convert_room("./RawData/Rooms/121Settembre.csv","./MoTableData/room-121-Sep.txt");
convert_room("./RawData/Rooms/123Maggio.csv","./MoTableData/room-123-May.txt");
convert_room("./RawData/Rooms/123Giugno.csv","./MoTableData/room-123-Jun.txt");
convert_room("./RawData/Rooms/123Luglio.csv","./MoTableData/room-123-Jul.txt");
convert_room("./RawData/Rooms/123Agosto.csv","./MoTableData/room-123-Aug.txt");
convert_room("./RawData/Rooms/123Settembre.csv","./MoTableData/room-123-Sep.txt");
convert_room("./RawData/Rooms/124Maggio.csv","./MoTableData/room-124-May.txt");
convert_room("./RawData/Rooms/124Giugno.csv","./MoTableData/room-124-Jun.txt");
convert_room("./RawData/Rooms/124Luglio.csv","./MoTableData/room-124-Jul.txt");
convert_room("./RawData/Rooms/124Agosto.csv","./MoTableData/room-124-Aug.txt");
convert_room("./RawData/Rooms/124Settembre.csv","./MoTableData/room-124-Sep.txt");
convert_room("./RawData/Rooms/126Maggio.csv","./MoTableData/room-126-May.txt");
convert_room("./RawData/Rooms/126Giugno.csv","./MoTableData/room-126-Jun.txt");
convert_room("./RawData/Rooms/126Luglio.csv","./MoTableData/room-126-Jul.txt");
convert_room("./RawData/Rooms/126Agosto.csv","./MoTableData/room-126-Aug.txt");
convert_room("./RawData/Rooms/126Settembre.csv","./MoTableData/room-126-Sep.txt");

convert_weather("./RawData/Weather/meteoMaggio.csv","./MoTableData/weather-May.txt");
convert_weather("./RawData/Weather/meteoGiugno.csv","./MoTableData/weather-Jun.txt");
convert_weather("./RawData/Weather/meteoLuglio.csv","./MoTableData/weather-Jul.txt");
convert_weather("./RawData/Weather/meteoAgosto.csv","./MoTableData/weather-Aug.txt");
convert_weather("./RawData/Weather/meteoSettembre.csv","./MoTableData/weather-Sep.txt");
