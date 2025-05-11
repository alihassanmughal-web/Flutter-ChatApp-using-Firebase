
# 🔹 Flutter Firebase Chat App

A real-time chat application built using **Flutter** and **Firebase Firestore**. The app supports user authentication, user search, and one-on-one chatrooms with structured Firestore document storage.

---

## 📁 Features

* 🔐 **User Authentication**

  * Firebase Authentication using email
* 👤 **User Profiles**

  * Each user has an ID, name, email, photo, and searchable username
* 💬 **Chatrooms**

  * Real-time chat between two users
  * Messages stored in uniquely identified chatroom documents
* 🔍 **Search**

  * Search for users using SearchKey (first letter of name)
* 🔔 **Firebase Firestore**

  * Used for storing users, chatrooms, and real-time messages

---

## 📂 Firestore Structure

### 🔸 Collection: `users`

Each document contains user information:

| Field     | Type   | Description                     |
| --------- | ------ | ------------------------------- |
| Id        | String | Unique identifier               |
| Name      | String | User's full name                |
| E-mail    | String | User's email                    |
| username  | String | Unique chat username            |
| SearchKey | String | First character of the name     |
| Photo     | String | (Optional) URL to profile image |

---

### 🔹 Collection: `chatrooms`

Each document is named as: `USER1_USERNAME_USER2_USERNAME`
Example: `ALIHASSAN_AMNAKANWAL13`

| Field | Type  | Description                              |
| ----- | ----- | ---------------------------------------- |
| users | Array | Array containing usernames of both users |

> A subcollection (e.g., `messages`) may be included to store chat data between users (not shown in screenshot but assumed).

---

## 🛠️ Tech Stack

* **Flutter** (frontend)
* **Firebase Firestore** (NoSQL database)
* **Firebase Authentication**
* **Dart** language



---

## 🚀 Getting Started

### 🔧 Prerequisites

* Flutter SDK
* Firebase Project with Firestore enabled
* Android Studio or VS Code

### 🔨 Setup

1. Clone the repo:

   ```bash
   git clone https://github.com/your-repo/flutter-chat-app.git
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Connect Firebase:

   * Add `google-services.json` (Android) or `GoogleService-Info.plist` (iOS)
   * Enable Email/Password authentication
   * Create `users` and `chatrooms` collections

4. Run the app:

   ```bash
   flutter run
   ```

---

## 📌 Known Issues

* Slow message delivery on weak internet
* No group chat support (yet)
* NO Voice and Video Calls

---

 ## 🤝 Contributors

* Ali Hassan – [mughalalihassan693@gmail.com](mailto:alihassanmughal@gmail.com)


## 📄 License

This project is licensed under the MIT License. See `LICENSE` for more information.



