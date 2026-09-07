# extract data

**Overview**

The `extract_data` endpoint initiates a data extraction process for transactions within a specified date range. It starts a crawler that fetches and processes the data asynchronously.\
this endpoint is used by the Advantive one project connector and helps upload Pepperi data into the Advantive One platform.

* **URL**: https://api.pepperi.com/adf\_connector/extract\_data
* **HTTP Method**: `POST`

**Request Body**

The request body must be a JSON object containing the start and end dates for the data extraction.

| Field  | Type     | Description                                                       |
| ------ | -------- | ----------------------------------------------------------------- |
| `From` | `string` | The start date in ISO 8601 format (e.g., `YYYY-MM-DDTHH:mm:ssZ`). |
| `To`   | `string` | The end date in ISO 8601 format (e.g., `YYYY-MM-DDTHH:mm:ssZ`).   |

**Example:**

```json
{
  "From": "2023-01-01T00:00:00Z",
  "To": "2023-01-31T23:59:59Z"
}
```

**Responses**

**Success Response**

* **Status Code**: `200 OK`
* **Content**: A JSON object containing the execution UUID of the crawler.

**Example:**

```json
{
  "ExecutionUUID": "a1b2c3d4-e5f6-7890-1234-567890abcdef"
}
```

**Error Response**

* **Status Code**: `500 Internal Server Error`
* **Content**: An error message indicating that the method is not supported if a `POST` request is not used.

**Example:**

```json
{
  "error": "Method GET not supported for data extraction."
}
```
