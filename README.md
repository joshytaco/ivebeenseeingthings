# Photo Gallery Application

A full-stack photo gallery application built with Ruby on Rails and React. Users can upload photos with metadata, view them in a grid layout, and manage their collections.

## Features

- Photo upload with metadata (title, description, location, date)
- Responsive photo grid display
- User authentication (email/password, Google, Apple)
- AWS S3 integration for photo storage
- AWS IAM integration for user-specific permissions

## Tech Stack

- Backend: Ruby on Rails 7
- Frontend: React with Tailwind CSS
- Database: PostgreSQL
- Storage: AWS S3
- Authentication: JWT + OAuth (Google, Apple)

## Prerequisites

- Ruby 3.2.0 or higher
- Node.js 16 or higher
- PostgreSQL
- AWS account with S3 and IAM access

## Setup

1. Clone the repository:

   ```bash
   git clone <repository-url>
   cd <repository-name>
   ```

2. Install backend dependencies:

   ```bash
   bundle install
   ```

3. Install frontend dependencies:

   ```bash
   cd client
   npm install
   cd ..
   ```

4. Create a `.env` file in the root directory with the following variables:

   ```
   AWS_ACCESS_KEY_ID=your_access_key
   AWS_SECRET_ACCESS_KEY=your_secret_key
   AWS_REGION=your_region
   AWS_BUCKET=your_bucket_name
   GOOGLE_CLIENT_ID=your_google_client_id
   GOOGLE_CLIENT_SECRET=your_google_client_secret
   APPLE_CLIENT_ID=your_apple_client_id
   APPLE_CLIENT_SECRET=your_apple_client_secret
   ```

5. Set up the database:

   ```bash
   rails db:create db:migrate
   ```

6. Start the application:
   ```bash
   ./start.sh
   ```

The application will be available at:

- Frontend: http://localhost:3000
- Backend API: http://localhost:3000/api/v1

## Development

- Backend API endpoints are prefixed with `/api/v1`
- Frontend development server runs on port 3000
- Backend server runs on port 3000
- The `start.sh` script manages both servers

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
