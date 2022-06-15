-- Cleansed FactCallCenter --
SELECT 
	--	[FactCallCenterID]
	[DateKey],
	[WageType],
	[Shift],
	--	[LevelOneOperators],
	--	[LevelTwoOperators],
	[TotalOperators],
	[Calls],
	[AutomaticResponses],
	[Orders],
	[IssuesRaised],
	[AverageTimePerIssue], -- average time to solve an issue
	[ServiceGrade] AS PercOfBlockedCalls,	-- is the probability of a call in a circuit group being blocked or delayed for more than a specified interval
	CAST(CEILING([ServiceGrade] * [Calls]) AS NUMERIC(18, 0)) AS BlokedCalls, 
	-- As The division beteween servideGrade and Calls returns must be an integer, the number of bloked calls were round up
	-- For example, 1,1 blocked calls must be at least 2 blocked calls
	[Date]
FROM [AdventureWorksDW2019].[dbo].[FactCallCenter]
-- There are only information from 2014