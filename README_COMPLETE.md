# 🏢 Employee Leave Management System

A full-stack MERN (MongoDB, Express.js, React, Node.js) application for managing employee leave requests with role-based access control for employees and managers.

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

## 🛠️ Installation & Setup

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/employee-leave-management.git
cd employee-leave-management
```

### 2. Backend Setup

```bash
# Navigate to backend directory
cd backend

# Install dependencies
npm install

# Create .env file (see Environment Variables section below)
# Add your MongoDB connection string and JWT secret

# Start the backend server
npm start
```

The backend server will run on **http://localhost:5000**

### 3. Frontend Setup

```bash
# Navigate to frontend directory (from root)
cd frontend

# Install dependencies
npm install

# Create .env file (see Environment Variables section below)
# Configure port and API URL

# Start the frontend development server
npm start
```

The frontend will run on **http://localhost:3001**

## 🔐 Environment Variables

### Backend (.env)

Create a `.env` file in the `backend` directory:

```env
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/leave_management
JWT_SECRET=your_super_secret_jwt_key_change_this_in_production
PORT=5000
```

**Required Variables:**
- `MONGODB_URI` - Your MongoDB Atlas connection string
- `JWT_SECRET` - Secret key for JWT token generation (use a strong random string)
- `PORT` - Backend server port (default: 5000)

### Frontend (.env)

Create a `.env` file in the `frontend` directory:

```env
PORT=3001
REACT_APP_API_URL=http://localhost:5000/api
BROWSER=none
```

**Variables:**
- `PORT` - Frontend development server port
- `REACT_APP_API_URL` - Backend API endpoint
- `BROWSER` - Set to 'none' to prevent auto-opening browser

## 🗄️ MongoDB Atlas Setup

1. **Create Account**: Sign up at [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)
2. **Create Cluster**: Create a free M0 cluster
3. **Database Access**: Create a database user with password
4. **Network Access**: Add IP address (0.0.0.0/0 for development)
5. **Get Connection String**: 
   - Click "Connect" → "Connect your application"
   - Copy the connection string
   - Replace `<password>` with your database user password
   - Add database name: `/leave_management`

Example:
```
mongodb+srv://myuser:mypassword@cluster0.xxxxx.mongodb.net/leave_management
```

## 🎯 How to Run

### Development Mode

**Option 1: Run Both Servers Separately**

Terminal 1 (Backend):
```bash
cd backend
npm start
```

Terminal 2 (Frontend):
```bash
cd frontend
npm start
```

**Option 2: Using PowerShell Scripts**

Backend:
```powershell
Set-Location backend; npm start
```

Frontend:
```powershell
Set-Location frontend; npm start
```

### Access the Application

- **Frontend**: http://localhost:3001
- **Backend API**: http://localhost:5000/api
- **API Health Check**: http://localhost:5000/api/test

## 📸 Screenshots

### Login Page - Role Selection
Beautiful role-based login interface with animated gradients

### Employee Dashboard
- View leave balance (Annual: 20, Sick: 12, Casual: 10 days)
- Apply for leave with date picker and reason
- Track all leave requests with status badges

### Manager Dashboard
- Review pending leave requests in card view
- Approve or reject with comments
- View complete leave history in table format
- Team statistics and metrics

## 📁 Project Structure

```
employee-leave-management/
├── backend/
│   ├── config/
│   │   └── db.js              # MongoDB connection
│   ├── controllers/
│   │   ├── authController.js  # Authentication logic
│   │   ├── leaveController.js # Leave management
│   │   └── dashboardController.js
│   ├── middleware/
│   │   └── auth.js            # JWT verification
│   ├── models/
│   │   ├── User.js            # User schema
│   │   └── LeaveRequest.js    # Leave request schema
│   ├── routes/
│   │   ├── auth.js            # Auth routes
│   │   ├── leaves.js          # Leave routes
│   │   └── dashboard.js       # Dashboard routes
│   ├── .env                   # Environment variables
│   ├── .env.example           # Environment template
│   ├── package.json
│   └── server.js              # Express server entry
│
├── frontend/
│   ├── public/
│   │   ├── index.html
│   │   ├── manifest.json
│   │   └── robots.txt
│   ├── src/
│   │   ├── components/
│   │   │   ├── Login.js       # Login component
│   │   │   ├── Login.css
│   │   │   ├── Register.js    # Registration
│   │   │   ├── Dashboard.js   # Employee dashboard
│   │   │   ├── Dashboard.css
│   │   │   ├── ManagerDashboard.js
│   │   │   ├── ManagerDashboard.css
│   │   │   ├── ManagerStats.js
│   │   │   ├── LeaveForm.js   # Apply leave form
│   │   │   └── LeaveList.js   # Leave history
│   │   ├── redux/
│   │   │   ├── store.js       # Redux store
│   │   │   └── slices/
│   │   │       ├── authSlice.js
│   │   │       └── leaveSlice.js
│   │   ├── services/
│   │   │   └── api.js         # Axios configuration
│   │   ├── App.js             # Main app component
│   │   ├── App.css
│   │   └── index.js           # React entry point
│   ├── .env                   # Frontend environment
│   ├── .env.example           # Environment template
│   └── package.json
│
├── .gitignore                 # Git ignore rules
├── .env.example              # Root environment template
├── README.md                 # This file
├── LICENSE                   # MIT License
└── CONTRIBUTING.md           # Contribution guidelines
```

## 🔌 API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - User login
- `GET /api/auth/me` - Get current user

### Leave Management (Employee)
- `POST /api/leaves/apply` - Apply for leave
- `GET /api/leaves/my-requests` - Get user's leave requests
- `DELETE /api/leaves/cancel/:id` - Cancel leave request
- `GET /api/leaves/balance` - Get leave balance

### Leave Management (Manager)
- `GET /api/leaves/all` - Get all leave requests
- `GET /api/leaves/pending` - Get pending requests
- `PUT /api/leaves/approve/:id` - Approve leave request
- `PUT /api/leaves/reject/:id` - Reject leave request

### Dashboard
- `GET /api/dashboard/stats` - Get dashboard statistics

## 🎨 Features Showcase

### Beautiful UI/UX
- ✨ Modern gradient backgrounds with animated particles
- 🎭 Role-based themed interfaces (Employee: Blue, Manager: Pink)
- 💫 Smooth animations and transitions
- 📱 Responsive design for all devices
- 🎯 Intuitive navigation and user flow

### Security Features
- 🔐 JWT-based authentication
- 🔒 Password hashing with bcryptjs
- 🛡️ Protected routes and API endpoints
- 👮 Role-based access control

### Leave Balance System
- 📊 Annual Leave: 20 days (default)
- 🤒 Sick Leave: 12 days (default)
- 🎉 Casual Leave: 10 days (default)
- ⚡ Real-time balance updates

## 🐛 Troubleshooting

### Backend Issues

**MongoDB Connection Error:**
```bash
Error: Could not connect to MongoDB
```
Solution: Check your MongoDB URI, ensure network access is configured, and database user credentials are correct.

**Port Already in Use:**
```bash
Error: Port 5000 is already in use
```
Solution: Change PORT in backend/.env or kill the process using port 5000.

### Frontend Issues

**Module Not Found:**
```bash
Error: Cannot find module 'react'
```
Solution: Run `npm install` in the frontend directory.

**API Connection Failed:**
```bash
Error: Network Error
```
Solution: Ensure backend server is running on port 5000 and REACT_APP_API_URL is correctly set.

### Common Issues

**CORS Error:**
- Ensure backend CORS is configured properly
- Check API URL in frontend matches backend port

**JWT Token Expired:**
- Login again to get a fresh token
- Check JWT_SECRET is consistent

## 📝 Development Notes

### Leave Balance Logic
- Leave balances are stored per user in the User model
- When leave is approved, balance is deducted automatically
- Rejected/cancelled leaves don't affect balance
- Balance is displayed on employee dashboard

### Status Flow
1. **Pending** - Initial state when employee applies
2. **Approved** - Manager approves (balance deducted)
3. **Rejected** - Manager rejects (balance unchanged)

## 🤝 Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Rishi Manjunath**
- GitHub: [@yourusername](https://github.com/yourusername)
- Email: your-email@example.com

## 🙏 Acknowledgments

- MongoDB Atlas for cloud database hosting
- React team for the amazing framework
- Express.js for the robust backend framework
- Redux Toolkit for state management
- All contributors who helped improve this project

## 📞 Support

For support:
- 📧 Email: your-email@example.com
- 🐛 Issues: [GitHub Issues](https://github.com/yourusername/employee-leave-management/issues)
- 💬 Discussions: [GitHub Discussions](https://github.com/yourusername/employee-leave-management/discussions)

---

**Made with ❤️ using MERN Stack**

⭐ Star this repository if you find it helpful!
