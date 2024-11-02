WITH DailyTotal AS (
    SELECT 
        visited_on,
        SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS total_amount,
        COUNT(*) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS cnt
    FROM 
        (SELECT visited_on, SUM(amount) AS amount FROM Customer GROUP BY visited_on) AS DailySums
)
SELECT 
    visited_on,
    total_amount AS amount,
    ROUND(total_amount / 7.0, 2) AS average_amount
FROM 
    DailyTotal
WHERE 
    cnt = 7
ORDER BY 
    visited_on;