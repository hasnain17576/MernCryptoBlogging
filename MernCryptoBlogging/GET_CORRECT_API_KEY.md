# 🔑 How to Get the Correct Supabase API Key

## Step 1: Access Your Supabase Project

1. Go to [https://supabase.com](https://supabase.com)
2. Sign in to your account
3. Click on your project: `fuoqjjmpeqbtceyjoqei`

## Step 2: Find Your API Key

1. In your project dashboard, click on the "Settings" icon (gear) in the left sidebar
2. Click on "API" in the settings menu
3. Scroll down to the "Project API keys" section

## Step 3: Copy the Correct Key

1. Find the key labeled "anon" "public"
2. Click the copy button next to it
3. This is your VITE_SUPABASE_ANON_KEY

## Step 4: Update Your .env.local File

Replace the current value in your [.env.local](file:///C:/Users/hasna/Documents/GitHub/MernCryptoBlogging/MernCryptoBlogging/.env.local) file with the correct key:

```env
VITE_SUPABASE_URL=https://fuoqjjmpeqbtceyjoqei.supabase.co
VITE_SUPABASE_ANON_KEY=your-copied-anon-key-here
```

## Step 5: Restart Your Development Server

After updating the API key:
1. Stop your current development server (Ctrl+C in the terminal)
2. Run `npm run dev` to start it again

## Troubleshooting

If you're still seeing "Invalid API key":

1. Make sure you copied the "anon" key, not the "service_role" key
2. Make sure there are no extra spaces before or after the key
3. Make sure you've restarted your development server
4. Check that the key is on a single line with no line breaks

## Need Help Finding Your Project?

If you can't find your Supabase project:
1. Make sure you're logged into the correct Supabase account
2. Check if the project URL `fuoqjjmpeqbtceyjoqei` matches your project
3. If not, you may need to create a new project or find the correct one