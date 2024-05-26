-- url: https://leetcode.com/problems/movie-rating/description/?envType=study-plan-v2&envId=top-sql-50
(
    select u.name as results
    from MovieRating m1
        join Users u on u.user_id = m1.user_id
    group by m1.user_id
    order by count(m1.user_id) desc,
        u.name
    limit 1
)
union all
(
    select m.title as results
    from MovieRating mr
        join Movies m using(movie_id)
    where YEAR(mr.created_at) = 2020
        AND MONTH(mr.created_at) = 2
    group by mr.movie_id
    order by avg(mr.rating) desc,
        m.title asc
    limit 1
)