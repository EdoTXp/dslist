# 🎮 DSList - Game List Manager

Project developed with Professor Nélio Alves from the course: DevSuperior - Imersão Java Spring.

---

## 📖 - Index

1. [About This Project](#ℹ️---about-this-project)
2. [Architecture & Technologies](#️---architecture--technologies)
3. [How to Compile And Run](#---how-to-compile-and-run)
4. [Credits & Acknowledgements](#---credits--acknowledgements)

---

## ℹ️ - About This Project

This project is based on the backend developed during the "Imersão Java Spring" course by DevSuperior, taught by Professor Nélio Alves. The original application consists of a REST API for managing a video game list.

Subsequently, a **Flutter** frontend was developed to consume this API, turning the project into a full-stack application.

---

## 🛠️ - Architecture & Technologies

The project's architecture is divided into two main parts: Backend and Frontend.

**Backend (Java/Spring):**

* **Language:** Java 17
* **Framework:** Spring Boot
* **Architecture:** Layered (Controller, Service, Repository)
* **Database:** PostgreSQL
* **Build Tool:** Maven

**Frontend (Flutter):**

* **Language:** Dart
* **Framework:** Flutter
* **Architecture:** MVC (Model-View-Controller) with Repository Pattern
* For more details on the frontend architecture and dependencies, please refer to the [frontend README](./frontend/README.md).

---

## 🚀 - How to Compile And Run

### Backend (Spring Boot)

1. **Database Setup:** Ensure you have Docker and Docker Compose installed. Run the following command from the project root to start the PostgreSQL container:

    ```bash
    docker-compose up -d
    ```

2. **Populate the Database:** After the container is running, execute the following command from the project root to create and populate the database tables using the `create.sql` file:

    ```bash
    docker exec -i dev-postgresql psql -U postgres -d mydatabase < create.sql
    ```

3. **Run the Application:** Run the Spring Boot application. You can do this through your IDE (e.g., VS Code, IntelliJ) or from the terminal with Maven:

    ```bash
    ./mvnw spring-boot:run
    ```

The API will be available at `http://localhost:8080`.

### Frontend (Flutter)

1. **Navigate to the frontend directory:**

    ```bash
    cd frontend
    ```

2. **Run the application:**

    ```bash
    flutter run
    ```

For more detailed instructions on setting up the Flutter environment and running the app, please refer to the [frontend README](./frontend/README.md).

---

## 🙏 - Credits & Acknowledgements

* **Nélio Alves (DevSuperior):** For the excellent course and the backend project that formed the basis of this work https://github.com/devsuperior/dslist-backend.
* **Edoardo Fabrizio De Iovanna:** For developing and integrating the Flutter frontend.
