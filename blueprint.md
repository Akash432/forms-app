# Project Blueprint: Forms App

## Overview

This document outlines the plan, features, and design for the Forms App, a Flutter application for creating and managing forms.

## Implemented Features

*   **Authentication:** User authentication using Firebase Auth with email and password.
*   **Role-Based Routing:** Implemented role-based routing using `go_router` to direct users to the appropriate screens based on their role (admin or user).
*   **Project Structure:** Set up a scalable project structure with separate directories for core services, features, and models.
*   **Services:**
    *   `AuthService`: Handles user authentication (sign in, sign up, sign out).
    *   `FirestoreService`: Interacts with Cloud Firestore to manage user data and roles.
*   **Screens:**
    *   `LoginScreen`: Allows users to sign in.
    *   `AdminDashboardScreen`: The main dashboard for admin users.
    *   `AdminFormsScreen`: A screen for admins to manage forms.
    *   `UserDashboardScreen`: The main dashboard for regular users.
*   **Models:**
    *   `UserModel`: Represents the user data model.

## Current Plan

The current plan is to build a robust forms application with the following core functionalities:

### 1.  **User Management:**
    *   Admins can create new user accounts.
    *   Admins can assign roles (admin or user) to users.

### 2.  **Form Creation:**
    *   Admins can create dynamic forms with various field types (text, multiple choice, etc.).
    *   Admins can publish and unpublish forms.

### 3.  **Form Submission:**
    *   Users can view and submit forms assigned to them.
    *   Users can view their past submissions.

### 4.  **Results Analysis:**
    *   Admins can view and analyze form submissions.
    *   Admins can export submission data.

## Design

The application will follow Material Design 3 principles, with a clean and modern UI.

*   **Color Scheme:** A color scheme based on `Colors.deepPurple` will be used for a consistent and professional look.
*   **Typography:** The `google_fonts` package will be used to enhance the typography with the "Oswald" and "Roboto" fonts.
*   **Layout:** The layout will be responsive and adapt to different screen sizes.

