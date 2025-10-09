-- Create default admin user in Supabase Auth
-- Note: This needs to be run in Supabase SQL Editor

-- First, let's create a simple admin user
-- You'll need to create this user through Supabase Auth Dashboard or use this approach:

-- Default Admin Credentials:
-- Email: admin@merncryptoblog.com
-- Password: Admin123!

-- Since we can't directly insert into auth.users via SQL for security reasons,
-- you need to either:
-- 1. Go to Authentication > Users in Supabase Dashboard and manually create user
-- 2. Or use the signup functionality with these credentials

-- After creating the user, you can verify with:
-- SELECT * FROM auth.users WHERE email = 'admin@merncryptoblog.com';

-- Optional: Create a table to track admin roles (if needed)
CREATE TABLE IF NOT EXISTS user_roles (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
    role TEXT NOT NULL DEFAULT 'admin',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable RLS for user_roles
ALTER TABLE user_roles ENABLE ROW LEVEL SECURITY;

-- Create policy for user_roles
CREATE POLICY "Authenticated users can read user_roles" ON user_roles
    FOR SELECT USING (auth.role() = 'authenticated');

CREATE POLICY "Authenticated users can insert user_roles" ON user_roles
    FOR INSERT WITH CHECK (auth.role() = 'authenticated');