# Product Search

With product search, a user can enter a search string and the app will lookup that string from Semantics3.

Details:

  - The results are shown in a table.
    - The Price
  - The results from the query are cache by SQL
  - The app is written in a TDD pattern where possible


Bonus features not conducted into:  
  - The app has an administrative interface for...
    - define custom search terms
    - pre-fetch/ cache the API calls manually



## Setup

Before doing the usual rails setup routine, make sure you copy the `config/application.yml.example` file to `config/application.yml` and plug in your semantics3 API credentials.  


```
$ cp config/application.yml.example config/application.yml

$ rake db:migrate
$ rails s
```

## Testing

To run the full test suite, run `rake`.

