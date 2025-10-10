# 🔧 Complete Authentication Fix Guide

## Current Issues:
1. Invalid Supabase API key in [.env.local](file:///C:/Users/hasna/Documents/GitHub/MernCryptoBlogging/MernCryptoBlogging/.env.local)
2. Admin user may not be properly set up
3. Authentication configuration needs to be completed

## Step 1: Fix Supabase API Key

1. Go to your Supabase project dashboard:
   - URL: https://app.supabase.com/project/fuoqjjmpeqbtceyjoqei
   - Sign in to your account

2. Navigate to Settings > API

3. Copy the "anon" "public" key (not the service key)

4. Update your [.env.local](file:///C:/Users/hasna/Documents/GitHub/MernCryptoBlogging/MernCryptoBlogging/.env.local) file:
   ```env
   VITE_SUPABASE_URL=https://fuoqjjmpeqbtceyjoqei.supabase.co
   VITE_SUPABASE_ANON_KEY=your-copied-anon-key-here
   ```

## Step 2: Set Up Admin User

You have two options:

### Option A: Run the Setup Script (Recommended)
```bash
node setup-admin.js
```

This will create an admin user with:
- Email: `admin@merncryptoblog.com`
- Password: `Admin123!`

### Option B: Manual Setup
1. Go to your Supabase Dashboard
2. Navigate to Authentication > Users
3. Click "Add User"
4. Enter:
   - Email: `admin@merncryptoblog.com`
   - Password: `Admin123!`
5. Click "Add"

## Step 3: Confirm the User

1. In Supabase Dashboard, go to Authentication > Users
2. Find the user `admin@merncryptoblog.com`
3. Click on the user
4. Click "Confirm User" if not already confirmed

## Step 4: Disable Email Confirmations (Optional but Recommended)

1. In Supabase Dashboard, go to Authentication > Settings
2. Turn OFF "Enable email confirmations"
3. This makes login easier during development

## Step 5: Restart Your Development Server

1. Stop your current server (Ctrl+C)
2. Run `npm run dev`

## Step 6: Test Login

1. Go to http://localhost:3000/login
2. Email should be pre-filled with `admin@merncryptoblog.com`
3. Enter password: `Admin123!`
4. Click "Sign in to Admin"

## Troubleshooting

### If Still Getting "Invalid API Key":
- Double-check that you copied the "anon" key, not the "service_role" key
- Ensure there are no extra spaces in your [.env.local](file:///C:/Users/hasna/Documents/GitHub/MernCryptoBlogging/MernCryptoBlogging/.env.local) file
- Make sure the key is on a single line

### If Login Fails with "Invalid Credentials":
- Verify the admin user exists in Supabase Authentication > Users
- Confirm the user is confirmed (check the "Confirmed at" column)
- Double-check the password is `Admin123!`

### If Still Having Issues:
1. Check browser console (F12) for detailed error messages
2. Verify your Supabase project URL is correct
3. Make sure you've restarted the development server after changes

## Default Admin Credentials

Once properly set up:
- Email: `admin@merncryptoblog.com`
- Password: `Admin123!`

Remember to change the password in production!