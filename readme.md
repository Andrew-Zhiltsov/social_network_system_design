# Social network for travelers - System Design



Social network for travelers is is a homework assignment for [System Design course](https:/		balun.courses/courses/system_design).

This social network provides:

- publishing travel posts with photos, a small description and a link to a specific travel destination;
- rating and commenting on other travelers' posts;
- subscribing to other travelers to follow their activity;
- finding popular places to travel and viewing posts from those places;
- viewing other travelers' feeds;



### Functional requirements:

- Authentication

- Main page

  - For guests:

    - landing page

    - recommendations by locations, by rating

  - Registered user:

    - recommendations by locations, by rating
    - subscription feed
    - rate and comment post

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

- availability 99.0%

- Regions: Commonwealth of Independent States (CIS)

- All data are always stored

- User's behavior

  - Posts: 10 per day
  - Feeds reading: 30 per day 

- Limitations

  - 100 daily posts per user

- Seasonality

  - Summer vacations

- Publishing post time: 10 sec

  

## Basic calculations:

`RPS = dau * avg_requests_per_day_by_user / 86 400 `

RPS = 10 000 000 * 40 / 86400 = 4.6K



`Traffic = rps * avg_request_size`

Traffic = 4.6K * 500kb = 2.3GB/s



`Connections = DAU * 0.1`

Connections = 10M * 0.1 = 1M
