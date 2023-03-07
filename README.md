# shiny-one application
Testing, shiny app in a docker-container

## using quay.io/  for storing docker-images
- ``` https://quay.io/ ```
- repos: ``` https://quay.io/repository/ingimar/shiny?tab=tags ```

1. docker login quay.io
2. pull - docker pull quay.io/ingimar/shiny:v1.1 


# Prod- and test-environment
1. machine : nrm-shiny-esbase 
2. user: research
3. dir: ```/home/research/repositories/shiny-one```

## Starting up.
2 instances need to be started up (1) the database and (2) the shiny 
-  ```make docker-db```
-  ```docker-app```

