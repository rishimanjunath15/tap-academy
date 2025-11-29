# 🏢 Employee Leave Management System

A full-stack MERN (MongoDB, Express.js, React, Node.js) application for managing employee leave requests with role-based access control for employees and managers.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Node](https://img.shields.io/badge/node-%3E%3D14.0.0-brightgreen.svg)
![React](https://img.shields.io/badge/react-18.2.0-blue.svg)

## ✨ Features

### Employee Features
- 👤 **User Authentication** - Secure login/register with JWT tokens
- 📊 **Leave Balance Dashboard** - View remaining annual, sick, and casual leaves
- 📝 **Apply for Leave** - Submit leave requests with date range and reason
- 📋 **View Leave History** - Track all submitted requests with status
- ❌ **Cancel Requests** - Cancel pending leave requests

### Manager Features
- 👨‍💼 **Manager Dashboard** - Comprehensive overview of team leave requests
- ⏳ **Pending Approvals** - Review and manage pending leave requests
- ✅ **Approve/Reject Leaves** - Accept or decline with comments
- 📈 **Team Statistics** - View leave trends and team metrics
- 📋 **Leave History** - Complete history of all employee requests

## 🚀 Tech Stack

**Frontend:**
- React 18.2.0
- Redux Toolkit (State Management)
- React Router DOM v6
- Axios
- Modern CSS with Animations

**Backend:**
- Node.js
- Express.js 4.18.2
- MongoDB with Mongoose
- JWT Authentication
- bcryptjs for Password Hashing

## 📋 Prerequisites

Before running this application, make sure you have:

- **Node.js** (v14.0.0 or higher) - [Download](https://nodejs.org/)
- **MongoDB Atlas Account** (free tier) - [Sign up](https://www.mongodb.com/cloud/atlas)
- **Git** - [Download](https://git-scm.com/)

```
employee-leave-management/
├── backend/
│   ├── config/
│   │   └── db.js              # MongoDB connection
│   ├── models/
│   │   ├── User.js            # User schema
│   │   └── LeaveRequest.js    # Leave request schema
│   ├── routes/
│   │   ├── auth.js            # Authentication routes
│   │   ├── leaves.js          # Leave management routes
│   │   └── dashboard.js       # Dashboard routes
│   ├── middleware/
│   │   └── auth.js            # JWT & role-based auth middleware
│   ├── controllers/
│   │   ├── authController.js  # Auth logic
│   │   ├── leaveController.js # Leave management logic
│   │   └── dashboardController.js
│   ├── .env                   # Environment variables
│   ├── server.js              # Server entry point
│   └── package.json
├── frontend/
│   ├── src/
│   │   ├── redux/
│   │   │   ├── store.js       # Redux store
│   │   │   └── slices/
│   │   │       ├── authSlice.js
│   │   │       └── leaveSlice.js
│   │   ├── services/
│   │   │   └── api.js         # Axios instance with interceptors
│   │   ├── components/        # Reusable components
│   │   ├── pages/             # Page components
│   │   └── App.js
│   └── package.json
└── README.md
```

## Installation & Setup

### Prerequisites
- Node.js (v14 or higher)
- MongoDB (local or Atlas)
- npm or yarn

### Backend Setup

1. Navigate to the backend directory:
```bash
cd backend
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file in the backend directory:
```env
PORT=5000
MONGO_URI=mongodb://localhost:27017/leave_management
JWT_SECRET=your_super_secret_key_here
NODE_ENV=development
```

4. Start MongoDB (if running locally):
```bash
mongod
```

5. Start the backend server:
```bash
npm run dev
```

The server will run on http://localhost:5000

### Frontend Setup

1. Navigate to the frontend directory:
```bash
cd frontend
```

2. Install dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm start
```

The application will open at http://localhost:3000

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user
- `GET /api/auth/me` - Get current user

### Leave Management (Employee)
- `POST /api/leaves` - Apply for leave
- `GET /api/leaves/my-requests` - Get my leave requests
- `DELETE /api/leaves/:id` - Cancel pending request
- `GET /api/leaves/balance` - Get leave balance

### Leave Management (Manager)
- `GET /api/leaves/all` - Get all leave requests
- `GET /api/leaves/pending` - Get pending requests
- `PUT /api/leaves/:id/approve` - Approve leave request
- `PUT /api/leaves/:id/reject` - Reject leave request

### Dashboard (Manager)
- `GET /api/dashboard/stats` - Get dashboard statistics

## Default Leave Balance

Each new employee gets:
- Sick Leave: 10 days
- Casual Leave: 5 days
- Vacation: 5 days

## User Roles

- **Employee**: Can apply for leave, view their requests, and check balance
- **Manager**: Can view all requests, approve/reject leaves, and access dashboard

## Authentication

The application uses JWT (JSON Web Tokens) for authentication. Tokens are stored in localStorage and sent with each API request via the Authorization header.

## Environment Variables

### Backend (.env)
```
PORT=5000
MONGO_URI=your_mongodb_connection_string
JWT_SECRET=your_jwt_secret_key
NODE_ENV=development
```

## Development

### Running Backend in Development Mode
```bash
cd backend
npm run dev
```

### Running Frontend in Development Mode
```bash
cd frontend
npm start
```

## Future Enhancements

- Email notifications for leave approvals/rejections
- Calendar view for leave schedules
- Leave history reports
- Multiple manager approval workflow
- Holiday calendar integration
- Export leave reports to PDF/Excel

## License

ISC

## Author

Your Name

---

**Note**: Remember to change the JWT_SECRET in production and use environment-specific configuration.
