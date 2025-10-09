-- Create Admin User Script for Supabase
-- Run this in your Supabase SQL Editor

-- First, make sure email confirmation is disabled for easier setup
-- Go to Authentication > Settings and turn OFF "Enable email confirmations"

-- Check if admin user already exists
SELECT email, created_at, email_confirmed_at 
FROM auth.users 
WHERE email = 'admin@merncryptoblog.com';

-- If you need to delete an existing user (optional)
-- DELETE FROM auth.users WHERE email = 'admin@merncryptoblog.com';

-- After creating user through signup, confirm the email automatically
UPDATE auth.users 
SET email_confirmed_at = NOW(),
    confirmed_at = NOW()
WHERE email = 'admin@merncryptoblog.com' 
  AND email_confirmed_at IS NULL;

-- Verify the user is created and confirmed
SELECT 
    id,
    email, 
    created_at, 
    email_confirmed_at,
    confirmed_at,
    last_sign_in_at 
FROM auth.users 
WHERE email = 'admin@merncryptoblog.com';

-- Create admin role tracking (optional)
INSERT INTO user_roles (user_id, role)
SELECT id, 'admin'
FROM auth.users 
WHERE email = 'admin@merncryptoblog.com'
  AND NOT EXISTS (
    SELECT 1 FROM user_roles 
    WHERE user_id = auth.users.id
  );