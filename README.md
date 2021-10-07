![plot](https://github.com/bibimchi/whiteplayground.frontend/blob/master/src/asset/favicon.png)

## Docker Recipe

* docker run  --detach --name db -p 5432:5432 -e POSTGRES_USER="kimchi" -e POSTGRES_PASSWORD="spicy" -e POSTGRES_DB="program6" postgres
* docker exec -ti u 0 db bash
* copy paste the content of this file https://github.com/bibimchi/whiteplayground.kubernetes/blob/master/setup.sql
