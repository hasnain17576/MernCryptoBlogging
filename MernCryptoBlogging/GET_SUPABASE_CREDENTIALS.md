# 🗝️ How to Get Your Supabase Credentials

## Step 1: Access Your Supabase Project

1. Go to [https://supabase.com](https://supabase.com)
2. Sign in to your account
3. Click on your project (or create one if you haven't already)

## Step 2: Find Your Credentials

1. In your project dashboard, click on the "Settings" icon (gear) in the left sidebar
2. Click on "API" in the settings menu
3. You'll see two important pieces of information:

### Project URL
- This is your Supabase project URL
- It looks like: `https://xxxxxxxxxxxxxxxx.supabase.co`
- Copy this URL

### Project API Keys
- Find the "Project API keys" section
- Copy the `anon` `public` key (this is your VITE_SUPABASE_ANON_KEY)

## Step 3: Update Your .env.local File

Replace the placeholder values in your [.env.local](file:///C:/Users/hasna/Documents/GitHub/MernCryptoBlogging/MernCryptoBlogging/.env.local) file with your actual credentials:

```env
VITE_SUPABASE_URL=https://your-actual-project-url.supabase.co
VITE_SUPABASE_ANON_KEY=your-actual-anon-key-here
```

Example (with fake values):
```env
VITE_SUPABASE_URL=https://abcdefghijk12345.supabase.co
VITE_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFiY2RlZmdoaWprMTIzNDUifQ.fakekey1234567890
```

## Step 4: Restart Your Development Server

After updating the credentials:
1. Stop your current development server (Ctrl+C in the terminal)
2. Run `npm run dev` to start it again

## Step 5: Test the Login

1. Go to http://localhost:3000/login
2. Enter your admin credentials
3. You should now be able to log in successfully

## Troubleshooting

If you're still seeing the "Authentication is not configured" message:

1. Make sure you're editing the [.env.local](file:///C:/Users/hasna/Documents/GitHub/MernCryptoBlogging/MernCryptoBlogging/.env.local) file, NOT the [.env](file:///C:/Users/hasna/Documents/GitHub/MernCryptoBlogging/MernCryptoBlogging/.env) file
2. Make sure there are no extra spaces or quotes around your credentials
3. Make sure you've restarted your development server after changing the credentials
4. Check that your credentials don't contain placeholder text like "your_" or "project"

## Need Help Finding Your Project?

If you don't remember your Supabase project:
1. Go to the Supabase dashboard
2. Your projects are listed on the main page
3. If you don't have a project yet, click "New Project" to create one