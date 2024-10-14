/*We have a database containing sales. Write a stored procedure that takes start and end dates,
along with multiple selected city names, and retrieves the sales accordingly. 
This stored procedure should return two datasets: the first showing the entered filters, 
and the second displaying the query results based on these filters.
*/


CREATE PROC GETCATEGORYSALES
@CITIES AS VARCHAR(100) = 'ÝSTANBUL, ANKARA, ÝZMÝR',
@BEGDATE AS DATE = '20220401',
@ENDDATE AS DATE= '20220601'
AS
DECLARE @PARAMETERS AS VARCHAR(100)
SET @PARAMETERS = '@CITIES=' +@CITIES
SET @PARAMETERS = @PARAMETERS+ ' @BEGDATE=' + CONVERT(varchar,@BEGDATE,104)
SET @PARAMETERS = @PARAMETERS+ ' @ENDDATE=' + CONVERT(varchar,@ENDDATE,104)
SELECT @PARAMETERS AS PARAMETERS

SELECT CATEGORY1 CATEGORY, SUM(TOTALPRICE) TOTALSALES FROM SALES
WHERE CITY IN (SELECT VALUE FROM string_split(@CITIES,',')) AND
DATE_ BETWEEN @BEGDATE AND @ENDDATE
GROUP BY CATEGORY1
ORDER BY 1


EXEC GETCATEGORYSALES @CITIES = 'ADANA,BURSA,HATAY',
@BEGDATE = '20220410', @ENDDATE = '20220530'