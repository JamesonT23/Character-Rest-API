# Character REST API

## Description
This project is a REST API built with Spring Boot that lets users view, add, update, delete, and search for characters from different fictional universes. It uses a PostgreSQL database to store character information.

## Character Attributes

| Attribute | Type | Rules |
|---|---|---|
| `characterId` | Long | Automatically generated ID |
| `name` | String | Required; cannot be blank |
| `description` | String | Required; cannot be blank |
| `universe` | String | Optional |
| `role` | String | Optional |
| `species` | String | Optional |

## API Endpoints

Base path: `/api/characters`

| Method | Path | Description | Success Status |
|---|---|---|---|
| GET | `/api/characters` | Get all characters | 200 OK |
| GET | `/api/characters/{id}` | Get a character by ID | 200 OK |
| POST | `/api/characters` | Add a character | 201 Created |
| PUT | `/api/characters/{id}` | Update a character | 200 OK |
| DELETE | `/api/characters/{id}` | Delete a character | 204 No Content |
| GET | `/api/characters?universe=Marvel` | Search by universe | 200 OK |
| GET | `/api/characters?name=man` | Search by part of a name | 200 OK |

### POST Example

`POST /api/characters`

```json
{
  "name": "Iron Man",
  "description": "A superhero who uses an armored suit.",
  "universe": "Marvel",
  "role": "Superhero",
  "species": "Human"
}
```

### PUT Example

`PUT /api/characters/1`

```json
{
  "name": "Spider-Man",
  "description": "A superhero who protects people with spider-like abilities.",
  "universe": "Marvel",
  "role": "Superhero",
  "species": "Human"
}
```

## Deployed API

[View the Character REST API on Render](https://character-rest-api-n2db.onrender.com/api/characters)

**Note:** The free Render service sleeps when idle, so the first request after inactivity can take up to a minute to respond.

