## Build
```
make docker
```


## Run
See in git@github.com:Pumgrana/docker.git repository


## Routes

### User
#### Create
```
curl -H "Content-Type: application/json" -X POST -d '{"email":"test@test.com","password":"12345678"}' http://localhost:3000/auth/
```
#### Sign in
```
curl -v -H "Content-Type: application/json" -X POST -d '{"email":"test@test.com","password":"12345678"}' http://localhost:3000/auth/sign_in
```
#### Validate
```
curl -v -H "Content-Type: application/json" -X POST -d '{"access-token":"lokCml393J_bvUZKvvZK_g","uid":"test@test.com","client":"iZBty-kK5VjhJJyQc6ch-A"}' http://localhost:3000/auth/sign_in
```

### Histories
#### Get
```
curl -X GET http://localhost:3000/histories
```
#### Create
```
curl -X POST -d '{"content":"dummy"}' http://localhost:3000/histories
```
#### Delete
```
curl -X DELETE http://localhost:3000/histories/:id
```
