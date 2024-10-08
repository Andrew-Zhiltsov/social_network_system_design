# Social network for travelers - System Design



### Functional requirements:

Social network for travelers is is a homework assignment for [System Design course](https:/		balun.courses/courses/system_design).

This social network provides:

- publishing travel posts with photos, a small description and a link to a specific travel destination;
- rating and commenting on other travelers' posts;
- subscribing to other travelers to follow their activity;
- finding popular places to travel and viewing posts from those places;
- viewing other travelers' feeds;

- Authentication

- UI

  - Main page
    - For guests:
      - landing page

      - recommendations by locations

    - Registered user:
      - recommendations by locations
      - subscription feed

  - Search page
    - by location
    - by travelers

  - User profile page (permanent URL)
    - edit for owner
    - subscribe for other users

  - Post editor
    - picture
    - description
    - location

  - Subscriptions editor


  


### Non-functional requirements:

- DAU 10M in one year

- availability 99.99%

- Regions: Commonwealth of Independent States (CIS)

- All data are always stored

- User's behavior

  - Posts: 10 per day
  - Comments: 20 per day
  - Reactions: 30 per day
  - Feeds reading: 30 per day 

- Limitations

  - 100 daily posts per user

- Seasonality

  - Summer vacations (from June to July) -70% of activity
  - Other seasons - 30% of activity

- Publishing post time: 1 sec

- Comment post time: 1 sec

- Reaction post time: 1 sec

  

## Basic calculations:

`RPS = dau * avg_requests_per_day_by_user / 86 400 `

RPS (writing) 

- Posts: 10 000 000 * 10 / 86400 = 1K
- Comments: 10 000 000 * 20 / 86400 = 2K
- Reactions: 10 000 000 * 30 / 86400 = 3K

RPS (reading) 

 - Feeds: 10 000 000 * 30 / 86400 = 3K



`Traffic = rps * avg_request_size`

Traffic (writing) 

- Posts:  1K * 500kb = 0.5GB/s
- Comments:  2K * 500b = 1MB/s
- Reactions:  3K * 10b = 10KB/s

Traffic (reading) 

- Feeds: 3K * 500kb = 1.5GB/s



`Connections = DAU * 0.1`

Connections = 10M * 0.1 = 1M
