# FootballData

A ruby wrapper of [football-data.org](http://api.football-data.org/index),
it also has an executable to get football info from terminal.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'football__data'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install football__data

## Usage

### Executable

You can use `football` from the terminal to get some football info.

```
$ football help # get the help info

# examples
$ football config # config api key, fav team, fav league, etc
$ football table --league=398
Premier League 2015/16  matchday 15
---------------------------------------------------------------------------
R    Team                          P    W    D    L    GF   GA   GD   Pts
---------------------------------------------------------------------------
1    Leicester City FC             15   9    5    1    32   21   11   32
2    Arsenal FC                    15   9    3    3    27   13   14   30
3    Manchester City FC            15   9    2    4    30   16   14   29
......

# you could also add -i to interactive mode, you can see the league id there
# such as:
$ football fixture -i
BL1            1. Bundesliga            394
BL2            2. Bundesliga            395
FL1            Ligue 1                  396
......
Enter the league id of the team: 394
FCB            FC Bayern München             5
HSV            Hamburger SV                  7
......
Enter the team id: 5
2015-12-10 03:45        GNK Dinamo Zagreb    : FC Bayern München   (TBD)
2015-12-12 22:30        FC Bayern München    : FC Ingolstadt 04    (TBD)

# setting fav_league and fav_team would make it much simple
# use football help SUBCOMMAND to see details
```

### API

First you need to configure the api

```ruby
FootballData.configure do |config|
    # get api key at 'http://api.football-data.org/register'
    config.api_key = YOUR_API_KEY

    # default api version is 'alpha' if not setted
    config.api_version = 'alpha'

    # the default control method is 'full' if not setted
    # see request section on 'http://api.football-data.org/documentation'
    config.response_control = 'minified'
end
```

Use `FootballData.fetch(resource, subresource, params)` to fetch the data.
It returns a json parsed object. Such as:

```ruby
# GET 'http://api.football-data.org/v1/soccerseasons'
FootballData.fetch(:soccerseasons)

# GET 'http://api.football-data.org/v1/soccerseasons/398/leagueTable'
FootballData.fetch(:soccerseasons, :leagueTable, id: 398)

# GET 'http://api.football-data.org/v1/soccerseasons/398/fixtures?matchday=8'
FootballData.fetch(:soccerseasons, :fixtures, id: 398, matchday: 8)

res = FootballData.fetch(:teams, :players, id: 57)
pp res['players'].find{|player| player['name'] =~ /Mesut/i}
# {"id"=>1967,
# "name"=>"Mesut Özil",
# "position"=>"Attacking Midfield",
# "jerseyNumber"=>11,
# "dateOfBirth"=>"1988-10-15",
# "nationality"=>"Germany",
# "contractUntil"=>"2018-06-30",
# "marketValue"=>"40,000,000 €"}
```

See api structure on page 'http://api.football-data.org/documentation'


## Contributing

Feel free to file an issue of make a pr.
