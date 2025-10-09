// Admin User Setup Script
// This will create the default admin user in Supabase

import { createClient } from '@supabase/supabase-js'
import fs from 'fs'
import path from 'path'

// Read environment variables
let envFile;
try {
  // Try .env.local first
  envFile = fs.readFileSync('.env.local', 'utf8');
} catch (err) {
  try {
    // Fall back to .env
    envFile = fs.readFileSync('.env', 'utf8');
  } catch (err2) {
    console.error('❌ No environment file found. Please create .env.local or .env with your Supabase credentials');
    process.exit(1);
  }
}

const envVars = {}
envFile.split('\n').forEach(line => {
  // Skip comments and empty lines
  if (line.trim() === '' || line.trim().startsWith('#')) return;
  
  const [key, value] = line.split('=')
  if (key && value) {
    envVars[key.trim()] = value.trim().replace(/['"]/g, ''); // Remove quotes if present
  }
})

const supabaseUrl = envVars.VITE_SUPABASE_URL
const supabaseKey = envVars.VITE_SUPABASE_ANON_KEY

if (!supabaseUrl || !supabaseKey || supabaseUrl.includes('your_') || supabaseKey.includes('your_')) {
  console.error('❌ Supabase credentials not found or still contain placeholder values')
  console.error('Please update your .env.local file with actual Supabase credentials')
  process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseKey)

async function createAdminUser() {
  console.log('🔧 Setting up admin user...')
  
  const adminEmail = 'admin@merncryptoblog.com'
  const adminPassword = 'Admin123!'
  
  try {
    // Try to sign up the admin user
    console.log('📝 Creating admin account...')
    const { data, error } = await supabase.auth.signUp({
      email: adminEmail,
      password: adminPassword,
    })
    
    if (error) {
      if (error.message.includes('already registered')) {
        console.log('✅ Admin user already exists!')
        
        // Try to confirm the user if not confirmed
        console.log('🔄 Checking user confirmation status...')
        
        // This requires admin privileges in Supabase
        // User needs to confirm via Supabase dashboard
        console.log('⚠️  Please confirm the user email in Supabase Dashboard:')
        console.log('   1. Go to Authentication > Users')
        console.log('   2. Find admin@merncryptoblog.com')
        console.log('   3. Click on the user')
        console.log('   4. Click "Confirm User" if not confirmed')
        
      } else {
        throw error
      }
    } else {
      console.log('✅ Admin user created successfully!')
      console.log('📧 User ID:', data.user?.id)
      
      if (data.user && !data.user.email_confirmed_at) {
        console.log('⚠️  Email confirmation required. Please:')
        console.log('   1. Check your email for confirmation link, OR')
        console.log('   2. Go to Supabase Dashboard > Authentication > Users')
        console.log('   3. Find admin@merncryptoblog.com and click "Confirm User"')
      }
    }
    
    console.log('\n🎉 Setup complete!')
    console.log('🔑 Admin Credentials:')
    console.log('   Email:', adminEmail)
    console.log('   Password:', adminPassword)
    console.log('\n🌐 Login at: http://localhost:3000/login')
    
  } catch (error) {
    console.error('❌ Error setting up admin user:', error.message)
    console.log('\n🛠️  Manual Setup Required:')
    console.log('1. Go to your Supabase Dashboard')
    console.log('2. Navigate to Authentication > Users')
    console.log('3. Click "Add User"')
    console.log('4. Email:', adminEmail)
    console.log('5. Password:', adminPassword)
    console.log('6. Make sure to confirm the user')
  }
}

// Run the setup
createAdminUser()