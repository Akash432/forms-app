# Project Blueprint

## Overview

A Flutter application with a focus on a clean and modern user interface. This document outlines the design, features, and implementation plan.

## Current Goal: Login Screen UI (Revision 2)

Create a visually appealing and user-friendly login screen that is a pixel-perfect replica of the provided HTML and CSS design.

### UI Implementation Plan (Based on Provided CSS)

1.  **Dependencies**:
    *   `google_fonts`: For the 'Inter' font family.
    *   `flutter_svg`: To render the social media icons from network URLs.

2.  **File Structure**:
    *   `lib/src/features/auth/screens/login_screen.dart`: The main login screen implementation.
    *   `lib/main.dart`: The application entry point, updated to set the global font to 'Inter'.

3.  **Screen Structure (`login_screen.dart`)**:
    *   **Root Widget**: `Scaffold` with a background color of `#F0F9FF`.
    *   **Layout**: `SingleChildScrollView` to prevent overflow on smaller screens, containing a `Padding` widget inside a `Container` with a width of 360px for the main content.
    *   **Header**: "Welcome to SO." text, styled with `GoogleFonts.inter`, font size 22, and bold (700).
    *   **Social Login Section**:
        *   A `Column` of three custom-styled buttons (`.social-btn`).
        *   Each button will be a `SizedBox` containing an `ElevatedButton` to control the width.
        *   Inside the button: A `Row` with an `SvgPicture.network` for the icon (Google, Apple, Facebook) and a `Text` widget.
        *   Styles: White background, 1px solid #ddd border, 8px border radius.
    *   **Divider**: A `Row` with a centered `Text` widget displaying "or by email" with color `#666`.
    *   **Email/Password Form**:
        *   `TextField` for "Email Address" styled to match `input` CSS (2px solid #ccc border, 8px radius).
        *   `TextField` for "Password" inside a `Stack` or `Row` (`.password-container`) to position the visibility toggle icon (`👁`).
    *   **Forgot Password Link**: A `TextButton` styled to match `.forgot` (right-aligned, color `#444`).
    *   **Sign In Button**: An `ElevatedButton` styled to match `.btn` (background `#0A84FF`, white text, 14px padding, 8px radius). It will contain a `Row` with the text "Sign In" and an arrow icon (→).
    *   **Sign Up Link**: A `Row` at the bottom with a `RichText` or two `Text` widgets to style the "Create an account" link to match `.footer a` (color `#0A84FF`, bold font weight).

4.  **Main Application (`main.dart`)**:
    *   The `theme` property of the `MaterialApp` will be updated. The `fontFamily` will be set to `GoogleFonts.inter().fontFamily` to apply the 'Inter' font globally.
