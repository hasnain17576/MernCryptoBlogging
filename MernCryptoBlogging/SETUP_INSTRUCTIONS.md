# 🛠️ Setup Instructions

## Step 1: Configure Supabase Credentials

1. Open the `.env.local` file in your project root
2. Replace the placeholder values with your actual Supabase credentials:
   ```
   VITE_SUPABASE_URL=your_actual_supabase_project_url
   VITE_SUPABASE_ANON_KEY=your_actual_supabase_anon_key
   ```

To get your Supabase credentials:
1. Go to your Supabase project dashboard
2. Click on the "Settings" icon (gear) in the left sidebar
3. Click on "API"
4. Copy your "Project URL" and "anon" key

## Step 2: Restart Your Development Server

After updating the credentials, restart your development server:
```bash
npm run dev
```

## Step 3: Login to Admin Panel

1. Go to http://localhost:3000/login
2. The email field should be pre-filled with `admin@merncryptoblog.com`
3. Enter the password you set when creating the user in Supabase
4. Click "Sign in to Admin"

## Troubleshooting

If you're still having issues:

1. **Check browser console** (F12) for any error messages
2. **Verify your .env.local file** has the correct credentials (no extra spaces or quotes)
3. **Make sure you've restarted** your development server after changing environment variables
4. **Confirm the admin user exists** in your Supabase Authentication dashboard

## Common Issues

### "Invalid credentials" error
- Double-check that you're using the correct password for the `admin@merncryptoblog.com` user
- Make sure the user is confirmed in Supabase (check the Supabase Authentication dashboard)

### "Network error" or "CORS error"
- Verify your Supabase URL is correct
- Make sure you're using the "anon" key (not the service key)

### Still not working?
If you continue to have issues, please share any error messages you see in the browser console or login form so we can troubleshoot further.