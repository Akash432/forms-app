# Blueprint: Form Builder & Management App

## 1. Overview

This document outlines the development plan for a comprehensive form builder and management application built with Flutter and Firebase. The app will support two distinct user roles, **Admin** and **User**, each with a tailored interface and functionalities.

- **Admin users** will have the ability to create, manage, and analyze forms, view submissions, and oversee all form-related activities.
- **Regular users** will be able to view and fill out forms that have been assigned to them by an admin.

The application will feature a modern, intuitive interface and will be designed to be scalable and maintainable.

## 2. Core Features

### 2.1. Authentication
- **Firebase Authentication** will be used for secure user sign-up and sign-in (Email & Password).
- A clear and simple UI will be provided for both authentication processes.

### 2.2. Role-Based Access Control
- After logging in, the app will check the user's role and navigate them to the appropriate dashboard (Admin or User).
- This ensures that users only have access to the features and data relevant to their role.

### 2.3. Admin Dashboard & Functionalities
The admin dashboard will feature a `BottomNavigationBar` with the following screens:
- **Dashboard Screen:** Displays key statistics such as "Total Forms," "Total Submissions," and "Average Response Rate." A "Recent Activity" section will show the latest form submissions.
- **Forms Screen:** A comprehensive list of all created forms, with options to view submissions, edit, or change the status of each form (Active/Paused). A `FloatingActionButton` will allow for the creation of new forms.
- **Analytics Screen:** A dedicated screen for visualizing form data with various charts and graphs.
- **Submissions List Screen:** Displays all submissions for a selected form, with each entry showing the submission date and a summary of the AI analysis.

### 2.4. User Dashboard & Functionalities
The user dashboard will also use a `BottomNavigationBar` and will include:
- **Dashboard Screen:** Shows user-specific stats like "Total Forms Assigned" and "Total Submissions."
- **Forms Screen:** Lists all forms assigned to the user, with their status and the number of times the user has submitted each form.
- **Analytics Screen:** A placeholder for visualizing personal submission data.

### 2.5. Form Builder
- A powerful and intuitive screen for admins to create and edit forms.
- **Component Palette:** A selection of form fields will be available, including:
  - Text Input (Single and Multi-line)
  - Multiple Choice (Radio Buttons)
  - Checkboxes
  - Dropdown Menu
  - Date Picker
  - Number Input
  - Image Upload
  - GPS Location
- **Customization:** Admins can edit field labels and manage options for choice-based fields.
- **Save Functionality:** The form structure will be saved to the `forms` collection in Firestore.

### 2.6. Form Filling & Submissions
- **Dynamic Form Rendering:** Forms will be displayed dynamically based on the structure defined in Firestore.
- **Submission Handling:** A "Submit" button will save the user's responses to a `submissions` sub-collection in Firestore.

## 3. Data Models

### 3.1. `forms` Collection
- Each document will represent a unique form and will include:
  - `formId`: Unique identifier.
  - `name`: The name of the form.
  - `description`: A brief description of the form.
  - `createdAt`: Timestamp of when the form was created.
  - `status`: `'active'` or `'paused'`.
  - `fields`: An array of maps, where each map represents a form field with its type, label, and other properties.

### 3.2. `submissions` Sub-collection
- A sub-collection within each form document will store all submissions for that form.
- Each submission document will contain:
  - `submissionId`: Unique identifier for the submission.
  - `submittedAt`: Timestamp of the submission.
  - `data`: A map containing the user's responses.
  - `analysis`: A map for storing results from AI-based analysis.

## 4. Technical Implementation Plan

### Step 1: Foundational Setup
- **Project Initialization:** Create a new Flutter project.
- **Directory Structure:** Organize the project into feature-based directories (`auth`, `admin`, `user`, `forms`, `core`) to ensure a clean and scalable architecture.
- **Firebase Integration:**
  - Add `firebase_core`, `firebase_auth`, and `cloud_firestore` to `pubspec.yaml`.
  - Configure the Firebase project and initialize Firebase in `lib/main.dart`.
  - Set up the required server configurations in `.idx/mcp.json`.

### Step 2: Authentication Flow
- **UI Screens:**
  - Create a sign-in screen with email and password fields.
  - Create a sign-up screen with fields for name, email, password, and role selection (Admin/User).
- **Authentication Service:**
  - Implement a dedicated service to handle all Firebase Authentication logic, including sign-up, sign-in, and sign-out.
  - The service will also manage user data in Firestore.

### Step 3: Home & Navigation
- **Home Screen:**
  - This screen will act as a router, determining the user's role and navigating them to the appropriate dashboard.
- **Role-Based Dashboards:**
  - Create separate dashboard widgets for Admin and User, each with its own `BottomNavigationBar`.

### Step 4: Admin-Specific Features
- **Dashboard Screen:**
  - Design and implement the UI for displaying key statistics and recent activity.
- **Forms Screen:**
  - Develop the UI to list all forms, with functionality to navigate to the form builder and submissions screen.
- **Form Builder:**
  - Implement the form builder UI, including the component palette and the main form area.
  - Develop the logic to add, edit, and save form fields.
- **Submissions Screen:**
  - Create the UI to display a list of all submissions for a given form.

### Step 5: User-Specific Features
- **Dashboard & Forms Screens:**
  - Design and implement the UI to display assigned forms and user-specific statistics.
- **Form Filling Screen:**
  - Develop the screen to dynamically render and handle form submissions.

### Step 6: Data Models & Services
- **Model Classes:**
  - Create Dart classes for the `Form` and `Submission` models to ensure type safety.
- **Firestore Service:**
  - Implement a service to manage all interactions with Firestore, including creating, reading, and updating forms and submissions.
