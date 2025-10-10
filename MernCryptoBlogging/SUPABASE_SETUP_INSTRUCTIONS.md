# 🔧 Supabase Setup Instructions

## Step 1: Create a Supabase Account and Project

1. Go to [supabase.com](https://supabase.com) and click "Start your project"
2. Sign up or sign in to your Supabase account
3. Click "New Project"
4. Fill in the project details:
   - Name: MernCryptoBlog
   - Database Password: Create a strong password and save it
   - Region: Choose the region closest to you
5. Click "Create Project" (this may take a few minutes)

## Step 2: Get Your Supabase Credentials

1. Once your project is created, go to the project dashboard
2. Click on "Project Settings" (gear icon) in the left sidebar
3. Click on "API" in the settings menu
4. Copy the following values:
   - Project URL (starts with https://)
   - anon key (public key)

## Step 3: Configure Your Environment Variables

Create a new file called `.env.local` in your project root with the following content:

```env
VITE_SUPABASE_URL=your_project_url_here
VITE_SUPABASE_ANON_KEY=your_anon_key_here
```

Replace `your_project_url_here` and `your_anon_key_here` with your actual Supabase credentials.

## Step 4: Set Up the Database

1. In your Supabase dashboard, go to "SQL Editor" in the left sidebar
2. Copy and paste the contents of `database-schema.sql` into the editor
3. Click "Run" to create the database tables

## Step 5: Create the Admin User

You have two options:

### Option A: Run the Setup Script (Recommended)
```bash
node setup-admin.js
```

### Option B: Manual Setup
1. In your Supabase dashboard, go to "Authentication" > "Users"
2. Click "Add User"
3. Email: `hasnainwasli17@gmail.com`
4. Password: Your chosen password
5. Click "Add"

## Step 6: Enable Email Authentication

1. In your Supabase dashboard, go to "Authentication" > "Settings"
2. Make sure "Email" is enabled under "Authentication Methods"
3. Under "Email Templates", you can customize the email confirmation template if needed

## Step 7: Test the Login

1. Restart your development server
2. Go to http://localhost:3000/login
3. The email should be pre-filled with `hasnainwasli17@gmail.com`
4. Enter your Supabase account password
5. Click "Sign in to Admin"

## Troubleshooting

If you're still having issues:

1. Check browser console for errors (F12)
2. Verify your .env.local file has correct credentials
3. Make sure you've restarted your development server after changing environment variables
4. Check that you've run the database setup SQL script
5. Confirm the admin user exists in the Supabase Authentication dashboard

## Common Issues

### "Supabase credentials not configured" Warning
This means your .env.local file is missing or contains placeholder values.

### "User not found" or "Invalid credentials"
Make sure you've created the admin user in Supabase and that you're using the correct password.

### "Network error" or "CORS error"
Check that your Supabase URL is correct and that you're using the anon key (not the service key).