# Data Dictionary

The following is an detailed description of the data to be found in each individual column.

1. `team_name`, str: The team on which the player whose shots are listed in the file plays. Both location and nickname are given, e.g. "Golden State Warriors".

2. `game_date`, str: The date of the game in which the shot was taken. Given in MM/DD/YY format.

3. `season`, int: The season in which the shot was taken. Because basketball seasons take place over two calendar years, the year given is the year in which the *first* game was played.

4. `period`, int: The period, or quarter, in which the shot was taken. Can be any integer from 1-4. Shots taken in overtime do not appear to be in the dataset.

5. `minutes_remaining`, int: The number of minutes remaining in the quarter when the shot was taken. Can be any integer from 1 to 11.

6. `seconds_remaining`, int: The number of seconds remaining in the minute in which the shot was taken. Combine with `period` and `minutes_remaining` to get the exact time during the game of the shot. Can be any integer from 0 to 59.

7. `shot_made_flag`, str/bool: Given as `y` if the shot was made, and `n` if it was missed.

8. `action_type`, str: A longform description of the style of shot, such as "Layup Shot". Potentially has key adjectives such as "Cutting Finger Roll Layup Shot" or "Step Back Jump shot".

9. `shot_type`, str: Given as "3PT Field Goal" if the shot was a three-point attempt or "2PT Field Goal" if it was a two-point attempt. Free throws are not included in the dataset.

10. `shot_distance`, int: The length of the distance from the basket to where the shot was taken. Given in feet.

11. `opponent`, str: The team which the shot was taken against. Both location and nickname are given, e.g. "Philadelphia 76ers".

12. `x`, int: The x-coordinate of where the shot was taken. (0,0) is considered to be the basket, and more extreme x values indicate a shot taken closer to the sidelines. Given in inches.

13. `y`, int: The y-coordinate of where the shot was taken. (0,0) is considered to be the basket, and increasing y values indicate a shot taken closer to half-court. Negative values are allowed. Given in inches.
