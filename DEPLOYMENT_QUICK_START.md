# Quick Deployment Commands

## Step 1: Push to GitHub
```bash
git add .
git commit -m "Configured for Vercel deployment"
git push origin main
```

## Step 2: Deploy Backend
1. Go to https://vercel.com
2. Click "Add New..." → "Project"
3. Import repository
4. Set Root Directory: `backend`
5. Add environment variables:
   - MONGODB_URI
   - JWT_SECRET
   - NODE_ENV=production
6. Deploy

## Step 3: Deploy Frontend
1. Update `frontend/.env.production` with backend URL
2. Commit and push changes
3. In Vercel, add new project
4. Set Root Directory: `frontend`
5. Add environment variable:
   - REACT_APP_API_URL=https://your-backend.vercel.app/api
6. Deploy

## Step 4: Update CORS
1. Update `backend/server.js` with your frontend URL
2. Commit and push (auto-redeploys)

## Step 5: MongoDB Atlas
1. Add 0.0.0.0/0 to Network Access

✅ Done! Your app is live!

See VERCEL_DEPLOYMENT.md for detailed instructions.
