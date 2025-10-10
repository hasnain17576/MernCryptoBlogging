# 🔄 Restart Server Instructions

## Important Step

After updating your Supabase credentials in the [.env.local](file:///C:/Users/hasna/Documents/GitHub/MernCryptoBlogging/MernCryptoBlogging/.env.local) file, you need to restart your development server for the changes to take effect.

## How to Restart:

1. **Stop the current server:**
   - Go to your terminal where the server is running
   - Press `Ctrl + C` to stop the server

2. **Start the server again:**
   ```bash
   npm run dev
   ```

3. **Test the login:**
   - Go to http://localhost:3000/login
   - The email should be pre-filled with `admin@merncryptoblog.com`
   - Enter your password
   - Click "Sign in to Admin"

## Why This Is Necessary

Environment variables (like Supabase credentials) are only loaded when the server starts. Changing them while the server is running won't have any effect until you restart it.

## Still Not Working?

If you're still seeing authentication errors after restarting:

1. Check that your [.env.local](file:///C:/Users/hasna/Documents/GitHub/MernCryptoBlogging/MernCryptoBlogging/.env.local) file contains the correct credentials
2. Make sure there are no extra spaces or characters in the file
3. Verify that you're using the correct password for the admin user
4. Check the browser console (F12) for any error messages

## Need Help?

If you continue to have issues, please share:
1. The exact error message you're seeing
2. Any messages in the browser console
3. Whether you've restarted the server after updating credentials