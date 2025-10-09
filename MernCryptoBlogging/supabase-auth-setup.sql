-- SUPABASE DEVELOPMENT SETUP
-- Run this in your Supabase SQL Editor to make development easier

-- 1. Disable email confirmation (optional - for easier testing)
-- Go to Authentication > Settings in Supabase Dashboard
-- Turn OFF "Enable email confirmations"

-- 2. Enable signup (make sure this is enabled)
-- Go to Authentication > Settings in Supabase Dashboard  
-- Make sure "Enable signup" is ON

-- 3. Check if you have any existing users
SELECT email, created_at, email_confirmed_at FROM auth.users;

-- 4. If you want to manually confirm an email (if confirmation is required)
-- Replace 'admin@merncryptoblog.com' with the actual email
UPDATE auth.users 
SET email_confirmed_at = NOW() 
WHERE email = 'admin@merncryptoblog.com' AND email_confirmed_at IS NULL;

-- 5. Check user after creation
SELECT id, email, created_at, email_confirmed_at, last_sign_in_at 
FROM auth.users 
WHERE email = 'admin@merncryptoblog.com';