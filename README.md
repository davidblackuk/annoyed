# annoyed
A simple game using cpc telera





## todo

- power ups
    - bigger bat
    - door to next level
    - multi ball
    - laster blaster
- debug place ball code?
- game fail screen
- game complete celibration
- implement hi score (score works, but high_score is a hardcoded
  1000 in main.c - never compared/updated/persisted)


## done
- move writing to font based not big sprites
- score
- Ball and bat are masked sprites
- level completion and falure logic
- move block tile removal to remove background via a queue of some sort
- ball background replace, moved to copy and replace, not tile based
- bat/ball bounce has personality - paddle angle now varies by which
  of the 4 bat segments is hit (bat_bounce_ball in src/bat.c)
- block physics - directional corner sampling in blocks_bounce_ball
