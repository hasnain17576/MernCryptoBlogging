-- STEP-BY-STEP ADMIN USER SETUP
-- Copy and run this in your Supabase SQL Editor

-- 1. First, disable email confirmations to make it easier
-- Go to Authentication > Settings in Supabase Dashboard
-- Turn OFF "Enable email confirmations"

-- 2. Check current authentication settings
SELECT 
  setting_name, 
  setting_value 
FROM auth.config 
WHERE setting_name IN ('enable_signup', 'enable_email_confirmations');

-- 3. Enable signup if disabled
UPDATE auth.config 
SET setting_value = 'true' 
WHERE setting_name = 'enable_signup';

-- 4. Check if admin user already exists
SELECT 
  id, 
  email, 
  created_at, 
  email_confirmed_at,
  confirmed_at,
  last_sign_in_at
FROM auth.users 
WHERE email = 'admin@merncryptoblog.com';

-- 5. If user exists but not confirmed, confirm them
UPDATE auth.users 
SET 
  email_confirmed_at = NOW(),
  confirmed_at = NOW()
WHERE email = 'admin@merncryptoblog.com' 
  AND email_confirmed_at IS NULL;

-- 6. Verify the setup
SELECT 
  id,
  email,
  email_confirmed_at,
  confirmed_at,
  'READY FOR LOGIN' as status
FROM auth.users 
WHERE email = 'admin@merncryptoblog.com'
  AND email_confirmed_at IS NOT NULL;