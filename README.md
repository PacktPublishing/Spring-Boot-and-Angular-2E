<h1 align="center">
Spring Boot and Angular, Second Edition</h1>
<p align="center">This is the code repository for <a href ="https://www.packtpub.com/en-us/product/spring-boot-and-angular-second-edition/9781806114016"> Spring Boot and Angular, Second Edition</a>, published by Packt.
</p>

<h2 align="center">
Hands-on full-stack development with Java, Spring, Angular, and TypeScript
</h2>
<p align="center">
Ahmad Gohar, Dimitrios Kyriakakis</p>

<p align="center">
  <a href="https://packt.link/free-ebook/9781806114016"><img width="32px" alt="Free PDF" title="Free PDF" src="https://cdn-icons-png.flaticon.com/512/4726/4726010.png"/></a>
 &#8287;&#8287;&#8287;&#8287;&#8287;
  <a href="https://packt.link/gbp/9781806114016"><img width="32px" alt="Graphic Bundle" title="Graphic Bundle" src="https://cdn-icons-png.flaticon.com/512/2659/2659360.png"/></a>
  &#8287;&#8287;&#8287;&#8287;&#8287;
   <a href="https://www.amazon.com/Spring-Boot-Angular-Hands-development/dp/1806114011/"><img width="32px" alt="Amazon" title="Get your copy" src="https://cdn-icons-png.flaticon.com/512/15466/15466027.png"/></a>
  &#8287;&#8287;&#8287;&#8287;&#8287;
</p>

Welcome to the companion code repository for the **Spring Boot and Angular** book!

This repository is organized by book chapters and parts.  
You’ll find backend and frontend code, guides, and resources for each section.

<details open> 
  <summary><h2>About the book</summary>
<a href="https://www.packtpub.com/en-us/product/spring-boot-and-angular-second-edition/9781806114016">
<img src="https://content.packt.com/B34141/cover_image_small.jpg" alt="Spring Boot and Angular, Second Edition" height="256px" align="right">
</a>

This book is your practical roadmap to building modern, production-ready full-stack applications. Through real-world examples and proven workflows, you’ll combine Spring Boot 4 microservices with Angular 22’s latest features to build secure, scalable systems ready for deployment. This second edition of <i>Spring Boot and Angular</i>, written by two seasoned full-stack experts, starts by laying a solid backend foundation with Spring Boot and Spring Cloud microservices, JWT security, and SQL and NoSQL databases using Spring Data. You’ll then switch to the frontend to build reactive user interfaces with Angular, enable server-side rendering (SSR), and manage real-time data sharing for dynamic applications. You’ll also connect Spring Boot APIs to Angular frontends using best practices and reactive integration patterns.</br>
The chapters help you master development while boosting efficiency with AI-powered coding using GitHub Copilot in VS Code. This guide will enable you to deploy containerized Spring Boot services, optimize Angular builds, and run the entire platform as a single containerized deployment. By the end of this book, you’ll have built a complete, deployable application and mastered the full development lifecycle.
</details>

<details open> 
  <summary><h2>Key Learnings</summary>
<ul>

<li>Design full-stack apps for enterprise-level architecture</li>

<li>Build Spring Boot microservices with an API gateway</li>

<li>Persist data using Spring Data for SQL and NoSQL</li>

<li>Secure microservices using JWT authentication</li>

<li>Create reactive apps with WebFlux and Angular Signals</li>

<li>Implement SSR in Angular for improved SEO and speed</li>

<li>Stream real-time data in Angular apps</li>

<li>Containerize and deploy the full stack with Docker Compose</li>

</ul>

  </details>

---

## 📖 Book Structure

### Part 1: Overview of Spring Boot and Angular development
#### 1. Spring Boot and Angular: The Big Picture and Environment Kickstart
---
### Part 2: Backend Development
#### 2. Getting Started with Microservices Using Spring Boot
#### 3. Setting Up Your Development AI Assistant
#### 4. Setting Up Databases and Repositories Using Spring Data
#### 5. Building Application Services and APIs with Spring
#### 6. Service Discovery and API Gateway with Spring Cloud
#### 7. Documenting APIs with OpenAPI and Logging Events
#### 8. Securing Microservices with Spring Security and JWT
#### 9. Reactive Programming with Spring WebFlux
#### 10. Building and Packaging the Spring Boot Backend
---
### Part 3: Frontend Development
#### 11. Angular Frontend Foundation
#### 12. AI-Assisted Angular Development
#### 13. Building Forms with Reactive Patterns
#### 14. Angular State Management with Signals and Stores
#### 15. CRUD Workflows with State Management
#### 16. Authentication, Interceptors, Guards, and Profile Management
#### 17. API-Driven Books and Authors with NgRx Signal Store
#### 18. Hybrid Rendering, Hydration, and Deferred Loading
#### 19. Real-Time Updates with Server-Sent Events
#### 20. Production Build and Docker Containerization (Angular)
---
### Part 4: Deployment
#### 21. Connecting Frontend and Backend in Production

