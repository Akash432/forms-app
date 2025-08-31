# Project Blueprint

## Overview

This document outlines the features, design, and progress of the Flutter application. It serves as a single source of truth for the project's development.

## Current Features & Design

### Login Page

*   **Design:** A modern, dark-themed login screen inspired by the provided CSS.
*   **Layout:** A centered, single-column layout that is responsive and avoids overflow errors by being scrollable.
*   **Styling:**
    *   **Background:** Black (`#000000`).
    *   **Fonts:** `GoogleFonts.inter` for a clean, modern look.
    *   **Buttons:** Pill-shaped buttons with a `50px` border-radius.
    *   **Colors:** A primary action color of `#0A84FF`.
*   **Functionality:**
    *   Social login buttons for Google and Apple.
    *   A prominent "Create an account" button.
    *   A "Sign in" link for existing users.
    *   A footer with links to the Terms of Service and Privacy Policy.

## Current Task: Fixing the Google Logo

*   **Problem:** The Google logo is not displaying correctly because the previous URL was for an SVG file, which is not reliably handled by Flutter's `Image.network` widget.
*   **Solution:** Update the `lib/login_page.dart` file to use a reliable PNG version of the Google logo.
