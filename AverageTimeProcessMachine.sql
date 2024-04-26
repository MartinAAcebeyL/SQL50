-- https://leetcode.com/problems/average-time-of-process-per-machine/description/?envType=study-plan-v2&envId=top-sql-50
select Activity.machine_id,
    ROUND(avg(a_end.timestamp - a_start.timestamp), 3) as processing_time
from Activity
    join Activity a_start on a_start.machine_id = Activity.machine_id
    and a_start.activity_type = "start"
    join Activity a_end on a_end.machine_id = Activity.machine_id
    and a_end.activity_type = "end"
group by Activity.machine_id