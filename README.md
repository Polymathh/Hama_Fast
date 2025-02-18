Relocation App

Overview

Relocation App is a platform where users can browse and shortlist houses for rent or purchase, while landlords and real estate agents can list their properties. The app is built using Flutter for the frontend and Django with MySQL for the backend.

Features

User Authentication

JWT-based authentication

Separate roles: House Seekers & Landlords/Agents

User registration and login

Property Listings

Landlords/Agents can post properties with details (title, location, price, house type, etc.)

Users can browse, search, and filter properties

Favorites & Shortlist

Users can save properties they are interested in

Messaging System (Future Enhancement)

Chat between users and landlords/agents using Django Channels

Image & Video Uploads

Store media files on AWS S3, DigitalOcean Spaces, or local server

Tech Stack

Frontend

Flutter (Dart) for UI and API integration

Backend

Django (Django REST Framework) for API

MySQL for database

JWT for authentication

Cloud storage (AWS S3, DigitalOcean Spaces) or local media storage
