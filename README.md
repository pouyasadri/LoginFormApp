# User Management App with SwiftUI and Supabase

Welcome to the User Management App project! This repository contains the code for building a basic user management app using SwiftUI and Supabase. The app features user authentication, profile management, and photo uploads, all integrated seamlessly for iOS 18.

## Features

- **User Authentication**: Log in through magic links sent to users' emails (no password setup required).
- **Profile Management**: Update and manage user profile details.
- **Photo Upload**: Upload and display user profile photos.
- **Secure Data Storage**: Store user data securely using Supabase's Postgres database and Row Level Security.

## Technologies Used

- **SwiftUI**: For building the user interface.
- **Supabase Database**: A Postgres database for storing user data.
- **Supabase Auth**: For user authentication.
- **Supabase Storage**: For storing user profile photos.

## Getting Started

### Prerequisites

- Xcode 12 or later
- iOS 14 or later
- A Supabase account

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/yourusername/user-management-app.git
    cd user-management-app
    ```

2. **Install dependencies:**

    Open the project in Xcode and resolve any package dependencies.

3. **Set up Supabase:**

    - Create a new project on [Supabase](https://supabase.io/).
    - Set up a new database, authentication, and storage in the Supabase dashboard.
    - Retrieve your Supabase URL and API key from the dashboard.

4. **Configure the app:**

    - Open `supabase.swift`.
    - Replace the placeholder values with your Supabase URL and API key:

    ```swift
    let supabase = SupabaseClient(supabaseURL: URL(string: "YOUR_SUPABASE_URL")!,
     supabaseKey: "YOUR_SUPABASE_API_KEY")
    ```

### Usage

1. **Run the app:**

    Open the project in Xcode, select a target device, and hit `Run`.

2. **Log in:**

    Use the magic link sent to your email to log in.

3. **Update Profile:**

    Navigate to the profile section to update your profile details and upload a profile photo.

## Contributing

Contributions are welcome! Please fork the repository and use a feature branch. Pull requests are reviewed on a regular basis.
