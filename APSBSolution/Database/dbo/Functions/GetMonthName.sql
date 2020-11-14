-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================

CREATE FUNCTION GetMonthName
(
-- Add the parameters for the function here
@MonthNumber INT
)
RETURNS VARCHAR(3)
AS
	BEGIN
	    -- Declare the return variable here
	    DECLARE @MonthName VARCHAR(3);

	    -- Add the T-SQL statements to compute the return value here
	    SELECT @MonthName = CASE
						   WHEN @MonthNumber = 1
						   THEN 'Jan'
						   WHEN @MonthNumber = 2
						   THEN 'Fev'
						   WHEN @MonthNumber = 3
						   THEN 'Mar'
						   WHEN @MonthNumber = 4
						   THEN 'Abr'
						   WHEN @MonthNumber = 5
						   THEN 'Mai'
						   WHEN @MonthNumber = 6
						   THEN 'Jun'
						   WHEN @MonthNumber = 7
						   THEN 'Jul'
						   WHEN @MonthNumber = 8
						   THEN 'Ago'
						   WHEN @MonthNumber = 9
						   THEN 'Set'
						   WHEN @MonthNumber = 10
						   THEN 'Out'
						   WHEN @MonthNumber = 11
						   THEN 'Nov'
						   WHEN @MonthNumber = 12
						   THEN 'Dez'
					    END;

	    -- Return the result of the function
	    RETURN @MonthName;
	END;