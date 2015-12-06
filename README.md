# FootballData

A ruby wrapper of [football-data.org](http://api.football-data.org/index)

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

### API Usage

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

### Executable Usage

TODO

## Contributing

Feel free to file an issue of make a pr.
