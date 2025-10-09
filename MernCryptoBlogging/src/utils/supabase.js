import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY

let supabase

// Check if credentials are provided
if (!supabaseUrl || !supabaseAnonKey || supabaseUrl.includes('your_') || supabaseAnonKey.includes('your_')) {
  console.warn('⚠️  Supabase credentials not configured. Using mock client for development.')
  
  // Create a mock client for development without Supabase
  supabase = {
    from: () => ({
      select: () => Promise.resolve({ data: null, error: null }),
      insert: () => Promise.resolve({ data: null, error: null }),
      update: () => Promise.resolve({ data: null, error: null }),
      delete: () => Promise.resolve({ data: null, error: null }),
      order: () => ({ 
        select: () => Promise.resolve({ data: null, error: null }),
        limit: () => Promise.resolve({ data: null, error: null })
      }),
      limit: () => Promise.resolve({ data: null, error: null }),
      single: () => Promise.resolve({ data: null, error: null }),
      eq: () => Promise.resolve({ data: null, error: null })
    }),
    auth: {
      getSession: () => Promise.resolve({ data: { session: null }, error: null }),
      onAuthStateChange: (callback) => { 
        callback('INITIAL_SESSION', null)
        return { data: { subscription: { unsubscribe: () => {} } } }
      },
      signUp: () => Promise.resolve({ data: { user: null }, error: null }),
      signInWithPassword: () => Promise.resolve({ data: { user: null }, error: null }),
      signOut: () => Promise.resolve({ error: null })
    }
  }
} else {
  // Create the actual Supabase client
  supabase = createClient(supabaseUrl, supabaseAnonKey)
}

export { supabase }