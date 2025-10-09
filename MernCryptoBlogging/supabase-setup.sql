-- Enable Row Level Security for all tables
ALTER TABLE posts ENABLE ROW LEVEL SECURITY;
ALTER TABLE pages ENABLE ROW LEVEL SECURITY;
ALTER TABLE settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE messages ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist
DROP POLICY IF EXISTS "Posts are viewable by everyone" ON posts;
DROP POLICY IF EXISTS "Authenticated users can insert posts" ON posts;
DROP POLICY IF EXISTS "Authenticated users can update posts" ON posts;
DROP POLICY IF EXISTS "Authenticated users can delete posts" ON posts;

DROP POLICY IF EXISTS "Pages are viewable by everyone" ON pages;
DROP POLICY IF EXISTS "Authenticated users can insert pages" ON pages;
DROP POLICY IF EXISTS "Authenticated users can update pages" ON pages;
DROP POLICY IF EXISTS "Authenticated users can delete pages" ON pages;

DROP POLICY IF EXISTS "Settings are viewable by everyone" ON settings;
DROP POLICY IF EXISTS "Authenticated users can insert settings" ON settings;
DROP POLICY IF EXISTS "Authenticated users can update settings" ON settings;
DROP POLICY IF EXISTS "Authenticated users can delete settings" ON settings;

DROP POLICY IF EXISTS "Anyone can insert messages" ON messages;
DROP POLICY IF EXISTS "Authenticated users can read messages" ON messages;
DROP POLICY IF EXISTS "Authenticated users can update messages" ON messages;

-- Create new policies

-- Posts policies
CREATE POLICY "Posts are viewable by everyone" ON posts
    FOR SELECT USING (true);

CREATE POLICY "Authenticated users can insert posts" ON posts
    FOR INSERT WITH CHECK (auth.role() = 'authenticated');

CREATE POLICY "Authenticated users can update posts" ON posts
    FOR UPDATE USING (auth.role() = 'authenticated');

CREATE POLICY "Authenticated users can delete posts" ON posts
    FOR DELETE USING (auth.role() = 'authenticated');

-- Pages policies
CREATE POLICY "Pages are viewable by everyone" ON pages
    FOR SELECT USING (true);

CREATE POLICY "Authenticated users can insert pages" ON pages
    FOR INSERT WITH CHECK (auth.role() = 'authenticated');

CREATE POLICY "Authenticated users can update pages" ON pages
    FOR UPDATE USING (auth.role() = 'authenticated');

CREATE POLICY "Authenticated users can delete pages" ON pages
    FOR DELETE USING (auth.role() = 'authenticated');

-- Settings policies
CREATE POLICY "Settings are viewable by everyone" ON settings
    FOR SELECT USING (true);

CREATE POLICY "Authenticated users can insert settings" ON settings
    FOR INSERT WITH CHECK (auth.role() = 'authenticated');

CREATE POLICY "Authenticated users can update settings" ON settings
    FOR UPDATE USING (auth.role() = 'authenticated');

CREATE POLICY "Authenticated users can delete settings" ON settings
    FOR DELETE USING (auth.role() = 'authenticated');

-- Messages policies
CREATE POLICY "Anyone can insert messages" ON messages
    FOR INSERT WITH CHECK (true);

CREATE POLICY "Authenticated users can read messages" ON messages
    FOR SELECT USING (auth.role() = 'authenticated');

CREATE POLICY "Authenticated users can update messages" ON messages
    FOR UPDATE USING (auth.role() = 'authenticated');

-- Insert default settings if not exists
INSERT INTO settings (site_name, description, keywords) 
SELECT 
    'MernCryptoBlog',
    'Your trusted source for cryptocurrency insights, blockchain technology, and digital finance news.',
    'cryptocurrency, blockchain, bitcoin, ethereum, crypto news, digital finance'
WHERE NOT EXISTS (SELECT 1 FROM settings);