---

## 📂 Repository Structure
- `/Parent Repo/` – Per-chapter guides and code
- `/backend/` – Spring Boot microservices (see [backend/README.md](./backend/README.md))
- `/frontend/` – Angular application (see [frontend/README.md](./frontend/README.md))

---

## 🚀 Getting Started

1. **Read the chapter guides** for setup and context.
2. **Clone this repo** and open in VS Code.
3. **Follow instructions in each part’s README** for backend and frontend setup.

---

## Backend Chapter Paragraphs (Chapter 1-10)

Chapter 1, Spring Boot and Angular – Understand the Big Picture and Kickstart the Environment, introduces the bookstore application you will build throughout the book, explains the overall architecture that combines Spring Boot microservices on the backend with an Angular frontend, and walks you through installing the JDK, Maven, Node.js, Angular CLI, Docker, and an IDE so your environment is ready for the rest of the book.

Chapter 2, Getting Started With Microservices Using Spring Boot, covers the fundamentals of Spring Boot and microservices architecture, explains how to decompose a system by business capability, introduces the design patterns reused throughout the backend chapters, and guides you through bootstrapping the first service with a clean layered structure and production-minded project setup.

Chapter 3, Setting up your development AI Assistant, shows you how to set up GitHub Copilot for backend development, configure project-specific instruction files to align AI suggestions with your coding standards, and establish the trust but verify workflow used throughout the book when accelerating development with AI.

Chapter 4, Setting up Database and Repositories using Spring Data, walks you through implementing the persistence layer with Spring Data JPA for PostgreSQL and Spring Data MongoDB for MongoDB, designing entities and documents, creating repository interfaces, and applying polyglot persistence practices that match each microservice's domain needs.

Chapter 5, Building Application Services and APIs with Spring, focuses on implementing the service layer and REST controllers, applying dependency injection and component scanning, structuring DTOs and validation, handling errors consistently, and testing service and controller logic so your microservices expose clean and reliable APIs.

Chapter 6, Developing Service Discovery and API Gateway using Spring Cloud, introduces dynamic service registration with Eureka and gateway routing with Spring Cloud Gateway, so clients can call a single entry point while backend services are discovered and routed dynamically with better resiliency and scalability.

Chapter 7, Documenting APIs with OpenAPI and logging the events, shows how to generate and maintain OpenAPI documentation for your services and how to enable practical observability with structured logging, metrics, and distributed tracing so you can understand, monitor, and debug request flows across microservices.

Chapter 8, Securing Microservices with Spring Security and JWT, implements end-to-end authentication and authorization using OAuth2 and JWT with Keycloak, secures gateway and service endpoints with role-based access control, and validates token propagation patterns required for production-ready microservices security.

Chapter 9, Reactive programming using Spring WebFlux, extends the backend with non-blocking reactive APIs and Server-Sent Events (SSE), enabling real-time notifications for inventory changes while preserving gateway-based routing, observability, and secure write operations.

Chapter 10, Building and Packaging the Spring Boot backend, moves the solution from development runtime to deployment readiness by packaging services as executable artifacts and container images, publishing versioned images, running and troubleshooting containers, and orchestrating the full backend stack with Docker Compose.

---

Happy coding!

## Chapter-to-Repository Mapping

