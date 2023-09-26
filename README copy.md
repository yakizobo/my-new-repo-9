## Prequisite

Java Amazon Corretto 17: `https://docs.aws.amazon.com/corretto/latest/corretto-17-ug/downloads-list.html` <br/>
Docker: `$ brew install --cask docker` <br/>
Maven: `$ brew install maven` <br/>
<hr/>

### How to run on local
Start docker container

```shell
$ docker compose up -d
```

Export environment variable from `.env.local` to terminal
[reference](https://andrew.red/posts/how-to-load-dotenv-file-from-shell)

```shell
$ set -a; source .env.local; set +a
```

Then run localhost

```shell
$ mvn spring-boot:run
```

Note: please make sure datasource is correct!

<hr/>

# REST API

The REST API for SweepManage is described below
## Authenticate
### User Signup

POST /auth/signup
<br>
Accept :
```
{
    username: String
    password: String
}
```

### User Signin

POST /auth/signin
<br>
Accept :
```
{
    username: String,
    password: String
}
```
Response :
```
{
    "tokenType":"Bearer",
    "token": jwtToken
}
```

### (Temporary) to test Authenticatiom