# Vercel Deployment Guide for Employee Leave Management System

This guide will help you deploy both the frontend and backend to Vercel.

## 📋 Prerequisites

1. **Vercel Account**: Sign up at [vercel.com](https://vercel.com)
2. **GitHub Repository**: Your code should be pushed to GitHub
3. **MongoDB Atlas**: Running database with connection string

## 🚀 Deployment Steps

### Part 1: Deploy Backend API

1. **Go to Vercel Dashboard**
   - Visit [vercel.com/dashboard](https://vercel.com/dashboard)
   - Click "Add New Project"

2. **Import Backend Repository**
   - Select your GitHub repository
   - Click "Import"
   - **Set Root Directory**: `backend`
   - Click "Continue"

3. **Configure Backend Environment Variables**
   Add these in the Environment Variables section:
   ```
   MONGODB_URI=mongodb+srv://your_username:password@cluster.mongodb.net/leave_management
   JWT_SECRET=your_super_secret_jwt_key_change_this_in_production
   PORT=5000
   NODE_ENV=production
   ```

4. **Deploy Backend**
   - Click "Deploy"
   - Wait for deployment to complete
   - Copy the backend URL (e.g., `https://your-backend.vercel.app`)

### Part 2: Deploy Frontend

1. **Add New Project Again**
   - Click "Add New Project"
   - Select the same repository
   - Click "Import"

2. **Configure Frontend**
   - **Set Root Directory**: `frontend`
   - **Framework Preset**: Create React App
   - Click "Continue"

3. **Configure Frontend Environment Variables**
   Add this in the Environment Variables section:
   ```
   REACT_APP_API_URL=https://your-backend.vercel.app/api
   ```
   **Important**: Replace `your-backend.vercel.app` with your actual backend URL from Part 1

4. **Build Settings** (should auto-detect):
   - Build Command: `npm run build`
   - Output Directory: `build`
   - Install Command: `npm install`

5. **Deploy Frontend**
   - Click "Deploy"
   - Wait for deployment to complete
   - Your app will be live!

## 🔧 Alternative: Deploy Both at Once

### Option A: Deploy as Monorepo

1. **Import Repository**
   - Don't set a root directory
   
2. **Configure vercel.json** (already created in root)
   ```json
   {
     "version": 2,
     "builds": [
       {
         "src": "backend/server.js",
         "use": "@vercel/node"
       },
       {
         "src": "frontend/package.json",
         "use": "@vercel/static-build",
         "config": {
           "distDir": "frontend/build"
         }
       }
     ],
     "routes": [
       {
         "src": "/api/(.*)",
         "dest": "backend/server.js"
       },
       {
         "src": "/(.*)",
         "dest": "frontend/$1"
       }
     ]
   }
   ```

### Option B: Using Vercel CLI

1. **Install Vercel CLI**
   ```bash
   npm install -g vercel
   ```

2. **Login to Vercel**
   ```bash
   vercel login
   ```

3. **Deploy Backend**
   ```bash
   cd backend
   vercel --prod
   ```
   - Follow prompts
   - Add environment variables when asked
   - Copy the deployment URL

4. **Deploy Frontend**
   ```bash
   cd ../frontend
   vercel --prod
   ```
   - Add `REACT_APP_API_URL` with backend URL
   - Deploy

## ⚙️ Environment Variables Setup

### Backend Variables (Required)
```env
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/leave_management
JWT_SECRET=your_secret_key_here
PORT=5000
NODE_ENV=production
```

### Frontend Variables (Required)
```env
REACT_APP_API_URL=https://your-backend-url.vercel.app/api
```

## 🔄 Update CORS in Backend

Before deploying, update your backend CORS configuration:

**backend/server.js**
```javascript
const cors = require('cors');

app.use(cors({
  origin: [
    'http://localhost:3001',
    'https://your-frontend-url.vercel.app'  // Add your Vercel frontend URL
  ],
  credentials: true
}));
```

## 🐛 Common Issues & Solutions

### Issue 1: CORS Error
**Problem**: Frontend can't connect to backend
**Solution**: 
- Add frontend URL to CORS whitelist in backend
- Redeploy backend

### Issue 2: Environment Variables Not Working
**Problem**: API calls fail
**Solution**:
- Check if environment variables are set in Vercel dashboard
- Make sure `REACT_APP_` prefix is used for frontend vars
- Redeploy after adding variables

### Issue 3: 404 on Page Refresh
**Problem**: Routes don't work after refresh
**Solution**: 
- Frontend `vercel.json` should have rewrites configured (already done)
- Redeploy if needed

### Issue 4: API Routes Not Found
**Problem**: Backend endpoints return 404
**Solution**:
- Check `vercel.json` routes configuration
- Ensure all API routes start with `/api`
- Verify backend URL in frontend env variable

## 📊 Monitoring & Logs

- **View Logs**: Vercel Dashboard → Your Project → Deployments → View Function Logs
- **Monitor Performance**: Vercel Analytics (enable in project settings)
- **Check Build Logs**: Click on any deployment to see build output

## 🔒 Security Checklist

- ✅ Strong JWT_SECRET in production
- ✅ MongoDB network access restricted to Vercel IPs (if possible)
- ✅ Environment variables set in Vercel (not in code)
- ✅ CORS properly configured
- ✅ HTTPS enabled (automatic with Vercel)

## 🔄 Continuous Deployment

Once set up, Vercel automatically:
- Deploys on every push to main branch
- Creates preview deployments for pull requests
- Provides deployment URLs for each commit

## 📱 Custom Domain (Optional)

1. Go to Project Settings → Domains
2. Add your custom domain
3. Update DNS records as instructed
4. Update CORS settings with new domain

## 🎉 Post-Deployment

After successful deployment:

1. **Test the Application**
   - Visit your frontend URL
   - Register a new user
   - Test login/logout
   - Apply for leave
   - Test manager features

2. **Update README**
   - Add live demo link
   - Update API documentation with production URLs

3. **Share Your Project**
   - Add project link to GitHub README
   - Share on LinkedIn/Portfolio

## 📞 Need Help?

- Vercel Docs: [vercel.com/docs](https://vercel.com/docs)
- Vercel Discord: [vercel.com/discord](https://vercel.com/discord)
- GitHub Issues: Open an issue in your repository

---

**Live URLs After Deployment:**
- Frontend: `https://your-project-name.vercel.app`
- Backend: `https://your-backend-name.vercel.app`

Remember to replace these URLs in your documentation after deployment!
