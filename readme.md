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

#### Discs

Capacity = 0.5 GB/s * 86400 * 365 = 16 PB
Disks_for_capacity = 16PB / 32 ТБ = 500
Disks_for_throughput = 500 МB/s / 100 МB/s = 5
Disks_for_iops = 6K rps / 100 = 6
Disks = max(ceil(Disks_for_capacity), ceil(Disks_for_throughput), ceil(Disks_for_iops)) = 500



#### Hosts

Consider replication as master-slave (one async) with replication factor 2
Sharding: key based by id

`Hosts = disks / disks_per_host`

Hosts = 500 / 2 = 250

`Hosts_with_replication = hosts * replication_factor`

Hosts_with_replication = 250 * 2 = 500  
