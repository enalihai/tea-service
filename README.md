# Tea Service API  
Thank you for visiting my Tea Service API. This is a takehome challenge given by Turing School of Software and Design.  

The purpose of this takehome challenge is to create endpoints for a Front End team to consume.  
<p>
  <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />
  <img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />
</p>

<p>
  <img src="https://img.shields.io/badge/Postman-FF6E4F.svg?&style=flat&logo=postman&logoColor=white" />  
  <img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1.svg?&style=flaste&logo=postgresql&logoColor=white" />
  </br>
  <img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/rspec--rails-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/MVC-b8b018.svg?&style=flaste&logo=MVC&logoColor=white" />
  <img src="https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white" />
  <img src="https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white" />  
  <img src="https://img.shields.io/badge/OOP-b81818.svg?&style=flaste&logo=OOP&logoColor=white" />
</p>  

## Expected Endpoints  
1. Subscribe a Customer to a Tea Subscription
2. Cancel a Customer's Tea Subscription
3. See all of a Customer's Subscriptions both active and cancelled


## Project Constraints  
- 8 hours to create 3 endpoints

- Clear Documentation

- Project Boards Used  

- Restful Routes only  

- Full TDD  

- Explain OOP design descions  

## Project Schema  
![tea_db](https://user-images.githubusercontent.com/5219578/190591152-4578d925-39e5-4da3-bbc4-abc008477ec9.png)
- I decided to use Subscriptions as the connection between customers and tea, instead of having multiple joins tables, I was able to use a minimal database to accomplish my task.  

## Seeded Database Setup  
![seedfile](https://user-images.githubusercontent.com/5219578/191053237-7067171a-0200-4efc-b5d4-afe6a7780fb1.png)
## SimpleCov Testing  
![simplecov](https://user-images.githubusercontent.com/5219578/190598508-5f9cf34b-7152-495c-86a4-8fdaf3f41fa3.png)
## Project Local Setup
- fork then clone the `tea-service repository`  
- move into the directory by entering `cd tea-service`  
- install the gemfile with `bundle install`  
- setup the database with `rails db:{create,migrate,seed}`  
- start your server with `rails s` it is setup to be run on `localhost:3000`  

## Continuous Integration
- I decided to use CircleCI for my project to make sure that my PR would not muddle my existing code. After each check that was green, I knew my code was good to deploy.  
![circleCI](https://user-images.githubusercontent.com/5219578/191060583-ea4f50f5-c20c-4735-a225-b708c83a2a00.png)
## Endpoints  
 ___
 `POST /api/v1/customers/1/subscriptions`  
 Sending a POST request to the endpoint, will create and save a JSON response for the FE team.
 #### POST returns  

 ![postreq](https://user-images.githubusercontent.com/5219578/191058578-5a518f41-5388-406f-96ec-88cec1555737.png)  

 ![postpostman](https://user-images.githubusercontent.com/5219578/191058858-3484e1ba-a756-4781-9303-6d91501d9e17.png)  

 ```json
 {
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "title": "Foe Hammer Kick = weekly subscription for Luke",
            "price": 400,
            "frequency": "weekly",
            "status": "active"
        }
    }
}
``` 
___
`PATCH /api/v1/customers/1/subscriptions/1`  
Sending a PATCH request, will update the customers subscription to either active or cancelled.
#### PATCH returns  

![patchreq](https://user-images.githubusercontent.com/5219578/191058559-3989b46d-89e6-4e2e-9c8a-51e93d77c384.png)  

![patchpostman](https://user-images.githubusercontent.com/5219578/191058832-75d846f4-a707-45ce-830f-901e7fadd6d0.png)  

```json
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "title": "Foe Hammer Kick = weekly subscription for Luke",
            "price": 400,
            "frequency": "weekly",
            "status": "cancelled"
        }
    }
}
```

___  
`GET /api/v1/customers/1/subscriptions`  
 Sending a GET request to the endpoint, will return the proper JSON response. 
#### GET returns  

![getreq](https://user-images.githubusercontent.com/5219578/191058542-61f50f22-748d-4a06-99f3-91774e5d3f88.png)  

![getpostman](https://user-images.githubusercontent.com/5219578/191058814-3a7ea408-a2e4-4503-806b-fde9a41e9779.png)  

```json
{
  "data": [
    {
      "id": "1",
      "type": "subscription",
      "attributes": {
          "title": "Foe Hammer Kick = weekly subscription for Luke",
          "price": 400,
          "frequency": "weekly",
          "status": "active"
      }
    },
    {
      "id": "1",
      "type": "subscription",
      "attributes": {
          "title": "Apolyon, the Soul-Render = weekly subscription for Luke",
          "price": 400,
          "frequency": "weekly",
          "status": "active"
      }
    }
  ]
}
```