-- Insert sample posts if table is empty
INSERT INTO posts (title, content, category, tags, image_url, seo_title, seo_description) 
SELECT * FROM (VALUES
    (
        'The Future of Cryptocurrency in 2024',
        'Cryptocurrency continues to evolve rapidly, with new technologies and regulations shaping the landscape. In this comprehensive analysis, we explore the key trends and developments that are expected to define the crypto space in 2024.

From the rise of institutional adoption to the development of more sustainable blockchain solutions, the cryptocurrency ecosystem is maturing. Major financial institutions are increasingly integrating digital assets into their portfolios, while governments worldwide are developing clearer regulatory frameworks.

Key areas to watch include:
- Central Bank Digital Currencies (CBDCs)
- DeFi protocol innovations
- Layer 2 scaling solutions
- Environmental sustainability initiatives
- Cross-chain interoperability

The market is showing signs of increased stability and mainstream acceptance, with traditional finance and crypto becoming increasingly interconnected.',
        'Analysis',
        'cryptocurrency, 2024, trends, blockchain, DeFi',
        'https://images.unsplash.com/photo-1639762681485-074b7f938ba0?w=800&h=400&fit=crop',
        'The Future of Cryptocurrency in 2024 - MernCryptoBlog',
        'Explore the key trends and developments that will define cryptocurrency in 2024, from institutional adoption to sustainable blockchain solutions.'
    ),
    (
        'Understanding Bitcoin Halving: What It Means for Investors',
        'Bitcoin halving is one of the most significant events in the cryptocurrency calendar, occurring approximately every four years. This mechanism is built into Bitcoin''s code to control inflation and maintain scarcity.

What is Bitcoin Halving?
Bitcoin halving reduces the reward for mining new blocks by 50%. This event occurs every 210,000 blocks, which takes roughly four years to complete. The most recent halving occurred in 2024, reducing the block reward from 6.25 BTC to 3.125 BTC.

Historical Impact:
- 2012 Halving: Bitcoin price increased significantly in the following year
- 2016 Halving: Similar pattern of price appreciation
- 2020 Halving: Led to the 2021 bull market
- 2024 Halving: Current market dynamics

For investors, halving events typically signal potential price appreciation due to reduced supply growth. However, market conditions, adoption rates, and external factors also play crucial roles in determining outcomes.',
        'Bitcoin',
        'bitcoin, halving, mining, investment, cryptocurrency',
        'https://images.unsplash.com/photo-1621761191319-c6fb62004040?w=800&h=400&fit=crop',
        'Understanding Bitcoin Halving: What It Means for Investors',
        'Learn about Bitcoin halving events, their historical impact, and what they mean for cryptocurrency investors.'
    ),
    (
        'DeFi Revolution: Decentralized Finance Explained',
        'Decentralized Finance (DeFi) represents one of the most innovative applications of blockchain technology, offering financial services without traditional intermediaries.

What is DeFi?
DeFi refers to financial applications built on blockchain networks that operate without central authorities. These applications provide services like lending, borrowing, trading, and earning interest through smart contracts.

Key DeFi Components:
- Decentralized Exchanges (DEXs)
- Lending Protocols
- Yield Farming
- Liquidity Mining
- Automated Market Makers (AMMs)

Popular DeFi Platforms:
- Uniswap: Leading decentralized exchange
- Compound: Lending and borrowing protocol
- Aave: Multi-asset lending platform
- MakerDAO: Decentralized stablecoin system

Benefits of DeFi:
- Permissionless access
- Transparency
- Global availability
- Reduced counterparty risk
- Programmable money

However, DeFi also comes with risks including smart contract vulnerabilities, impermanent loss, and regulatory uncertainty. Investors should conduct thorough research before participating in DeFi protocols.',
        'DeFi',
        'DeFi, decentralized finance, blockchain, smart contracts, yield farming',
        'https://images.unsplash.com/photo-1639322537504-6427a16b0a28?w=800&h=400&fit=crop',
        'DeFi Revolution: Decentralized Finance Explained',
        'Discover how DeFi is revolutionizing finance through decentralized applications, smart contracts, and blockchain technology.'
    )
) AS sample_posts(title, content, category, tags, image_url, seo_title, seo_description)
WHERE NOT EXISTS (SELECT 1 FROM posts);