# Character-Rest-API

## Overview

The Character REST API is a Spring Boot application that allows users to create, view, update, delete, and search for characters from different fictional universes. Character information is stored in a PostgreSQL database and accessed through REST API endpoints.

The API includes characters from Marvel, DC, Teenage Mutant Ninja Turtles (TMNT), Overwatch, and Star Wars.

## Features

- Retrieve all characters or a single character by ID.
- Add new characters.
- Update existing character information.
- Delete characters.
- Filter characters by universe.
- Search characters by name using partial, case-insensitive matching.
- Validate required fields.
- Store character information in a PostgreSQL database.
- Deploy the application using Docker and Render.

## Technologies Used

- Java 25
- Spring Boot
- Spring Web
- Spring Data JPA
- Jakarta Bean Validation
- PostgreSQL
- Maven
- Docker
- Render

## Project Structure

The project uses a layered architecture to separate responsibilities.

- **Entity:** Defines the character data and database mapping.
- **Repository:** Communicates with the PostgreSQL database.
- **Service:** Contains the application logic and character operations.
- **Controller:** Handles HTTP requests and returns API responses.

## Character Data Model

The `TvCharacter` entity represents a character stored in the `characters` database table.

| Attribute | Description |
|---|---|
| `characterId` | Unique, automatically generated ID |
| `name` | Character's name; required |
| `description` | Character description; required |
| `universe` | Fictional universe the character belongs to |
| `role` | Character's role |
| `species` | Character's species |

The `name` and `description` fields cannot be blank. Character IDs are generated automatically by the database.

## API Endpoints

Base URL:

`https://character-rest-api-n2db.onrender.com/api/characters`

| Method | Endpoint | Description | Success Status |
|---|---|---|---|
| GET | `/api/characters` | Retrieve all characters | 200 OK |
| GET | `/api/characters/{id}` | Retrieve a character by ID | 200 OK |
| POST | `/api/characters` | Create a new character | 201 Created |
| PUT | `/api/characters/{id}` | Update an existing character | 200 OK |
| DELETE | `/api/characters/{id}` | Delete a character | 204 No Content |
| GET | `/api/characters?universe=Marvel` | Filter characters by universe | 200 OK |
| GET | `/api/characters?name=man` | Search names using partial, case-insensitive matching | 200 OK |

### Example Requests

#### Get All Characters

`GET /api/characters`

Returns a list of all characters in the database.

#### Get One Character

`GET /api/characters/1`

Returns the character with ID `1`, if it exists.

#### Filter by Universe

`GET /api/characters?universe=Marvel`

Returns characters belonging to the Marvel universe.

#### Search by Name

`GET /api/characters?name=man`

Returns characters whose names contain `man`, regardless of capitalization.

#### Create a Character

`POST /api/characters`

Example JSON request body:

```json
{
  "name": "Iron Man",
  "description": "A superhero who uses advanced technology and an armored suit.",
  "universe": "Marvel",
  "role": "Superhero",
  "species": "Human"
}
```

A successful request returns `201 Created` and the new character's information.

#### Update a Character

`PUT /api/characters/1`

Example JSON request body:

```json
{
  "name": "Spider-Man",
  "description": "A superhero who protects people using spider-like abilities.",
  "universe": "Marvel",
  "role": "Superhero",
  "species": "Human"
}
```

A successful request returns `200 OK` and the updated character.

#### Delete a Character

`DELETE /api/characters/1`

A successful request returns `204 No Content`.

## Error Handling and Validation

The API uses the following HTTP status codes:

| Status Code | Meaning |
|---|---|
| `200 OK` | Request completed successfully |
| `201 Created` | Character created successfully |
| `204 No Content` | Character deleted successfully |
| `400 Bad Request` | Required character information is missing or invalid |
| `404 Not Found` | The requested character ID does not exist |

The API validates the required `name` and `description` fields when creating or updating characters.

## Database Configuration

The application uses PostgreSQL for persistent data storage. Database connection information is provided through the `SPRING_DATASOURCE_URL` environment variable rather than being hardcoded into the project.

The application also uses the `PORT` environment variable when provided by the deployment platform.

Example configuration:

```properties
spring.application.name=characterapi
spring.datasource.url=${SPRING_DATASOURCE_URL}
spring.jpa.hibernate.ddl-auto=update
server.port=${PORT:8080}
```

Database credentials and other secrets should not be committed to GitHub.

## Running the Application Locally

### Prerequisites

- Java JDK 25
- Maven wrapper included