-- Paste this in Supabase SQL Editor
-- Go to: https://fuoqjjmpeqbtceyjoqei.supabase.co
-- Click: SQL Editor

-- Step 1: Disable email confirmation for easier setup
UPDATE auth.config 
SET setting_value = 'false' 
WHERE setting_name = 'enable_email_confirmations';

-- Step 2: Enable signup
UPDATE auth.config 
SET setting_value = 'true' 
WHERE setting_name = 'enable_signup';

-- Step 3: Check if admin user exists
SELECT email FROM auth.users WHERE email = 'admin@merncryptoblog.com';

-- Step 4: If you need to delete existing user first (optional)
-- DELETE FROM auth.users WHERE email = 'admin@merncryptoblog.com';

-- After this, go to your login page and try to login
-- The signup will happen automatically through the app