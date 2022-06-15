-- Cleansed FactInternetSales AND FactResellerSales AS FactSales --
WITH FactSales AS
(SELECT
	[ProductKey], 
	[OrderDateKey], 
	--	[DueDateKey], 
	--	[ShipDateKey], 
	--	[ResellerKey],
	[EmployeeKey] AS CustomerEmployeeKey, -- There are no equal key values beteween Customer and Employee keys
	[PromotionKey], 
	--	[CurrencyKey], 
	[SalesTerritoryKey], 
	[SalesOrderNumber], 
	--	[SalesOrderLineNumber], 
	--	[RevisionNumber], 
	--	[OrderQuantity], 
	[UnitPrice], 
	[ExtendedAmount], 
	--	[UnitPriceDiscountPct], 
	--	[DiscountAmount], 
	[ProductStandardCost], 
	[TotalProductCost], 
	[SalesAmount], 
	--	[TaxAmt], 
	--	[Freight], 
	--	[CarrierTrackingNumber], 
	--	[CustomerPONumber], 
	[OrderDate],
	--	[DueDate], 
	--	[ShipDate]
	'Reseller' AS SaleOrigin
FROM 
	[AdventureWorksDW2019].[dbo].[FactResellerSales]
WHERE LEFT(OrderDateKey, 4) >= '2012' -- Ensure only gets the dates from the last 2 years

UNION ALL

SELECT
	[ProductKey],
    [OrderDateKey],
    --	[DueDateKey],
    --	[ShipDateKey],
    [CustomerKey] AS CustomerEmployeeKey, -- There are no equal key values beteween Customer and Employee keys
    [PromotionKey],
    --	[CurrencyKey],
    [SalesTerritoryKey],
    [SalesOrderNumber],
    --	[SalesOrderLineNumber],
    --	[RevisionNumber],
    --	[OrderQuantity],
    [UnitPrice],
    [ExtendedAmount],
    --	[UnitPriceDiscountPct],
    --	[DiscountAmount],
    [ProductStandardCost],
    [TotalProductCost],
    [SalesAmount],
    --	[TaxAmt],
    --	[Freight]
    --	[CarrierTrackingNumber],
    --	[CustomerPONumber],
    [OrderDate],
    --	[DueDate],
    --	[ShipDate]
	'Internet' AS SaleOrigin
FROM [AdventureWorksDW2019].[dbo].[FactInternetSales]
WHERE LEFT(OrderDateKey, 4) >= '2012' -- Ensure only gets the dates from the last 2 years
)

SELECT 
	fs.[CustomerEmployeeKey],
	fs.[ProductKey], 
	fs.[OrderDateKey], 
	fs.[PromotionKey], 
	fs.[SalesTerritoryKey], 
	fs.[SalesOrderNumber], 
	fs.[UnitPrice], 
	fs.[ExtendedAmount],  
	fs.[ProductStandardCost], 
	fs.[TotalProductCost], 
	fs.[SalesAmount], 
	fs.[OrderDate],
	fs.[SaleOrigin],
	sr.SalesReasonName,
	p.EnglishPromotionName AS PromotionName
FROM FactSales AS fs
	LEFT JOIN dbo.FactInternetSalesReason AS ficr ON fs.SalesOrderNumber = ficr.SalesOrderNumber
	LEFT JOIN dbo.DimSalesReason AS sr ON ficr.SalesReasonKey = sr.SalesReasonKey
	LEFT JOIN [dbo].[DimPromotion] AS p ON fs.PromotionKey = p.PromotionKey 
ORDER BY OrderDateKey