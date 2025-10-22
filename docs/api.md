# FSM Backend API Documentation

> **For AI Coding Agents**: This document provides a complete reference for all available APIs in the Field Service Management (FSM) backend system. The APIs follow REST principles with JWT authentication and role-based access control.

## Table of Contents
- [Architecture Overview](#architecture-overview)
- [Authentication & Authorization](#authentication--authorization)
- [API Endpoints](#api-endpoints)
  - [Authentication APIs](#authentication-apis)
  - [User Management APIs](#user-management-apis)
  - [Service Request APIs](#service-request-apis)
  - [Work Order APIs](#work-order-apis)
  - [Review APIs](#review-apis)
  - [Inventory APIs](#inventory-apis)
  - [Document APIs](#document-apis)
  - [Work Order Image APIs](#work-order-image-apis)
  - [Audit Log APIs](#audit-log-apis)
  - [Customer Asset APIs](#customer-asset-apis)
  - [Session APIs](#session-apis)
  - [Integration APIs](#integration-apis)
  - [Technician APIs](#technician-apis)
- [Common Patterns](#common-patterns)
- [Error Handling](#error-handling)

---

## Architecture Overview

**Tech Stack**: Node.js + Express + Sequelize + MySQL + JWT + Azure Blob Storage

**Base URL**: `http://localhost:5000` (development)

**Key Concepts**:
- **Service Request (SR)**: Customer request for service (breakdown, maintenance, parts enquiry, general enquiry)
- **Work Order (WO)**: Actionable task created under an SR, assigned to Field Service Engineers (FSEs)
- **FSE/Technician**: Field service engineers who execute work orders
- **Roles**: Manager, Helpdesk Agent, Inventory Manager, Technician (FSE)

**Data Flow**:
1. Helpdesk creates Service Request → Manager creates Work Order → Manager/Helpdesk assigns Technician
2. Technician starts → pauses → resumes → completes Work Order (with images, GPS, signature)
3. Manager requests review → Customer submits review → Manager closes Service Request

---

## Authentication & Authorization

### Authentication Method
All protected endpoints require a JWT Bearer token in the header:
```
Authorization: Bearer <your_jwt_token>
```

### User Roles
| Role ID | Role Name | Capabilities |
|---------|-----------|--------------|
| 1 | Manager | Full access: manage users, assign technicians, close SRs |
| 2 | Helpdesk Agent | Create SRs, create WOs, assign WOs, request reviews |
| 3 | Inventory Manager | Manage parts and inventory |
| 4 | Technician (FSE) | View, start, pause, resume, complete WOs; self-assign WOs |

---

## API Endpoints

---

## Authentication APIs

### 1. Login
**Endpoint**: `POST /api/auth/login`

**Description**: Authenticate user and receive access token and refresh token.

**Authentication**: None (public endpoint)

**Request Body**:
```json
{
  "email": "test@example.com",
  "password": "test1234"
}
```

**Response (200 OK)**:
```json
{
  "message": "Login successful",
  "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": 1,
    "email": "test@example.com",
    "first_name": "John",
    "last_name": "Doe",
    "role_id": 2,
    "role": {
      "id": 2,
      "name": "helpdesk"
    }
  }
}
```

**Error (401 Unauthorized)**:
```json
{
  "message": "Invalid credentials"
}
```

---

### 2. Refresh Token
**Endpoint**: `POST /api/auth/refresh-token`

**Description**: Get a new access token using a valid refresh token.

**Authentication**: None (public endpoint)

**Request Body**:
```json
{
  "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**Response (200 OK)**:
```json
{
  "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**Error (401 Unauthorized)**:
```json
{
  "message": "Invalid refresh token"
}
```

---

## User Management APIs

### 3. Create User
**Endpoint**: `POST /api/users`

**Description**: Create a new user. If creating a Technician (role_id=4), additional FSE profile fields are required.

**Authentication**: Required (Manager only)

**Request Body**:
```json
{
  "first_name": "Jane",
  "last_name": "Smith",
  "email": "jane.smith@example.com",
  "phone": "1234567890",
  "gender": "female",
  "city": "Los Angeles",
  "dob": "1990-05-15",
  "role_id": 4,
  "status": "active",
  
  // Required if role_id = 4 (Technician)
  "service_territory": "Downtown LA",
  "postal_code": "90001",
  
  // Optional FSE fields
  "specialization": ["forklifts", "hydraulics"],
  "experience_years": 5,
  "service_radius_km": 10,
  "max_active_workorders": 5
}
```

**Response (201 Created)**:
```json
{
  "message": "User created successfully. Default password: 123456",
  "user": {
    "id": 15,
    "email": "jane.smith@example.com",
    "first_name": "Jane",
    "last_name": "Smith",
    "role_id": 4
  }
}
```

**Errors**:
- `400`: Missing required fields
- `409`: User already exists

---

### 4. Get All Users
**Endpoint**: `GET /api/users`

**Description**: Retrieve all users except managers (role_id=1).

**Authentication**: Required (Manager only)

**Response (200 OK)**:
```json
{
  "total": 10,
  "users": [
    {
      "id": 2,
      "first_name": "John",
      "last_name": "Doe",
      "email": "john@example.com",
      "phone": "9876543210",
      "city": "New York",
      "role_id": 2,
      "status": "active",
      "role": {
        "id": 2,
        "name": "helpdesk"
      }
    }
  ]
}
```

---

### 5. Get Current User Profile
**Endpoint**: `GET /api/users/me`

**Description**: Get profile details of the currently logged-in user.

**Authentication**: Required (All roles)

**Response (200 OK)**:
```json
{
  "id": 3,
  "email": "user@example.com",
  "first_name": "Alice",
  "last_name": "Johnson",
  "phone": "5551234567",
  "city": "Chicago",
  "role_id": 2,
  "status": "active",
  "role": {
    "id": 2,
    "name": "helpdesk"
  }
}
```

---

### 6. Update User Status
**Endpoint**: `PATCH /api/users/{id}/status`

**Description**: Update user status to active or blocked.

**Authentication**: Required (Manager only)

**Request Body**:
```json
{
  "status": "blocked"
}
```

**Response (200 OK)**:
```json
{
  "message": "User status updated successfully"
}
```

**Errors**:
- `403`: Cannot update manager status
- `404`: User not found

---

### 7. Update User Details
**Endpoint**: `PATCH /api/users/{id}`

**Description**: Update user details. Can update FSE profile fields if user is a technician.

**Authentication**: Required (Manager or Super Admin only)

**Request Body**:
```json
{
  "first_name": "Jane",
  "last_name": "Doe",
  "phone": "9998887777",
  "email": "jane.updated@example.com",
  "city": "San Francisco",
  
  // FSE-specific fields (if role_id=4)
  "service_territory": "West SF",
  "specialization": ["electrical", "plumbing"],
  "experience_years": 7,
  "is_available": true
}
```

**Response (200 OK)**:
```json
{
  "message": "User updated successfully"
}
```

---

### 8. Get Technicians for Assignment
**Endpoint**: `GET /api/users/technicians`

**Description**: Get all technicians with workload info, rejection history, and auto-assignment score for a specific work order.

**Authentication**: Required (Manager or Helpdesk only)

**Query Parameters**:
- `visit_date` (required): Visit date to check availability (YYYY-MM-DD)
- `wo_id` (required): Work order ID to exclude FSEs who rejected it

**Example Request**:
```
GET /api/users/technicians?visit_date=2025-10-25&wo_id=123
```

**Response (200 OK)**:
```json
{
  "technicians": [
    {
      "id": 15,
      "first_name": "Jane",
      "last_name": "Smith",
      "email": "jane@example.com",
      "phone": "1234567890",
      "city": "Los Angeles",
      "specialization": ["forklifts", "hydraulics"],
      "max_active_workorders": 5,
      "assigned_on_visit_date": 2,
      "available_for_visit_date": true,
      "is_available": true,
      "has_rejected_this_wo": false,
      "score": 85,
      "score_breakdown": {
        "specialization": true,
        "locationScore": 50,
        "workload": "2/5"
      }
    }
  ]
}
```

**Errors**:
- `400`: Missing visit_date or wo_id
- `404`: Work order not found

---

### 9. Reset Password
**Endpoint**: `POST /api/users/reset-password`

**Description**: Reset user password using old password.

**Authentication**: None (public endpoint)

**Request Body**:
```json
{
  "email": "user@example.com",
  "old_password": "oldpass123",
  "new_password": "newpass456"
}
```

**Response (200 OK)**:
```json
{
  "message": "Password updated successfully"
}
```

**Errors**:
- `401`: Old password is incorrect
- `404`: User not found

---

## Service Request APIs

### 10. Create Service Request
**Endpoint**: `POST /api/service-requests`

**Description**: Create a new service request. The system automatically handles customer asset tracking and determines if the customer is new or existing.

**Authentication**: Required (Helpdesk or Manager only)

**Request Body**:
```json
{
  "sr_type": "repair",
  "summary": "Forklift engine failure",
  "issue_description": "The forklift engine stopped working during operation",
  "priority": "high",
  "machine_serial": "FL-12345",
  "model": "Atlas-2000",
  "customer_name": "ABC Corporation",
  "customer_email": "contact@abccorp.com",
  "customer_phone": "5551234567",
  "location": "Warehouse A, Downtown LA",
  "postal_code": "90001",
  "service_territory": "Downtown LA",
  "machine_type": "Forklift",
  "year_of_manufacture": "2020",
  "under_warranty": "yes",
  "purchase_date": "2020-03-15",
  "commission_date": "2020-03-20",
  "visit_date": "2025-10-25"
}
```

**Response (201 Created)**:
```json
{
  "message": "Service request created successfully",
  "serviceRequest": {
    "id": 45,
    "sr_number": "SR-20251022-0001",
    "sr_type": "repair",
    "summary": "Forklift engine failure",
    "priority": "high",
    "status": "New",
    "created_by": 2
  }
}
```

**SR Types**:
- `repair`: Breakdown/repair request
- `maintenance`: Scheduled maintenance
- `parts_enquiry`: Parts availability query
- `general_enquiry`: General questions

**Priority Levels**: `low`, `medium`, `high`

---

### 11. Update Service Request
**Endpoint**: `PATCH /api/service-requests/{id}`

**Description**: Update editable fields of a service request.

**Authentication**: Required (Manager or Helpdesk only)

**Request Body**:
```json
{
  "summary": "Updated summary",
  "priority": "medium",
  "visit_date": "2025-10-28",
  "location": "New location address"
}
```

**Response (200 OK)**:
```json
{
  "message": "Service request updated successfully"
}
```

**Errors**:
- `403`: Update not allowed for current SR status
- `404`: SR not found

---

### 12. Get All Service Requests
**Endpoint**: `GET /api/service-requests`

**Description**: Get all service requests with filters, pagination, and search.

**Authentication**: Required (Helpdesk or Manager only)

**Query Parameters**:
- `page` (integer): Page number (default: 1)
- `limit` (integer): Items per page (default: 10)
- `keyword` (string): Search keyword
- `sr_prefix` (string): Filter by SR type prefix (SR, GE, PE)
  - `SR`: Breakdown or Maintenance
  - `GE`: General Enquiry
  - `PE`: Parts Enquiry

**Example Request**:
```
GET /api/service-requests?page=1&limit=10&keyword=forklift&sr_prefix=SR
```

**Response (200 OK)**:
```json
{
  "total": 45,
  "page": 1,
  "pages": 5,
  "service_requests": [
    {
      "id": 1,
      "sr_number": "SR-20251022-0001",
      "sr_type": "repair",
      "summary": "Forklift engine failure",
      "issue_description": "Engine stopped working",
      "priority": "high",
      "status": "New",
      "review_requested": false,
      "is_review_submitted": false,
      "visit_date": "2025-10-25",
      "createdAt": "2025-10-22T10:00:00.000Z",
      "creator": {
        "id": 2,
        "first_name": "John",
        "email": "john@example.com"
      }
    }
  ]
}
```

---

### 13. Request Customer Review
**Endpoint**: `PATCH /api/service-requests/{id}/request-review`

**Description**: Mark service request as review requested and send email to customer.

**Authentication**: Required (Manager only)

**Response (200 OK)**:
```json
{
  "message": "Review request marked successfully"
}
```

---

### 14. Close Service Request
**Endpoint**: `PATCH /api/service-requests/{id}/close`

**Description**: Close a service request after validation (all WOs must be completed and review must be submitted).

**Authentication**: Required (Manager only)

**Response (200 OK)**:
```json
{
  "message": "Service request closed successfully"
}
```

**Errors**:
- `400`: Work orders incomplete or no review submitted

---

### 15. Get Status Count
**Endpoint**: `GET /api/service-requests/status-count`

**Description**: Get count of service requests grouped by status.

**Authentication**: Required (Manager, Helpdesk, or Super Admin only)

**Response (200 OK)**:
```json
{
  "statusCounts": {
    "new": 5,
    "assigned": 3,
    "in_progress": 2,
    "paused": 1,
    "resolved": 4,
    "closed": 6
  }
}
```

---

### 16. Get Dashboard Stats
**Endpoint**: `GET /api/service-requests/dashboard-stats`

**Description**: Get full dashboard statistics including status, priority, warranty, and review sentiment counts.

**Authentication**: Required (Manager, Helpdesk, or Super Admin only)

**Query Parameters**:
- `from` (required): Start date (YYYY-MM-DD)
- `to` (optional): End date (YYYY-MM-DD, defaults to today)

**Example Request**:
```
GET /api/service-requests/dashboard-stats?from=2025-10-01&to=2025-10-31
```

**Response (200 OK)**:
```json
{
  "statusCounts": {
    "new": 3,
    "assigned": 2,
    "in_progress": 5,
    "resolved": 4,
    "closed": 6,
    "total": 20
  },
  "priorityCounts": {
    "high": 6,
    "medium": 8,
    "low": 6,
    "total": 20
  },
  "warrantyCounts": {
    "under_warranty": 11,
    "out_of_warranty": 9
  },
  "reviewSentiment": {
    "happy": 10,
    "neutral": 5,
    "unhappy": 3
  },
  "date_range": {
    "from": "2025-10-01",
    "to": "2025-10-31"
  }
}
```

---

## Work Order APIs

### 17. Create Work Order
**Endpoint**: `POST /api/work-orders`

**Description**: Create a work order under an existing service request.

**Authentication**: Required (Helpdesk or Manager only)

**Request Body**:
```json
{
  "sr_id": 45,
  "summary": "Replace forklift engine",
  "problem_description": "Engine replacement required due to mechanical failure",
  "priority": "high",
  "location": "Warehouse A, Downtown LA",
  "visit_date": "2025-10-25",
  "duration_hours": 4.5
}
```

**Response (201 Created)**:
```json
{
  "message": "Work order created successfully",
  "work_order": {
    "id": 123,
    "wo_number": "WO-20251022-0001",
    "sr_id": 45,
    "status": "New",
    "duration_hours": 4.5
  }
}
```

---

### 18. Update Work Order Meta
**Endpoint**: `PATCH /api/work-orders/{id}/edit`

**Description**: Update work order metadata (can only be done before assignment or completion).

**Authentication**: Required (Manager or Helpdesk only)

**Request Body**:
```json
{
  "summary": "Updated work order summary",
  "problem_description": "Updated description",
  "priority": "medium",
  "visit_date": "2025-10-26",
  "location": "Updated location",
  "duration_hours": 5.0
}
```

**Response (200 OK)**:
```json
{
  "message": "Work order updated successfully"
}
```

**Errors**:
- `403`: Invalid status for update (cannot update assigned/in-progress WOs)

---

### 19. Get All Work Orders
**Endpoint**: `GET /api/work-orders`

**Description**: Get all work orders with role-based access, pagination, and filters.

**Authentication**: Required (Manager, Helpdesk, or Technician)

**Query Parameters**:
- `page` (integer): Page number (default: 1)
- `limit` (integer): Items per page (default: 10)
- `status` (string): Filter by status
- `priority` (string): Filter by priority
- `city` (string): Filter by city

**Example Request**:
```
GET /api/work-orders?page=1&limit=10&status=In Progress&priority=high
```

**Response (200 OK)**:
```json
{
  "total": 50,
  "page": 1,
  "pages": 5,
  "work_orders": [
    {
      "id": 123,
      "wo_number": "WO-20251022-0001",
      "status": "In Progress",
      "priority": "high",
      "duration_hours": 4.5,
      "actual_duration_hours": null,
      "started_at": "2025-10-22T09:00:00Z",
      "completed_at": null,
      "serviceRequest": {
        "sr_number": "SR-20251022-0001",
        "priority": "high",
        "sr_type": "repair",
        "issue_description": "Engine failure",
        "machine_serial": "FL-12345",
        "model": "Atlas-2000",
        "customer_name": "ABC Corporation",
        "location": "Warehouse A",
        "visit_date": "2025-10-25"
      }
    }
  ]
}
```

**Note**: Technicians only see work orders assigned to them.

---

### 20. Get Unassigned Work Orders
**Endpoint**: `GET /api/work-orders/unassigned`

**Description**: Get all unassigned work orders (for FSE self-assignment).

**Authentication**: Required (Technician only)

**Query Parameters**:
- `page` (integer): Page number
- `limit` (integer): Items per page
- `priority` (string): Filter by priority
- `city` (string): Filter by city
- `postal_code` (string): Filter by postal code
- `sortBy` (string): Sort field (default: createdAt)
- `order` (string): Sort order (ASC/DESC, default: DESC)

**Example Request**:
```
GET /api/work-orders/unassigned?priority=high&city=Los Angeles&page=1&limit=10
```

**Response (200 OK)**:
```json
{
  "total": 15,
  "page": 1,
  "pages": 2,
  "work_orders": [
    {
      "id": 125,
      "wo_number": "WO-20251022-0003",
      "status": "New",
      "priority": "high",
      "visit_date": "2025-10-25",
      "location": "Downtown LA",
      "serviceRequest": {
        "sr_number": "SR-20251022-0003",
        "customer_name": "XYZ Corp",
        "machine_serial": "FL-67890"
      }
    }
  ]
}
```

---

### 21. Assign Technician to Work Order
**Endpoint**: `PATCH /api/work-orders/{id}/assign`

**Description**: Assign a technician to a work order. Technicians can self-assign; managers/helpdesk must provide technician ID.

**Authentication**: Required (Manager, Helpdesk, or Technician)

**Request Body (Manager/Helpdesk)**:
```json
{
  "assigned_to": 15
}
```

**Request Body (Technician - self-assign)**:
```json
{}
```

**Response (200 OK)**:
```json
{
  "message": "Technician assigned successfully"
}
```

**Errors**:
- `400`: Technician at capacity or validation error
- `404`: Work order not found

---

### 22. Reject Work Order
**Endpoint**: `PATCH /api/work-orders/{id}/reject`

**Description**: Technician rejects an assigned work order with a reason.

**Authentication**: Required (Technician only)

**Request Body**:
```json
{
  "reason": "Not available this week due to medical emergency"
}
```

**Response (200 OK)**:
```json
{
  "message": "Work order rejected successfully"
}
```

**Errors**:
- `400`: Invalid status (can only reject assigned WOs)
- `403`: You are not assigned to this work order

---

### 23. Start Work Order
**Endpoint**: `PATCH /api/work-orders/{id}/start`

**Description**: Start a work order (with optional GPS coordinates and photos).

**Authentication**: Required (Technician only)

**Content-Type**: `multipart/form-data`

**Request Body**:
```
gps_coordinates: "[77.5946, 12.9716]"  (JSON string with longitude, latitude)
files: [image1.jpg, image2.jpg]  (optional photos)
```

**Response (200 OK)**:
```json
{
  "message": "Work order started successfully",
  "work_order": {
    "id": 123,
    "status": "In Progress",
    "started_at": "2025-10-22T09:00:00Z"
  }
}
```

**Errors**:
- `400`: Invalid status for starting
- `403`: Not assigned to this work order

---

### 24. Pause Work Order
**Endpoint**: `PATCH /api/work-orders/{id}/pause`

**Description**: Pause a work order with a reason (and optional GPS/photos).

**Authentication**: Required (Technician only)

**Content-Type**: `multipart/form-data`

**Request Body**:
```
reason: "Awaiting spare part"  (required)
gps_coordinates: "[77.5946, 12.9716]"  (optional)
files: [image1.jpg]  (optional)
```

**Response (200 OK)**:
```json
{
  "message": "Work order paused successfully"
}
```

---

### 25. Resume Work Order
**Endpoint**: `PATCH /api/work-orders/{id}/resume`

**Description**: Resume a paused work order.

**Authentication**: Required (Technician only)

**Content-Type**: `multipart/form-data`

**Request Body**:
```
gps_coordinates: "[77.5946, 12.9716]"  (optional)
files: [image1.jpg]  (optional)
```

**Response (200 OK)**:
```json
{
  "message": "Work order resumed successfully"
}
```

---

### 26. Complete Work Order
**Endpoint**: `PATCH /api/work-orders/{id}/complete`

**Description**: Mark work order as completed with work log, customer signature, and optional parts usage.

**Authentication**: Required (Technician only)

**Content-Type**: `multipart/form-data`

**Request Body**:
```
work_log: "Replaced faulty motor and tested the machine"  (required)
customer_name: "John Smith"  (required)
signature: [signature_image.jpg]  (required - customer signature file)
gps_coordinates: "[77.5946, 12.9716]"  (optional)
parts_used: '[{"part_number": "ENG001", "quantity_used": 2}]'  (optional - JSON string)
files: [completion_photo1.jpg, completion_photo2.jpg]  (optional)
```

**Response (200 OK)**:
```json
{
  "message": "Work order marked as completed",
  "work_order": {
    "id": 123,
    "status": "Completed",
    "completed_at": "2025-10-22T15:30:00Z",
    "actual_duration_hours": 6.5
  },
  "completion_images": [
    "https://blob-url/completion_photo1.jpg",
    "https://blob-url/completion_photo2.jpg"
  ],
  "signature_images": [
    "https://blob-url/signature.jpg"
  ]
}
```

**Errors**:
- `400`: Missing work log or signature
- `404`: Part not found (if parts_used provided)

---

### 27. Get Work Order by ID
**Endpoint**: `GET /api/work-orders/{id}`

**Description**: Get detailed information about a specific work order including duration tracking.

**Authentication**: Required (Manager, Helpdesk, or Technician)

**Response (200 OK)**:
```json
{
  "work_order": {
    "id": 123,
    "wo_number": "WO-20251022-0001",
    "status": "Completed",
    "priority": "high",
    "duration_hours": 4.5,
    "actual_duration_hours": 6.5,
    "started_at": "2025-10-22T09:00:00Z",
    "completed_at": "2025-10-22T15:30:00Z",
    "work_log": "Replaced faulty motor and tested",
    "createdBy": {
      "id": 2,
      "first_name": "John",
      "email": "john@example.com"
    },
    "assignedTo": {
      "id": 15,
      "first_name": "Jane",
      "email": "jane@example.com"
    },
    "serviceRequest": {
      "sr_number": "SR-20251022-0001",
      "sr_type": "repair",
      "machine_serial": "FL-12345",
      "model": "Atlas-2000",
      "customer_name": "ABC Corp",
      "location": "Warehouse A",
      "visit_date": "2025-10-25"
    }
  },
  "duration_tracking": {
    "expected_duration_hours": 4.5,
    "actual_duration_hours": 6.5,
    "started_at": "2025-10-22T09:00:00Z",
    "completed_at": "2025-10-22T15:30:00Z",
    "variance_hours": 2.0,
    "status": "Exceeded"
  },
  "customer_signature": {
    "id": 45,
    "url": "https://blob-url/signature.jpg",
    "captured_at": "2025-10-22T15:30:00Z",
    "remarks": null
  }
}
```

---

### 28. Get Work Orders by Service Request
**Endpoint**: `GET /api/work-orders/service-request/{sr_id}`

**Description**: Get all work orders linked to a specific service request.

**Authentication**: Required (Manager, Helpdesk, or Technician)

**Response (200 OK)**:
```json
{
  "service_request": {
    "id": 45,
    "sr_number": "SR-20251022-0001"
  },
  "work_orders": [
    {
      "id": 123,
      "wo_number": "WO-20251022-0001",
      "status": "Completed",
      "priority": "high"
    }
  ]
}
```

---

### 29. Get Grouped Images by Work Order
**Endpoint**: `GET /api/work-orders/{id}/images-grouped`

**Description**: Get all images uploaded during the work order lifecycle, grouped by action type (start, pause, resume, complete, signature).

**Authentication**: Required (Super Admin, Manager, Helpdesk, or Technician)

**Response (200 OK)**:
```json
{
  "work_order_id": 123,
  "grouped_images": {
    "start": [
      {
        "image_urls": ["https://blob-url/start1.jpg", "https://blob-url/start2.jpg"],
        "gps_coordinates": {
          "type": "Point",
          "coordinates": [77.5946, 12.9716]
        },
        "captured_by": {
          "id": 15,
          "first_name": "Jane",
          "last_name": "Smith",
          "email": "jane@example.com",
          "role_id": 4
        },
        "captured_at": "2025-10-22T09:00:00Z"
      }
    ],
    "pause": [],
    "resume": [],
    "complete": [
      {
        "image_urls": ["https://blob-url/complete1.jpg"],
        "gps_coordinates": {
          "type": "Point",
          "coordinates": [77.5946, 12.9716]
        },
        "captured_by": {
          "id": 15,
          "first_name": "Jane",
          "last_name": "Smith",
          "email": "jane@example.com",
          "role_id": 4
        },
        "captured_at": "2025-10-22T15:30:00Z"
      }
    ],
    "signature": [
      {
        "image_urls": ["https://blob-url/signature.jpg"],
        "gps_coordinates": null,
        "captured_by": {
          "id": 15,
          "first_name": "Jane",
          "last_name": "Smith",
          "email": "jane@example.com",
          "role_id": 4
        },
        "captured_at": "2025-10-22T15:30:00Z"
      }
    ]
  }
}
```

---

## Review APIs

### 30. Submit Customer Review
**Endpoint**: `POST /api/reviews`

**Description**: Customer submits a review for a completed service request.

**Authentication**: None (public endpoint)

**Request Body**:
```json
{
  "sr_id": 45,
  "rating": 5,
  "comment": "Excellent service! Very professional.",
  "submitted_by": "John Smith"
}
```

**Response (201 Created)**:
```json
{
  "message": "Review submitted successfully"
}
```

**Errors**:
- `400`: Review already submitted for this SR
- `404`: Service request not found

**Rating Scale**: 1-5 stars

---

### 31. Get Review by Service Request
**Endpoint**: `GET /api/reviews/{sr_id}`

**Description**: Get review for a specific service request.

**Authentication**: Required (Helpdesk or Manager only)

**Response (200 OK)**:
```json
{
  "review": {
    "id": 12,
    "sr_id": 45,
    "rating": 5,
    "comment": "Excellent service!",
    "submitted_by": "John Smith",
    "createdAt": "2025-10-23T10:00:00Z"
  }
}
```

**Errors**:
- `404`: Review not found

---

### 32. Submit Review by Helpdesk
**Endpoint**: `POST /api/reviews/helpdesk-submit`

**Description**: Helpdesk agent manually submits a customer review.

**Authentication**: Required (Helpdesk or Super Admin only)

**Request Body**:
```json
{
  "sr_id": 45,
  "rating": 4,
  "comment": "Good service, minor delays"
}
```

**Response (201 Created)**:
```json
{
  "message": "Review submitted successfully by helpdesk"
}
```

---

## Inventory APIs

### 33. Get All Inventory Parts
**Endpoint**: `GET /api/inventory`

**Description**: Get list of all parts in inventory.

**Authentication**: Required (Technician, Helpdesk, or Manager)

**Response (200 OK)**:
```json
{
  "parts": [
    {
      "part_number": "ENG001",
      "part_name": "Engine Oil Filter",
      "category": "Engine",
      "quantity_available": 50,
      "unit_price": 350.0,
      "status": "active"
    },
    {
      "part_number": "HYD002",
      "part_name": "Hydraulic Pump",
      "category": "Hydraulics",
      "quantity_available": 0,
      "unit_price": 5200.0,
      "status": "out_of_stock"
    }
  ]
}
```

---

### 34. Check Part Availability
**Endpoint**: `GET /api/inventory/check`

**Description**: Search for a part by part number or part name.

**Authentication**: Required (Technician, Helpdesk, or Manager)

**Query Parameters**:
- `query` (required): Part number or part name (e.g., "ENG001" or "Engine Oil Filter")

**Example Request**:
```
GET /api/inventory/check?query=Engine Oil Filter
```

**Response (200 OK)**:
```json
{
  "part_number": "ENG001",
  "part_name": "Engine Oil Filter",
  "category": "Engine",
  "quantity_available": 50,
  "unit_price": 350.0,
  "status": "active"
}
```

**Errors**:
- `400`: No search query provided
- `404`: Part not found

---

## Document APIs

### 35. Upload Documents
**Endpoint**: `POST /api/documents`

**Description**: Upload support documents (PDFs, videos) to assist field service engineers.

**Authentication**: Required (Manager only)

**Content-Type**: `multipart/form-data`

**Request Body**:
```
title: "Battery Calibration SOPs"  (required)
description: "Step-by-step guide for battery calibration"  (optional)
category: "sop"  (required - manual/sop/repair_guide/other)
related_model: "WIG-LF5000"  (optional)
keywords: "battery,error,e91"  (optional - comma-separated)
files: [file1.pdf, file2.pdf, video.mp4]  (required - multiple files)
```

**Response (201 Created)**:
```json
{
  "message": "Documents uploaded successfully",
  "upload_id": "uuid-1234-5678",
  "files_uploaded": [
    {
      "filename": "battery_sop.pdf",
      "url": "https://blob-url/battery_sop.pdf"
    }
  ]
}
```

**Supported File Types**: PDF, MP4, WebM, MOV (videos)

---

### 36. Get Documents
**Endpoint**: `GET /api/documents`

**Description**: Get all uploaded documents with optional filters.

**Authentication**: Required (All authenticated users)

**Query Parameters**:
- `upload_id` (string): Get specific document upload by UUID
- `model` (string): Filter by related model
- `category` (string): Filter by category (manual/sop/repair_guide/other)
- `keyword` (string): Search by keyword
- `page` (integer): Page number
- `limit` (integer): Items per page

**Example Request**:
```
GET /api/documents?category=sop&keyword=battery&page=1&limit=10
```

**Response (200 OK)**:
```json
{
  "total": 15,
  "page": 1,
  "pages": 2,
  "documents": [
    {
      "upload_id": "uuid-1234-5678",
      "title": "Battery Calibration SOPs",
      "description": "Step-by-step guide",
      "category": "sop",
      "related_model": "WIG-LF5000",
      "keywords": ["battery", "error", "e91"],
      "uploaded_by": {
        "id": 1,
        "first_name": "Manager",
        "email": "manager@example.com"
      },
      "files": [
        {
          "id": 45,
          "filename": "battery_sop.pdf",
          "file_url": "https://blob-url/battery_sop.pdf",
          "file_type": "pdf",
          "file_size": 2048576
        }
      ],
      "createdAt": "2025-10-20T10:00:00Z"
    }
  ]
}
```

---

### 37. Update Document
**Endpoint**: `PATCH /api/documents/{id}`

**Description**: Update document details and add/remove files.

**Authentication**: Required (Manager or Super Admin only)

**Content-Type**: `multipart/form-data`

**Request Body**:
```
title: "Updated title"  (optional)
description: "Updated description"  (optional)
category: "manual"  (optional)
related_model: "Updated model"  (optional)
keywords: "updated,keywords"  (optional)
filesToDelete: [45, 46]  (optional - array of file IDs to delete)
files: [new_file.pdf]  (optional - new files to upload)
```

**Response (200 OK)**:
```json
{
  "message": "Document updated successfully"
}
```

---

### 38. Delete Document
**Endpoint**: `DELETE /api/documents/{id}`

**Description**: Delete a document upload and all its files.

**Authentication**: Required (Super Admin or Manager only)

**Response (200 OK)**:
```json
{
  "message": "Document deleted successfully"
}
```

---

## Work Order Image APIs

### 39. Get Work Order Images
**Endpoint**: `GET /api/work-order-images`

**Description**: Get all work order image logs with filters and pagination.

**Authentication**: Required (Super Admin, Manager, or Helpdesk only)

**Query Parameters**:
- `page` (integer): Page number (default: 1)
- `limit` (integer): Items per page (default: 10)
- `sr_id` (integer): Filter by service request ID
- `work_order_id` (integer): Filter by work order ID
- `action_type` (string): Filter by action (start/pause/resume/complete)

**Example Request**:
```
GET /api/work-order-images?work_order_id=123&action_type=complete&page=1
```

**Response (200 OK)**:
```json
{
  "total": 25,
  "page": 1,
  "pages": 3,
  "images": [
    {
      "id": 78,
      "work_order_id": 123,
      "action_type": "complete",
      "image_urls": [
        "https://blob-url/image1.jpg",
        "https://blob-url/image2.jpg"
      ],
      "gps_coordinates": {
        "type": "Point",
        "coordinates": [77.5946, 12.9716]
      },
      "captured_by": {
        "id": 15,
        "first_name": "Jane",
        "email": "jane@example.com"
      },
      "captured_at": "2025-10-22T15:30:00Z"
    }
  ]
}
```

---

### 40. Get Work Order Image by ID
**Endpoint**: `GET /api/work-order-images/{id}`

**Description**: Get detailed information about a specific image log.

**Authentication**: Required (Super Admin, Manager, Helpdesk, or Technician)

**Response (200 OK)**:
```json
{
  "id": 78,
  "work_order_id": 123,
  "sr_id": 45,
  "action_type": "complete",
  "image_urls": ["https://blob-url/image1.jpg"],
  "gps_coordinates": {
    "type": "Point",
    "coordinates": [77.5946, 12.9716]
  },
  "captured_by": {
    "id": 15,
    "first_name": "Jane",
    "last_name": "Smith",
    "email": "jane@example.com"
  },
  "captured_at": "2025-10-22T15:30:00Z"
}
```

---

## Audit Log APIs

### 41. Get Audit Logs
**Endpoint**: `GET /api/audit-logs`

**Description**: Get audit logs for service requests and work orders with extensive filters.

**Authentication**: Required (Manager, Helpdesk, or Super Admin only)

**Query Parameters**:
- `sr_id` (integer): Filter by service request ID
- `sr_number` (string): Filter by SR number
- `wo_id` (integer): Filter by work order ID
- `wo_number` (string): Filter by WO number
- `action_type` (string): Filter by action type
- `performed_by` (integer): Filter by user ID
- `role_id` (integer): Filter by role ID
- `start_date` (date): Start date (YYYY-MM-DD)
- `end_date` (date): End date (YYYY-MM-DD)
- `page` (integer): Page number (default: 1)
- `limit` (integer): Items per page (leave empty to fetch all)

**Example Request**:
```
GET /api/audit-logs?sr_id=45&action_type=wo_created&start_date=2025-10-01&page=1&limit=20
```

**Response (200 OK)**:
```json
{
  "total": 50,
  "page": 1,
  "pages": 3,
  "logs": [
    {
      "id": 123,
      "sr_id": 45,
      "wo_id": 123,
      "action_type": "wo_created",
      "performed_by": 2,
      "role_id": 2,
      "remarks": "Work order created with status: New",
      "old_data": null,
      "new_data": {
        "status": "New",
        "priority": "high"
      },
      "createdAt": "2025-10-22T10:00:00Z"
    }
  ]
}
```

**Common Action Types**:
- `sr_created`, `sr_updated`, `sr_closed`
- `wo_created`, `wo_assigned`, `wo_started`, `wo_paused`, `wo_resumed`, `wo_completed`
- `review_requested`, `review_submitted`

---

## Customer Asset APIs

### 42. Search Customer Assets
**Endpoint**: `GET /api/customer-assets/search`

**Description**: Search customer assets by email, phone, or machine serial number.

**Authentication**: Required (Manager, Helpdesk, or Super Admin only)

**Query Parameters** (at least one required):
- `email` (string): Customer email (partial or full)
- `phone` (string): Customer phone (partial or full)
- `serial` (string): Machine serial number (partial or full)

**Example Request**:
```
GET /api/customer-assets/search?email=john@example.com
```

**Response (200 OK)**:
```json
{
  "total": 3,
  "assets": [
    {
      "id": 12,
      "customer_name": "John Doe",
      "customer_email": "john@example.com",
      "customer_phone": "5551234567",
      "machine_serial": "FL-12345",
      "model": "Atlas-2000",
      "machine_type": "Forklift",
      "year_of_manufacture": "2020",
      "purchase_date": "2020-03-15",
      "commission_date": "2020-03-20",
      "under_warranty": "yes",
      "location": "Warehouse A",
      "postal_code": "90001",
      "service_territory": "Downtown LA"
    }
  ]
}
```

**Errors**:
- `400`: At least one search field required

---

## Session APIs

### 43. Check Session
**Endpoint**: `GET /api/session/check`

**Description**: Validate if the current JWT token is still active.

**Authentication**: Required (All authenticated users)

**Response (200 OK)**:
```json
{
  "message": "Session is active",
  "user": {
    "id": 3,
    "email": "user@example.com",
    "role_id": 2
  }
}
```

**Errors**:
- `401`: Unauthorized or session expired

---

## Integration APIs

### 44. Create Service Request (Integration)
**Endpoint**: `POST /api/v1/integrations/service-requests`

**Description**: External partners (e.g., Telematics systems) can create service requests using API key authentication.

**Authentication**: API Key (Header: `x-api-key`)

**Rate Limit**: Applied

**Request Body**:
```json
{
  "sr_type": "repair",
  "summary": "Engine overheating alert from Telematics",
  "issue_description": "Vehicle ID 12345 reported engine temp 110°C",
  "priority": "high",
  "machine_serial": "VIN-XYZ-789123",
  "model": "Truck Model T-800",
  "customer_name": "Logistics Corp",
  "customer_email": "ops@logisticscorp.com",
  "customer_phone": "555-0102",
  "location": "Warehouse B, Bengaluru",
  "postal_code": "560034",
  "service_territory": "South Zone"
}
```

**Response (201 Created)**:
```json
{
  "message": "Service request created successfully",
  "sr_number": "SR-20251022-0001",
  "sr_id": 45
}
```

**Errors**:
- `401`: Invalid or missing API key
- `429`: Too many requests (rate limit exceeded)

---

### 45. Get Bulk SR Status (Integration)
**Endpoint**: `POST /api/v1/integrations/service-requests/status`

**Description**: Get status of multiple service requests in bulk.

**Authentication**: API Key (Header: `x-api-key`)

**Rate Limit**: Applied

**Request Body**:
```json
{
  "sr_numbers": ["SR-20251022-0001", "SR-20251022-0002"]
}
```

**Response (200 OK)**:
```json
{
  "results": [
    {
      "sr_number": "SR-20251022-0001",
      "status": "In Progress",
      "priority": "high",
      "created_at": "2025-10-22T10:00:00Z"
    },
    {
      "sr_number": "SR-20251022-0002",
      "status": "Closed",
      "priority": "medium",
      "created_at": "2025-10-21T09:00:00Z"
    }
  ]
}
```

---

## Technician APIs

### 46. Get Available FSEs for Service Request
**Endpoint**: `GET /api/service-requests/{sr_id}/available-fses`

**Description**: Get list of FSEs whose service territory matches the SR's territory, with workload and work history.

**Authentication**: Required (Admin or Manager only)

**Query Parameters**:
- `include_history` (string): Include work history (default: true)
- `history_limit` (integer): Number of recent WOs (default: 5)
- `only_available` (string): Filter only available FSEs (default: false)

**Example Request**:
```
GET /api/service-requests/45/available-fses?include_history=true&only_available=true
```

**Response (200 OK)**:
```json
{
  "service_request": {
    "id": 45,
    "sr_number": "SR-20251022-0001",
    "service_territory": "Downtown LA",
    "status": "New"
  },
  "available_fses": [
    {
      "fse_id": 15,
      "name": "Jane Smith",
      "email": "jane@example.com",
      "phone": "1234567890",
      "city": "Los Angeles",
      "profile": {
        "service_territory": "Downtown LA, West LA",
        "postal_code": "90001",
        "specialization": "HVAC, Electrical",
        "experience_years": 5,
        "is_available": true,
        "max_active_workorders": 5
      },
      "current_workload": {
        "active_count": 2,
        "assigned": 1,
        "in_progress": 1,
        "paused": 0,
        "capacity_percentage": 40,
        "is_at_capacity": false,
        "is_overloaded": false
      },
      "work_history": {
        "total_completed": 156,
        "completed_last_30_days": 12,
        "total_rejected": 3,
        "recent_work_orders": [
          {
            "id": 120,
            "wo_number": "WO-20251020-0005",
            "summary": "HVAC Repair",
            "status": "Completed"
          }
        ]
      },
      "rejection_info": {
        "has_rejected_this_sr": false,
        "rejection_count": 0,
        "latest_rejection_reason": null
      }
    }
  ],
  "total_matching": 5
}
```

---

## Common Patterns

### Pagination
Most list endpoints support pagination:
```
?page=1&limit=10
```

Response includes:
```json
{
  "total": 100,
  "page": 1,
  "pages": 10,
  "data": [...]
}
```

### Date Filters
Use ISO 8601 format (YYYY-MM-DD):
```
?start_date=2025-10-01&end_date=2025-10-31
```

### Search/Keyword
Many endpoints support keyword search:
```
?keyword=forklift
```

### File Uploads
Use `multipart/form-data` content type:
- Images: JPG, PNG (max 10MB each)
- Documents: PDF, MP4, WebM, MOV (max 10MB each)
- Multiple files: `files[]` or `files`

### GPS Coordinates
Always send as JSON string with longitude first:
```
gps_coordinates: "[77.5946, 12.9716]"
```

---

## Error Handling

### Standard Error Response
```json
{
  "message": "Human-readable error message",
  "error": "Detailed error (development mode only)"
}
```

### HTTP Status Codes
- `200`: Success
- `201`: Created
- `400`: Bad Request (validation error)
- `401`: Unauthorized (missing/invalid token)
- `403`: Forbidden (insufficient permissions)
- `404`: Not Found
- `409`: Conflict (duplicate entry)
- `429`: Too Many Requests (rate limit)
- `500`: Internal Server Error

### Common Error Scenarios

**Authentication Errors**:
```json
{
  "message": "No token provided"
}
```

**Authorization Errors**:
```json
{
  "message": "Access denied"
}
```

**Validation Errors**:
```json
{
  "message": "Missing required fields: machine_serial, model"
}
```

---

## Project-Specific Conventions

### Service Request Number Format
- `SR-YYYYMMDD-XXXX`: Breakdown/Maintenance
- `GE-YYYYMMDD-XXXX`: General Enquiry
- `PE-YYYYMMDD-XXXX`: Parts Enquiry

### Work Order Number Format
- `WO-YYYYMMDD-XXXX`: Sequential daily numbering

### Status Progressions

**Service Request**:
```
New → Assigned → In Progress → Paused → Resolved → Closed
```

**Work Order**:
```
New → Assigned → In Progress → Paused → Resumed → Completed
```

### Duration Tracking
- `duration_hours`: Expected duration (set by manager)
- `actual_duration_hours`: Actual time taken (calculated from start to complete)
- `variance_hours`: Difference (positive = exceeded, negative = under time)

### Customer Asset Tracking
The system automatically:
1. Checks if customer exists (by email/phone)
2. Checks if machine exists (by serial number)
3. Creates/updates customer_assets table
4. Logs to sr_audit_logs

### File Storage
All files uploaded to Azure Blob Storage:
- Container: `fsm-documents`, `fsm-work-order-images`, etc.
- URL format: `https://<account>.blob.core.windows.net/<container>/<filename>`
- Files automatically deleted when parent record is deleted

---

## API Testing

**Swagger Documentation**: Visit `http://localhost:5000/api-docs` for interactive API testing.

**Postman Collection**: Import Swagger JSON to Postman for testing.

**Required Environment Variables**:
```env
PORT=5000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=fsm_database
JWT_SECRET=your_jwt_secret
AZURE_STORAGE_CONNECTION_STRING=your_azure_connection
```

---

## Seed Database Credentials

After running `npm run seed`, the following test users are available for development:

### Default Password
**All users**: `123456`

### User Accounts

| Role | Name | Email | Phone | City |
|------|------|-------|-------|------|
| **Super Admin** | Super Admin | superadmin@fsm.com | 832-555-0100 | Houston |
| **Manager** | William Miller | manager.houston@fsm.com | 832-555-0101 | Houston |
| **Helpdesk** | Sophia Davis | helpdesk.midland@fsm.com | 432-555-0102 | Midland |
| **FSE/Technician** | Michael Clark | michael.clark.fse@fsm.com | 832-555-0104 | Houston |
| **FSE/Technician** | Emma Lewis | emma.lewis.fse@fsm.com | 432-555-0105 | Midland |
| **FSE/Technician** | Daniel Walker | daniel.walker.fse@fsm.com | 405-555-0106 | Oklahoma City |
| **FSE/Technician** | Olivia Rodriguez | olivia.rodriguez.fse@fsm.com | 720-555-0107 | Denver |

### Quick Test Login Examples

**Test as Manager**:
```bash
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "manager.houston@fsm.com",
    "password": "123456"
  }'
```

**Test as Helpdesk**:
```bash
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "helpdesk.midland@fsm.com",
    "password": "123456"
  }'
```

**Test as Technician**:
```bash
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "michael.clark.fse@fsm.com",
    "password": "123456"
  }'
```

### Usage Notes
- Use these credentials for testing different role-based access controls
- Manager account can create users, assign technicians, close SRs
- Helpdesk account can create SRs and WOs
- Technician accounts can self-assign, start, and complete work orders
- Super Admin has unrestricted access to all endpoints

### Seeded Service Requests & Work Orders

The database is seeded with 6 Service Requests and 6 Work Orders demonstrating various scenarios:

**Service Request 1: High Priority Drilling Rig Repair**
- **SR Number**: SR-202510-1000
- **Status**: In Progress
- **Customer**: John Davis (Apex Energy Corp) - Houston, TX
- **Issue**: Emergency motor failure on Drillmaster 5000 drilling rig
- **Work Orders**:
  - **WO 1** (SR-202510-1000-WO01): Emergency Motor Replacement
    - Status: In Progress
    - Assigned to: **Michael Clark** (michael.clark.fse@fsm.com)
    - Duration: 12 hours
    - Started: Yesterday, still ongoing
  - **WO 2** (SR-202510-1000-WO02): Motor Alignment and Testing
    - Status: Paused
    - Assigned to: **Michael Clark** (michael.clark.fse@fsm.com)
    - Duration: 6 hours
    - Paused: Waiting for specialized alignment tools

**Service Request 2: Medium Priority Hydraulic Maintenance**
- **SR Number**: SR-202510-1001
- **Status**: Assigned
- **Customer**: Sarah Wilson (Pioneer Drilling Inc.) - Midland, TX
- **Issue**: Quarterly maintenance for PowerFrac XL hydraulic unit
- **Work Orders**:
  - **WO 1** (SR-202510-1001-WO01): Quarterly Hydraulic System Maintenance
    - Status: Assigned
    - Assigned to: **Emma Lewis** (emma.lewis.fse@fsm.com)
    - Duration: 8 hours
    - Scheduled: Tomorrow
  - **WO 2** (SR-202510-1001-WO02): Hydraulic Fluid Analysis and Replacement
    - Status: Assigned
    - Assigned to: **Emma Lewis** (emma.lewis.fse@fsm.com)
    - Duration: 4 hours
    - Scheduled: Next week

**Service Request 3: Low Priority Parts Enquiry**
- **SR Number**: SR-202510-1002
- **Status**: New (No WO assigned yet)
- **Customer**: David Martinez (Basin Oilfield Services) - Oklahoma City, OK
- **Issue**: Parts request for Lufkin C-912 gearbox replacement

**Service Request 4: High Priority Compressor Repair**
- **SR Number**: SR-202510-1003
- **Status**: Assigned
- **Customer**: Chris Baker (Rocky Mountain Resources) - Denver, CO
- **Issue**: Urgent compressor valve failure and pressure loss
- **Work Orders**:
  - **WO 1** (SR-202510-1003-WO01): Compressor Valve Replacement and Calibration
    - Status: Assigned
    - Assigned to: **Olivia Rodriguez** (olivia.rodriguez.fse@fsm.com)
    - Duration: 6 hours
    - Scheduled: Tomorrow

**Service Request 5: Medium Priority Wellhead Maintenance**
- **SR Number**: SR-202510-1004
- **Status**: Resolved (Review Requested)
- **Customer**: John Davis (Apex Energy Corp) - Houston, TX
- **Issue**: Monthly wellhead maintenance and inspection
- **Work Orders**:
  - **WO 1** (SR-202510-1004-WO01): Monthly Wellhead Inspection
    - Status: Completed ✅
    - Assigned to: **Michael Clark** (michael.clark.fse@fsm.com)
    - Duration: 4 hours (Actual: 4.5 hours)
    - Completed: 3 days ago

**Service Request 6: Low Priority General Enquiry**
- **SR Number**: SR-202510-1005
- **Status**: New (No WO assigned yet)
- **Customer**: Sarah Wilson (Pioneer Drilling Inc.) - Midland, TX
- **Issue**: Service contract renewal and maintenance schedule inquiry

### User to Work Order Mapping

| Technician | Email | Assigned Work Orders | Status Summary |
|------------|-------|---------------------|----------------|
| **Michael Clark** | michael.clark.fse@fsm.com | 3 WOs | 1 In Progress, 1 Paused, 1 Completed |
| **Emma Lewis** | emma.lewis.fse@fsm.com | 2 WOs | 2 Assigned (upcoming) |
| **Daniel Walker** | daniel.walker.fse@fsm.com | 0 WOs | Available |
| **Olivia Rodriguez** | olivia.rodriguez.fse@fsm.com | 1 WO | 1 Assigned (upcoming) |

### Testing Scenarios with Seeded Data

**1. Test Technician Viewing Assigned Work Orders**
```bash
# Login as Michael Clark
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email": "michael.clark.fse@fsm.com", "password": "123456"}'

# Get his work orders (should see 3 WOs)
curl -X GET http://localhost:5000/api/work-orders \
  -H "Authorization: Bearer <michael_token>"
```

**2. Test Manager Assigning New Work Order**
```bash
# Login as Manager
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email": "manager.houston@fsm.com", "password": "123456"}'

# Assign Daniel Walker (currently available) to SR-202510-1002
curl -X POST http://localhost:5000/api/work-orders \
  -H "Authorization: Bearer <manager_token>" \
  -H "Content-Type: application/json" \
  -d '{
    "sr_id": 3,
    "summary": "Parts delivery and installation",
    "priority": "low",
    "location": "789 Gusher Ave, Oklahoma City, OK",
    "visit_date": "2025-10-30"
  }'
```

**3. Test Technician Completing Work Order**
```bash
# Michael Clark completes the paused WO
curl -X PATCH http://localhost:5000/api/work-orders/2/resume \
  -H "Authorization: Bearer <michael_token>" \
  -F "gps_coordinates=[77.5946, 12.9716]"

# Then complete it
curl -X PATCH http://localhost:5000/api/work-orders/2/complete \
  -H "Authorization: Bearer <michael_token>" \
  -F "work_log=Alignment completed successfully" \
  -F "customer_name=John Davis" \
  -F "signature=@signature.jpg"
```

**4. Test Manager Closing Service Request**
```bash
# Manager requests review for SR-202510-1004 (already resolved)
curl -X PATCH http://localhost:5000/api/service-requests/5/request-review \
  -H "Authorization: Bearer <manager_token>"

# Customer submits review (public endpoint)
curl -X POST http://localhost:5000/api/reviews \
  -H "Content-Type: application/json" \
  -d '{
    "sr_id": 5,
    "rating": 5,
    "comment": "Excellent service",
    "submitted_by": "John Davis"
  }'

# Manager closes the SR
curl -X PATCH http://localhost:5000/api/service-requests/5/close \
  -H "Authorization: Bearer <manager_token>"
```

---

## Quick Start for AI Agents

1. **Authentication Flow**:
   - Call `POST /api/auth/login` with credentials
   - Store `accessToken` from response
   - Include in all subsequent requests: `Authorization: Bearer <token>`

2. **Creating a Service Request**:
   - `POST /api/service-requests` (as Helpdesk/Manager)
   - Required: `sr_type`, `summary`, `machine_serial`, `model`

3. **Creating a Work Order**:
   - `POST /api/work-orders` (as Helpdesk/Manager)
   - Required: `sr_id`, `summary`, `priority`, `location`, `visit_date`

4. **Technician Workflow**:
   - View unassigned WOs: `GET /api/work-orders/unassigned`
   - Self-assign: `PATCH /api/work-orders/{id}/assign`
   - Start: `PATCH /api/work-orders/{id}/start`
   - Complete: `PATCH /api/work-orders/{id}/complete` (with signature)

5. **Closing the Loop**:
   - Request review: `PATCH /api/service-requests/{id}/request-review` (Manager)
   - Customer submits: `POST /api/reviews` (Public)
   - Close SR: `PATCH /api/service-requests/{id}/close` (Manager)

---

**Last Updated**: October 22, 2025  
**API Version**: 1.0  
**Base URL**: `http://localhost:5000`
