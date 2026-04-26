# Chapter 21 - Connecting Frontend and Backend in Production

## Chapter Overview

In the previous chapter, we focused on building and deploying the Angular frontend so it can be served as a production-ready application. At this stage, we now have a frontend and a set of backend microservices exposed through a centralized API gateway.

This chapter completes the platform by connecting frontend and backend in a production-oriented way. The focus is not only on making API calls work, but also on orchestrating services correctly, securing communication boundaries, and validating end-to-end behavior under deployment conditions.

This chapter covers how to:

- Explore Docker Compose as a production-oriented orchestration tool
- Enable secure communication between frontend and backend
- Run the full platform locally with Docker Compose
- Avoid common pitfalls in microservices containerization
- Walk through the complete end-to-end request flow

Technical requirement and source code:
https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E/tree/main/chapter-21

## Table of Contents

- [Chapter 21 - Connecting Frontend and Backend in Production](#chapter-21---connecting-frontend-and-backend-in-production)
  - [Chapter Overview](#chapter-overview)
  - [Table of Contents](#table-of-contents)
  - [Exploring Docker Compose as a Production-Oriented Orchestration Tool](#exploring-docker-compose-as-a-production-oriented-orchestration-tool)
    - [Core Compose Concepts Used in This Chapter](#core-compose-concepts-used-in-this-chapter)
  - [Containerizing the Bookstore Platform for Production](#containerizing-the-bookstore-platform-for-production)
    - [Networking and Persistence Model](#networking-and-persistence-model)
    - [Backend Image Tag Strategy](#backend-image-tag-strategy)
  - [Running the Full Platform Locally Using Docker Compose](#running-the-full-platform-locally-using-docker-compose)
    - [Services and Ports](#services-and-ports)
    - [Useful Runtime Commands](#useful-runtime-commands)
  - [Enabling Secure Communication Between Frontend and Backend](#enabling-secure-communication-between-frontend-and-backend)
    - [Why This Matters](#why-this-matters)
    - [Recommended Communication Model](#recommended-communication-model)
    - [Secure Communication Best Practices](#secure-communication-best-practices)
  - [Common Pitfalls in Containerizing Microservices Applications](#common-pitfalls-in-containerizing-microservices-applications)
  - [Bringing It All Together: End-to-End Flow Walkthrough](#bringing-it-all-together-end-to-end-flow-walkthrough)
  - [Troubleshooting Guide](#troubleshooting-guide)
    - [1. Port Already in Use](#1-port-already-in-use)
    - [2. Keycloak Realm Import Missing](#2-keycloak-realm-import-missing)
    - [3. Services Remain Unhealthy or Restart Repeatedly](#3-services-remain-unhealthy-or-restart-repeatedly)
    - [4. Unable to Pull Author Images](#4-unable-to-pull-author-images)
    - [5. Gateway Responds but API Calls Fail](#5-gateway-responds-but-api-calls-fail)
    - [6. MongoDB Authentication Errors](#6-mongodb-authentication-errors)
    - [7. Full Environment Reset](#7-full-environment-reset)
  - [References](#references)
  - [Summary](#summary)

## Exploring Docker Compose as a Production-Oriented Orchestration Tool

Docker Compose is often treated as a local convenience, but in real projects it becomes a declarative system blueprint. It defines:

- What services exist
- How services communicate
- Which dependencies and startup conditions are required
- How environment-specific configuration is injected

For the Bookstore platform, Compose models infrastructure and application services as one runnable unit. This provides consistent startup, repeatable environments, and clear operational boundaries.

### Core Compose Concepts Used in This Chapter

1. Services: Each microservice and infrastructure component runs as an isolated container.
2. Networks: Services communicate using service names such as `postgres`, `mongodb`, and `gateway-server`.
3. Volumes: PostgreSQL and MongoDB use persistent named volumes to avoid data loss between restarts.
4. Dependencies: `depends_on` and health checks coordinate startup order across the system.

## Containerizing the Bookstore Platform for Production

The platform definition includes the following services:

- PostgreSQL for inventory persistence
- MongoDB for user persistence
- Zipkin for distributed tracing
- Keycloak for identity and access management
- Eureka server for discovery
- Inventory service and user service for business APIs
- Gateway server as the single backend entry point

### Networking and Persistence Model

- All services run on a shared bridge network.
- Internal communication uses service names instead of `localhost`.
- Persistent volumes (`postgres_data`, `mongo_data`) preserve database state across container recreation.

### Backend Image Tag Strategy

Backend service images follow this pattern:

- `ansgohar/<service-name>:${IMAGE_TAG:-latest}`

Example:

```bash
IMAGE_TAG=v0.0.1 docker compose pull
IMAGE_TAG=v0.0.1 docker compose up -d
```

## Running the Full Platform Locally Using Docker Compose

From [chapter-21/containerization](docker-compose.yml), run:

```bash
docker compose pull
docker compose up -d
docker compose ps
```

Open:

- Gateway: http://localhost:8080
- Eureka: http://localhost:8761
- Zipkin: http://localhost:9411
- Keycloak: http://localhost:8090

### Services and Ports

| Service | Container Name | Port |
|---|---|---|
| Gateway | `bookstore-gateway-server` | `8080` |
| Eureka | `bookstore-eureka-server` | `8761` |
| Inventory | `bookstore-inventory-service` | `8081` |
| User | `bookstore-user-service` | `8082` |
| Keycloak | `bookstore-keycloak` | `8090` |
| PostgreSQL | `bookstore-postgres` | `5432` |
| MongoDB | `bookstore-mongo` | `27017` |
| Zipkin | `bookstore-zipkin` | `9411` |

### Useful Runtime Commands

```bash
docker compose ps
docker compose logs -f --tail=200
docker compose logs -f --tail=200 gateway-server
docker compose restart inventory-service
docker compose down
docker compose down -v
```

## Enabling Secure Communication Between Frontend and Backend

Production communication should flow through a single backend boundary: the API gateway.

### Why This Matters

During development, frontend and backend frequently run on different origins (for example `localhost:4200` and `localhost:8080`). In production, this introduces security and consistency concerns:

- CORS policy management
- Token propagation and validation
- Endpoint stability
- HTTPS enforcement at the edge

### Recommended Communication Model

1. Frontend calls only the gateway.
2. Gateway validates JWTs and routes internally.
3. Internal services stay private on the Compose network.
4. CORS policy is centralized at the gateway.

Gateway JWT resource server configuration example:

```yaml
spring:
  security:
    oauth2:
      resourceserver:
        jwt:
          issuer-uri: ${SPRING_SECURITY_OAUTH2_RESOURCESERVER_JWT_ISSUER_URI}
```

### Secure Communication Best Practices

| Practice | Why It Matters |
|---|---|
| Route frontend calls through gateway | Centralizes routing and security |
| Keep internal services private | Reduces attack surface |
| Configure CORS at gateway level | Provides consistent cross-origin policy |
| Use relative API paths in frontend | Simplifies deployment topology |
| Validate JWT at gateway | Centralizes authentication checks |
| Enforce HTTPS at edge | Secures data in transit |

## Common Pitfalls in Containerizing Microservices Applications

Containerization failures are usually operational and architectural, not syntax errors. Frequent pitfalls include:

1. Treating containerized runtime as identical to local IDE runtime.
2. Building large single-stage images instead of optimized multi-stage images.
3. Using `localhost` in inter-service URLs instead of Compose service names.
4. Assuming startup order means readiness; unhealthy dependencies can still fail requests.
5. Exposing each internal service publicly instead of enforcing gateway-first access.
6. Forgetting persistent volumes for stateful services.
7. Relying on floating tags without explicit versioning discipline.

## Bringing It All Together: End-to-End Flow Walkthrough

The production request path is:

1. Browser loads Angular frontend.
2. Frontend sends API request to gateway.
3. Gateway validates token and routes by service discovery.
4. Target microservice executes business logic and data access.
5. Response returns through gateway to frontend.
6. Zipkin traces the full request across service boundaries.

This flow reinforces the platform boundaries used throughout the chapter: single entry point, private internal services, centralized security, and observable distributed behavior.

## Troubleshooting Guide

### 1. Port Already in Use

Check:

```bash
lsof -nP -iTCP:8080 -sTCP:LISTEN
lsof -nP -iTCP:5432 -sTCP:LISTEN
```

Fix by stopping conflicting services or adjusting host port mappings.

### 2. Keycloak Realm Import Missing

Ensure this file exists:

- `containerization/Keycloak/bookstore-realm.json`

### 3. Services Remain Unhealthy or Restart Repeatedly

```bash
docker compose ps
docker compose logs --tail=200 eureka-server
docker compose logs --tail=200 inventory-service
docker compose logs --tail=200 user-service
docker compose logs --tail=200 gateway-server
```

When dependencies become healthy, restart dependent services:

```bash
docker compose restart inventory-service user-service gateway-server
```

### 4. Unable to Pull Author Images

```bash
docker login
docker compose pull
```

Or use explicit default tag:

```bash
IMAGE_TAG=latest docker compose pull
```

### 5. Gateway Responds but API Calls Fail

Verify Eureka registration and database readiness, then restart gateway:

```bash
docker compose restart gateway-server
```

### 6. MongoDB Authentication Errors

Confirm user-service Mongo URI matches the Compose credentials:

- `mongodb://bookstore:bookstore123@mongodb:27017/userDB?authSource=admin`

If credentials drifted and state is inconsistent:

```bash
docker compose down -v
docker compose up -d
```

### 7. Full Environment Reset

```bash
docker compose down -v
docker system prune -f
docker compose pull
docker compose up -d
```

## References

- Chapter source code: https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E/tree/main/chapter-21
- Docker Compose docs: https://docs.docker.com/compose/
- Spring Security Resource Server (JWT): https://docs.spring.io/spring-security/reference/servlet/oauth2/resource-server/jwt.html
- Keycloak documentation: https://www.keycloak.org/documentation
- Zipkin documentation: https://zipkin.io/pages/quickstart.html

## Summary

This chapter connects frontend and backend into a single production-oriented platform.

You learned how Docker Compose orchestrates the full Bookstore system, how to enforce secure frontend-backend communication through the gateway, how to run and validate the stack locally, and how to prevent common containerization mistakes that often appear in distributed deployments.
