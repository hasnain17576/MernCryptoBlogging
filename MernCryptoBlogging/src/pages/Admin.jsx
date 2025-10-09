import React, { useState } from 'react'
import SEO from '../components/SEO'
import AdminLayout from '../components/admin/AdminLayout'
import Dashboard from '../components/admin/Dashboard'
import PostsManager from '../components/admin/PostsManager'
import PagesManager from '../components/admin/PagesManager'
import SettingsManager from '../components/admin/SettingsManager'

const Admin = () => {
  const [activeTab, setActiveTab] = useState('dashboard')
  
  console.log('Admin component rendered, activeTab:', activeTab)

  const handleTabChange = (newTab) => {
    console.log('Tab changing from', activeTab, 'to', newTab)
    setActiveTab(newTab)
  }

  const renderContent = () => {
    console.log('Rendering content for tab:', activeTab)
    switch (activeTab) {
      case 'dashboard':
        return <Dashboard setActiveTab={handleTabChange} />
      case 'posts':
        return <PostsManager />
      case 'pages':
        return <PagesManager />
      case 'settings':
        return <SettingsManager />
      default:
        return <Dashboard setActiveTab={handleTabChange} />
    }
  }

  return (
    <>
      <SEO 
        title="Admin Dashboard - MernCryptoBlog"
        description="Manage your blog content and settings"
        keywords="admin dashboard, content management"
      />
      
      <AdminLayout activeTab={activeTab} setActiveTab={handleTabChange}>
        {renderContent()}
      </AdminLayout>
    </>
  )
}

export default Admin