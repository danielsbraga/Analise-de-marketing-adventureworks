-- Cleansed Dim_datetable --
SELECT 
  [DateKey], 
  [FullDateAlternateKey] AS Date,
  [EnglishDayNameOfWeek] AS Day,
  [WeekNumberOfYear] AS Week_Numb, 
  [EnglishMonthName] AS Month,
  LEFT([EnglishMonthName],3) AS Monthshort, 
  [MonthNumberOfYear] AS Month_Numb, 
  [CalendarQuarter] AS Quarter, 
  ([CalendarYear] + 7)AS Year
FROM 
  [AdventureWorksDW2019].[dbo].[DimDate]
WHERE CalendarYear >= 2012;
