-- Cleansed Dim_Product --
SELECT 
  p.[ProductKey], 
  p.[ProductAlternateKey], 
  --	[ProductSubcategoryKey], 
  --	[WeightUnitMeasureCode], 
  --	[SizeUnitMeasureCode], 
  p.[EnglishProductName] AS [Product Name], 
  pc.EnglishProductCategoryName AS [Product Category Name], -- Join in from Category Table
  ps.EnglishProductSubcategoryName AS [Product Subcategory Name], -- Join in from Sub Category Table
  --	[SpanishProductName], 
  --	[FrenchProductName], 
  --	[StandardCost], 
  --	[FinishedGoodsFlag], 
  --	[Color] AS [Product Color], 
  p.[SafetyStockLevel] AS [Safety Stock Level], 
  p.[ReorderPoint] AS [Reorder Point], 
  p.[ListPrice] AS [Product Price], 
  --	[Size] AS [Product Size], 
  --	[SizeRange], 
  --	[Weight], 
  p.[DaysToManufacture], 
  --	[ProductLine], 
  p.[DealerPrice], 
  --	[Class], 
  --	[Style], 
  p.[ModelName] AS [Product Model Name], 
  p.[LargePhoto], 
  p.[EnglishDescription] AS [Product Description],
  --	[FrenchDescription], 
  --	[ChineseDescription], 
  --	[ArabicDescription], 
  --	[HebrewDescription], 
  --	[ThaiDescription], 
  --	[GermanDescription], 
  --	[JapaneseDescription], 
  --	[TurkishDescription], 
  --	[StartDate], 
  --	[EndDate], 
  ISNULL (p.[Status], 'Outdated') AS [Product Status] 
FROM 
  [AdventureWorksDW2019].[dbo].[DimProduct] AS p 
  LEFT JOIN [AdventureWorksDW2019].[dbo].[DimProductSubcategory] AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey 
  LEFT JOIN [AdventureWorksDW2019].[dbo].[DimProductCategory] AS pc ON ps.ProductCategoryKey = pc.ProductCategoryKey 
ORDER BY 
  p.ProductKey ASC;