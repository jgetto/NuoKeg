NuoKeg
======

NuoKeg is a NuoDB backed Rails app that I originally wrote to keep track of the beer on tap at the NuoDB office. It wound up being a reasonable example of using NuoDB with Rails so I'm putting it up as an example. 


## Prerequisites 
You'll need a few things if you want to run your own NuoKeg

1. An install of [NuoDB](http://www.nuodb.com/account) 
2. An API key from [BreweryDB](http://www.brewerydb.com/)
3. (Optional) [Twitter API Keys](https://dev.twitter.com/apps/new)

## Setup
#### 1. Start your NuoDB database
Currently, the NuoDB ActiveRecord Adapter does not support the `rake db:create` task. However it is easy to startup a NuoDB database manually using the command line NuoDB Manager tool.

```bash
java -jar /opt/nuodb/jar/nuodbmanager.jar --broker localhost --user domain --password bird --command "start process sm host localhost database nuokeg-dev archive /var/opt/nuodb/production-archives/nuokeg-dev initialize yes"

java -jar /opt/nuodb/jar/nuodbmanager.jar --broker localhost --user domain --password bird --command "start process te host localhost database nuokeg-dev options '--dba-user dab --dba-password dba'"
```


#### 2. Configure your app
If you ran the previous two commands exactly as they are your `database.yml` is already good to go. If you changed the database name or dba credentials you will need to update it accordingly. 

```yml
development:
  adapter: nuodb
  database: nuokeg-dev@localhost
  username: dba
  password: dba
  schema: nuokeg
```

#### 3. Create the schema
Make sure you have the necessary gems (including the [NuoDB Ruby Driver](https://github.com/nuodb/ruby-nuodb) and the [ActiveRecord Adapter](https://github.com/nuodb/ruby-activerecord-nuodb-adapter)) installed by running a `bundle install` and then create the NuoKeg schema with `rake db:migrate`.

#### 4. Setup Keys
NuoKeg expects to find the API keys that it needs in environment variables. You can set them in a ruby config file

```
ENV["BREWERY_DB_KEY"]="YOURKEY"
ENV["TWITTER_CONSUMER_KEY"]="YOURKEY"
ENV["TWITTER_CONSUMER_SECRET"]="YOURKEY"
ENV["TWITTER_OAUTH_TOKEN"]="YOURKEY"
ENV["TWITTER_OAUTH_TOKEN_SECRET"]="YOURKEY"
```

bash

```bash
export BREWERY_DB_KEY=YOURKEY
export TWITTER_CONSUMER_KEY=YOURKEY
export TWITTER_CONSUMER_SECRET=YOURKEY
export TWITTER_OAUTH_TOKEN=YOURKEY
export TWITTER_OAUTH_TOKEN_SECRET=YOURKEY
```

or using something like [Foreman](https://github.com/ddollar/foreman)

#### 5. Run NuoKeg
Start NuoKeg by running `rails server` and enjoy!