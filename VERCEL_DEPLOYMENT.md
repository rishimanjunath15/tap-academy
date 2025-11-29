# 🚀 Vercel Deployment Guide

## Complete Guide to Deploy Employee Leave Management System on Vercel

This guide will help you deploy both **Backend (API)** and **Frontend (React)** on Vercel.

---

## 📋 Prerequisites

1. **Vercel Account** - Sign up at [vercel.com](https://vercel.com) (free tier available)
2. **GitHub Account** - Your code should be pushed to GitHub
3. **MongoDB Atlas** - Database should be set up with proper IP whitelist

---

## 🎯 Deployment Steps

### **STEP 1: Prepare Your Repository**

#### 1.1 Push to GitHub

```bash
# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit changes
git commit -m "Ready for Vercel deployment"

# Create repository on GitHub, then:
git remote add origin https://github.com/rishimanjunath15/employee-leave-management.git
git branch -M main
git push -u origin main
```

#### 1.2 Update .gitignore

Ensure `.gitignore` includes:
```
node_modules/
.env
.env.local
.vercel
build/
dist/
```

---

### **STEP 2: Deploy Backend API**

#### 2.1 Login to Vercel
1. Go to [vercel.com](https://vercel.com)
2. Click **"Sign Up"** or **"Login"**
3. Connect with **GitHub**

#### 2.2 Import Backend Project
1. Click **"Add New..."** → **"Project"**
2. Import your GitHub repository: `employee-leave-management`
3. Vercel will detect it has multiple folders
4. Configure as follows:

**Framework Preset:** `Other`
**Root Directory:** `backend`
**Build Command:** Leave empty (not needed for Node.js API)
**Output Directory:** Leave empty
**Install Command:** `npm install`

#### 2.3 Add Environment Variables

Click **"Environment Variables"** and add:

```
MONGODB_URI=mongodb+srv://rishimanjunath15_db_user:employeeleave@cluster0.sq8b5h5.mongodb.net/leave_management
JWT_SECRET=your_super_secret_jwt_key_12345
NODE_ENV=production
```

⚠️ **Important:** Use your actual MongoDB connection string!

#### 2.4 Deploy Backend
1. Click **"Deploy"**
2. Wait for deployment (1-2 minutes)
3. Your API URL will be: `https://your-backend-name.vercel.app`

**Example:** `https://employee-leave-backend.vercel.app`

#### 2.5 Test Backend API
Visit: `https://your-backend-name.vercel.app/`

You should see:
```json
{
  "message": "Employee Leave Management API",
  "status": "Running"
}
```

---

### **STEP 3: Deploy Frontend**

#### 3.1 Update Frontend API URL

**IMPORTANT:** Before deploying frontend, update the API URL:

Create/update `frontend/.env.production`:
```
REACT_APP_API_URL=https://your-backend-name.vercel.app/api
```

Or in `frontend/src/services/api.js`, update:
```javascript
const API_URL = process.env.REACT_APP_API_URL || 'https://your-backend-name.vercel.app/api';
```

#### 3.2 Commit Changes
```bash
git add .
git commit -m "Update API URL for production"
git push
```

#### 3.3 Import Frontend Project
1. In Vercel dashboard, click **"Add New..."** → **"Project"**
2. Select same repository: `employee-leave-management`
3. Configure as follows:

**Framework Preset:** `Create React App`
**Root Directory:** `frontend`
**Build Command:** `npm run build`
**Output Directory:** `build`
**Install Command:** `npm install`

#### 3.4 Add Environment Variables

Click **"Environment Variables"** and add:

```
REACT_APP_API_URL=https://your-backend-name.vercel.app/api
```

Replace `your-backend-name` with your actual backend URL!

#### 3.5 Deploy Frontend
1. Click **"Deploy"**
2. Wait for deployment (2-3 minutes)
3. Your frontend URL will be: `https://your-frontend-name.vercel.app`

---

### **STEP 4: Configure CORS (Backend)**

Update `backend/server.js` CORS configuration:

```javascript
const cors = require('cors');

// Update CORS to allow your frontend domain
app.use(cors({
  origin: [
    'http://localhost:3001',
    'https://your-frontend-name.vercel.app'
  ],
  credentials: true
}));
```

Commit and push:
```bash
git add .
git commit -m "Update CORS for production"
git push
```

Vercel will auto-redeploy backend.

---

### **STEP 5: Update MongoDB Atlas Network Access**

1. Go to [MongoDB Atlas](https://cloud.mongodb.com)
2. Navigate to **Network Access**
3. Click **"Add IP Address"**
4. Choose **"Allow Access from Anywhere"** (`0.0.0.0/0`)
   - This allows Vercel's dynamic IPs to connect
5. Click **"Confirm"**

---

### **STEP 6: Test Your Deployed Application**

1. **Visit Frontend URL:** `https://your-frontend-name.vercel.app`
2. **Test Login/Register:**
   - Create a new account
   - Login as employee
   - Apply for leave
3. **Test Manager Features:**
   - Register as manager
   - Approve/reject leaves

---

## 🔧 Troubleshooting

### **Backend Issues**

**Problem:** "Cannot GET /"
- **Solution:** Check `vercel.json` exists in backend folder
- Ensure `module.exports = app;` is in `server.js`

**Problem:** MongoDB connection error
- **Solution:** Add `0.0.0.0/0` to MongoDB Network Access
- Verify connection string in Vercel environment variables

**Problem:** 500 Internal Server Error
- **Solution:** Check Vercel Function Logs (Dashboard → Project → Logs)

### **Frontend Issues**

**Problem:** API calls failing
- **Solution:** Update `REACT_APP_API_URL` in Vercel environment variables
- Rebuild frontend: Dashboard → Deployments → ⋯ → Redeploy

**Problem:** Blank page after deployment
- **Solution:** Check browser console for errors
- Verify build succeeded in Vercel logs

### **CORS Issues**

**Problem:** "Access-Control-Allow-Origin" error
- **Solution:** Update CORS in `backend/server.js`
- Add your frontend Vercel URL to allowed origins

---

## 📝 Post-Deployment Checklist

- [ ] Backend deployed and accessible
- [ ] Frontend deployed and accessible
- [ ] API URL updated in frontend
- [ ] CORS configured properly
- [ ] MongoDB Atlas allows Vercel IPs
- [ ] Environment variables set correctly
- [ ] Registration works
- [ ] Login works (employee & manager)
- [ ] Leave application works
- [ ] Manager approval works

---

## 🎨 Custom Domains (Optional)

### Add Custom Domain to Frontend
1. Go to Vercel Dashboard → Your Frontend Project
2. Click **"Settings"** → **"Domains"**
3. Add your domain (e.g., `leave.yourcompany.com`)
4. Update DNS records as instructed
5. Update CORS in backend with new domain

### Add Custom Domain to Backend
1. Go to Vercel Dashboard → Your Backend Project
2. Follow same steps
3. Update `REACT_APP_API_URL` in frontend

---

## 🔄 Continuous Deployment

Vercel automatically redeploys when you push to GitHub:

```bash
# Make changes
git add .
git commit -m "Update feature"
git push

# Vercel will auto-deploy both projects
```

---

## 📊 Monitor Your Application

### Vercel Dashboard
- **Analytics:** Monitor page views and performance
- **Logs:** Check function logs for errors
- **Deployments:** View deployment history

### MongoDB Atlas
- **Metrics:** Monitor database performance
- **Alerts:** Set up alerts for issues

---

## 🎯 Production URLs

After deployment, you'll have:

- **Backend API:** `https://employee-leave-backend.vercel.app`
- **Frontend App:** `https://employee-leave-frontend.vercel.app`

**Share these URLs** with your team or in your README!

---

## 💡 Pro Tips

1. **Environment Variables:** Use different `.env` files for dev/prod
2. **Branch Deployments:** Push to `dev` branch for testing
3. **Preview Deployments:** Vercel creates preview URLs for PRs
4. **Performance:** Enable Edge Functions for faster response
5. **Monitoring:** Set up Vercel Analytics for insights

---

## 📞 Need Help?

- **Vercel Docs:** [vercel.com/docs](https://vercel.com/docs)
- **MongoDB Atlas Docs:** [docs.mongodb.com/atlas](https://docs.mongodb.com/atlas)
- **GitHub Issues:** Open an issue in your repository

---

**🎉 Congratulations! Your MERN app is now live on Vercel!**
