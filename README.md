# pre-req.
## Export the schema (with no data)
- docker exec -i mysql bash -l -c "mysqldump -uroot -psupersecret --no-data mgg2" > ./mgg2-schema_no-data.sql 

## Export the Lookup-tables.
- docker exec -i mysql bash -l -c "mysqldump -u root -psupersecret mgg2 catalog species discovery project --skip-comments --no-create-info --compact" > ./testing.sql 

# shiny-one application
Testing, shiny app in a docker-container

## using quay.io/  for storing docker-images
- URL: ``` https://quay.io/ ```
- repos: ``` https://quay.io/repository/ingimar/shiny?tab=tags ```

1. docker login quay.io
2. pull - docker pull quay.io/ingimar/shiny:v1.1 


# Prod- and test-environment
1. machine : x
2. user: y
3. dir: ```/home/y/repositories/shiny-one```

where 'x' and 'y' needs to be replaced

## Starting up.
2 instances need to be started up (1) the database and (2) the shiny 
-  ``` make docker-db ```
-  ``` make docker-app ```


### startup.sh

```
#!/bin/bash
make docker-db&
sleep 5s
make docker-app&
```   
