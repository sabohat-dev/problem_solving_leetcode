WITH sorted_queue AS (
    SELECT person_id, 
           person_name, 
           weight, 
           turn,
           SUM(weight) OVER (ORDER BY turn ASC) AS running_total_weight
    FROM queue
)

SELECT person_name
FROM sorted_queue
WHERE running_total_weight <= 1000
ORDER BY turn desc limit 1;