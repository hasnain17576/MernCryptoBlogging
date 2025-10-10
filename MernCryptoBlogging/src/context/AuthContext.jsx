import React, { createContext, useContext, useEffect, useState } from 'react'
import { supabase } from '../utils/supabase'

const AuthContext = createContext({})

export const useAuth = () => {
  const context = useContext(AuthContext)
  if (!context) {
    throw new Error('useAuth must be used within an AuthProvider')
  }
  return context
}

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    // Get initial session
    supabase.auth.getSession().then(({ data: { session } }) => {
      setUser(session?.user ?? null)
      setLoading(false)
    })

    // Listen for auth changes
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((_event, session) => {
      setUser(session?.user ?? null)
      setLoading(false)
    })

    return () => subscription.unsubscribe()
  }, [])

  const signUp = async (email, password) => {
    // Check if we're using the mock client
    if (typeof supabase.auth.signUp === 'function' && supabase.auth.signUp.length === 0) {
      return { 
        data: null, 
        error: { message: 'Authentication is not configured. Please set up Supabase credentials.' } 
      }
    }
    
    const { data, error } = await supabase.auth.signUp({
      email,
      password,
    })
    return { data, error }
  }

  const signIn = async (email, password) => {
    // Check if we're using the mock client
    if (typeof supabase.auth.signInWithPassword === 'function' && supabase.auth.signInWithPassword.length === 0) {
      return { 
        data: null, 
        error: { message: 'Authentication is not configured. Please set up Supabase credentials.' } 
      }
    }
    
    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password,
    })
    return { data, error }
  }

  const signOut = async () => {
    // Check if we're using the mock client
    if (typeof supabase.auth.signOut === 'function' && supabase.auth.signOut.length === 0) {
      return { 
        error: { message: 'Authentication is not configured. Please set up Supabase credentials.' } 
      }
    }
    
    const { error } = await supabase.auth.signOut()
    return { error }
  }

  const value = {
    user,
    loading,
    signUp,
    signIn,
    signOut,
  }

  return (
    <AuthContext.Provider value={value}>
      {children}
    </AuthContext.Provider>
  )
}