| Chapter | Title | Primary Repository | Chapter Location |
|---|---|---|---|
| 1 | Spring Boot and Angular: The Big Picture and Environment Kickstart | Parent | [chapter-01](chapter-01/README.md) |
| 2 | Getting Started with Microservices Using Spring Boot | Backend | [chapter-02](https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E_Backend/tree/main/chapter-02) |
| 3 | Setting Up Your Development AI Assistant | Backend | [chapter-03](https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E_Backend/tree/main/chapter-03) |
| 4 | Setting Up Databases and Repositories Using Spring Data | Backend | [chapter-04](https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E_Backend/tree/main/chapter-04) |
| 5 | Building Application Services and APIs with Spring | Backend | [chapter-05](https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E_Backend/tree/main/chapter-05) |
| 6 | Service Discovery and API Gateway with Spring Cloud | Backend | [chapter-06](https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E_Backend/tree/main/chapter-06) |
| 7 | Documenting APIs with OpenAPI and Logging Events | Backend | [chapter-07](https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E_Backend/tree/main/chapter-07) |
| 8 | Securing Microservices with Spring Security and JWT | Backend | [chapter-08](https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E_Backend/tree/main/chapter-08) |
| 9 | Reactive Programming with Spring WebFlux | Backend | [chapter-09](https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E_Backend/tree/main/chapter-09) |
| 10 | Building and Packaging the Spring Boot Backend | Backend | [chapter-10](https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E_Backend/tree/main/chapter-10) |
| 11 | Angular Frontend Foundation | Frontend | [chapter-11](https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E_Frontend/tree/main/chapter-11) |
| 12 | AI-Assisted Angular Development | Frontend | [chapter-12](https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E_Frontend/tree/main/chapter-12) |
| 13 | Building Forms with Reactive Patterns | Frontend | [chapter-14](https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E_Frontend/tree/main/chapter-14) |
| 14 | Angular State Management with Signals and Stores | Frontend | [chapter-15](https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E_Frontend/tree/main/chapter-15) |
| 15 | CRUD Workflows with State Management | Frontend | [chapter-15](https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E_Frontend/tree/main/chapter-15) |
| 16 | Authentication, Interceptors, Guards, and Profile Management | Frontend | [chapter-16](https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E_Frontend/tree/main/chapter-16) |
| 17 | API-Driven Books and Authors with NgRx Signal Store | Frontend | [chapter-17](https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E_Frontend/tree/main/chapter-17) |
| 18 | Hybrid Rendering, Hydration, and Deferred Loading | Frontend | [chapter-18](https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E_Frontend/tree/main/chapter-18) |
| 19 | Real-Time Updates with Server-Sent Events | Frontend | [chapter-19](https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E_Frontend/tree/main/chapter-19) |
| 20 | Production Build and Docker Containerization (Angular) | Frontend | [chapter-20](https://github.com/PacktPublishing/Spring-Boot-and-Angular-2E_Frontend/tree/main/chapter-20) |
| 21 | Connecting Frontend and Backend in Production | Parent | [chapter-21](chapter-21/containerization/README.md) |

## How to Use This Repository

1. Start from Chapter 1 in this parent repository.
2. Use the chapter map above to jump to the backend or frontend repository for implementation chapters.
3. Follow each chapter README for setup steps, runtime commands, and troubleshooting.

## Notes

- This parent repository currently contains direct chapter materials for Chapter 1 and Chapter 21.
- Backend implementation chapters are maintained in the backend repository.
- Frontend implementation chapters are maintained in the frontend repository.

<details> 
  <summary><h2>Get to know the authors</h2></summary>

_Ahmad Gohar_ Dr. is a principal solution architect (Sr. Manager) working for IBM USA, Centerof Competence. Holding a Ph.D. & M.Sc. in Information Systems and an MBA in GlobalBusiness Management, he specializes in Java-based full-stack development, microservicesarchitecture, and cloud-native solutions. He is currently passionate about architecting secureagentic AI before it becomes a liability. With over 20 years of technical experience across 10+countries, he has led solution architecture for complex, high-stakes programs in US enterpriseconsulting, banking, and government digital transformation. He currently focuses on cloud-native and agentic AI platforms in the US market, including a zero-trust security overhaul thatreduced secrets/API breach risk. He loves diving (advanced open-water-certified), equestrianactivities, and playing tennis. Originally from Egypt, he now lives in the USA.

_Dimitrios Kyriakakis_ is a technical lead at ZEAL, specializing in Angular architecture and full-stack development across web, backend, and mobile. He has over 10 years of experiencebuilding modern web and mobile applications using clean architecture and scalable infrastructure, and he also offers technical consulting as a freelancer. He holds a degree inElectrical and Computer Engineering from the Technical University of Crete.
Dimitrios is an active member of the Angular community: he speaks at internationalconferences such as JSNation and NG-Poland, writes technical articles on his blog,dimeloper.com, and on other platforms, and mentors aspiring developers on ADPList. He ispassionate about fostering the developer community and creating content that helps othersgrow in their craft. Originally from Greece, he now lives in Germany. 
</details>

<details> 
  <summary><h2>Other related books</h2></summary>
<ul>
  <li><a href="https://www.packtpub.com/en-us/product/building-ai-powered-apps-with-angular-first-edition/9781806383498">Building AI-Powered Apps with Angular, First Edition</a></li>
  <li><a href="https://www.packtpub.com/en-us/product/learning-spring-boot-4-fourth-edition/9781807427115">Learning Spring Boot 4, Fourth Edition</a></li>
</ul>
</details>
