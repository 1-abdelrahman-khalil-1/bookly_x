# BooklyX Mobile

BooklyX is a multi-role SaaS booking platform built for service-based businesses such as clinics, spas, salons, and barber shops.  
This repository contains the Flutter mobile ecosystem for the platform, including both the Client App and the Staff App.

The platform includes:
- Flutter Client App for booking and service discovery
- Flutter Staff App for operational workflows and schedule management
- Node.js backend infrastructure powering the booking system and business logic

---

## 🚀 Features

- Multi-role authentication and authorization
- Real-time booking and appointment management
- Staff scheduling and availability management
- Role-based dashboards and operational flows
- Loyalty and review system
- Localization support (English / Arabic)
- Shared reusable UI components and design system
- Feature-first Flutter architecture
- REST API integration with layered backend architecture

---

## 📱 Screenshots

> Screenshots and UI previews will be added soon.

### Client App
- Home
- Business Details
- Booking Flow
- Payment
- Profile & Settings

### Staff App
- Schedule Management
- Booking Details
- Availability
- Earnings Dashboard

---

## 🎯 My Scope

This repository is part of a graduation project.

My responsibilities include:
- Building and integrating the Flutter Client App
- Building and integrating the Flutter Staff App
- Designing reusable mobile architecture and shared components
- Translating product and UX requirements into mobile workflows
- Connecting mobile features with backend API contracts
- Contributing to the initial backend infrastructure and database flow design

> The web frontend is handled by other team members.

---

## 🛠️ Tech Stack

### Mobile (Flutter)

- Flutter
- Dart
- Riverpod
- AutoRoute
- Dio
- Slang Localization
- Shared Preferences
- Table Calendar
- FL Chart
- Lottie Animations

### Backend

- Node.js
- Express.js
- REST API Architecture
- JWT Authentication
- Layered Architecture
- MySQL
- OpenAPI Specification

### Design & Productivity

- Figma
- GitHub Copilot
- Claude
- ChatGPT / Codex
- Stitch AI

---

## 📐 Architecture

### Mobile Project Structure

```text
lib/
 ├── app/
 │    ├── core/
 │    │    ├── api_helper/
 │    │    ├── services/
 │    │    ├── themes/
 │    │    ├── utils/
 │    │    └── widgets/
 │    │
 │    └── features/
 │         ├── client/
 │         ├── staff/
 │         └── common/
 │
 ├── generated/
 ├── router/
 └── main.dart

```

### 🧩 System Architecture

```text
┌──────────────────────────┐      ┌──────────────────────────┐
│    Flutter Client App    │      │     Flutter Staff App    │
└────────────┬─────────────┘      └────────────┬─────────────┘
             │                                 │
             └────────────────┬────────────────┘
                              │ REST API
                              ▼
                ┌──────────────────────────┐
                │     Express.js API       │
                │  JWT • Layered Backend   │
                └─────────────┬────────────┘
                              ▼
                ┌──────────────────────────┐
                │      MySQL Database      │
                └──────────────────────────┘

```

### 🏗️ Backend Architecture

The backend follows a layered REST architecture:

`Controller → Service → Repository → Database`

Core backend responsibilities include:

* Authentication & authorization
* Booking lifecycle management
* Staff scheduling
* Payment handling
* Loyalty and reviews
* Role-based access control
* Business and service moderation

**Backend Repository:** [BooklyX Backend Repository](https://github.com/1-abdelrahman-khalil-1/booklyX_backend)

---

## 🤖 AI-Assisted Development

AI-assisted workflows were used to accelerate development and iteration while maintaining manual control over architecture, implementation, and integration decisions.

AI tools were primarily used for:

* UI generation acceleration
* Code completion
* Architecture discussion
* Backend scaffolding
* Documentation and debugging support

---

## 📝 Repository Notes

* This repository focuses on the Flutter mobile ecosystem.
* The project is currently under active development.
* The backend and web frontend exist as separate repositories/services within the broader BooklyX platform.
* Final architecture, implementation decisions, and integration logic were manually reviewed and maintained.
