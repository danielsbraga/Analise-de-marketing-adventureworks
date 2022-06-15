-- Cleansed Dim_Customer --
SELECT 
  c.[CustomerKey] AS CustomerKey,
  --	[GeographyKey]
  --	[CustomerAlternateKey]
  --	[Title]
  c.[FirstName],
  --	[MiddleName]
  c.[LastName], 
  c.[FirstName] + ' ' + [LastName] AS [FullName],
  --	[NameStyle]
  [BirthDate],
  --	[MaritalStatus]
  --	[Suffix]
  CASE c.[Gender] WHEN 'M' THEN 'MALE' WHEN 'F' THEN 'FEMALE' END AS Gender,
  --	[EmailAddress] 
  c.[YearlyIncome], 
  c.[TotalChildren],
  c.[NumberChildrenAtHome],
  c.[EnglishEducation],
  --	[SpanishEducation]
  --	[FrenchEducation]
  --	[EnglishOccupation]
  --	[SpanishOccupation]
  --	[FrenchOccupation]
  --	[HouseOwnerFlag]
  c.[NumberCarsOwned],
  --	[AddressLine1]
  --	[AddressLine2]
  --	[Phone]
  c.[DateFirstPurchase] AS DateFirstPurchase, 
  c.[CommuteDistance],
  g.city AS [Customer City], -- Join in from Geography Table
  g.[StateProvinceCode] AS [State Province Code],
  g.[EnglishCountryRegionName] AS [Customer Country] -- Join in from Geography Table
FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] AS c 
  LEFT JOIN [dbo].[DimGeography] AS g ON g.geographykey = c.geographykey 
WHERE
  g.EnglishCountryRegionName = 'United States'
ORDER BY 
  CustomerKey;