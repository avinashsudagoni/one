<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NexusShop · Premium</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --bg: #f8fafc;
            --surface: #ffffff;
            --primary: #0f172a;
            --secondary: #0ea5e9;
            --accent: #8b5cf6;
            --muted: #64748b;
            --border: rgba(15, 23, 42, 0.08);
            --shadow: 0 25px 50px -12px rgba(15, 23, 42, 0.15);
            --radius: 24px;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Inter', system-ui, sans-serif;
            background: var(--bg);
            color: var(--primary);
            line-height: 1.6;
            overflow-x: hidden;
        }

        .container {
            width: min(1200px, 92%);
            margin: 0 auto;
        }

        /* ========== HEADER ========== */
        header {
            position: sticky;
            top: 0;
            z-index: 1000;
            background: rgba(255, 255, 255, 0.72);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-bottom: 1px solid var(--border);
        }

        .navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 72px;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: 800;
            letter-spacing: -0.5px;
            color: var(--primary);
        }

        .logo span {
            background: linear-gradient(135deg, #0ea5e9, #8b5cf6);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
            list-style: none;
        }

        .nav-links a {
            text-decoration: none;
            color: var(--primary);
            font-weight: 500;
            font-size: 0.95rem;
            position: relative;
            transition: color 0.25s ease;
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -4px;
            width: 0;
            height: 2px;
            background: linear-gradient(90deg, #0ea5e9, #8b5cf6);
            border-radius: 2px;
            transition: width 0.3s ease;
        }

        .nav-links a:hover {
            color: var(--secondary);
        }

        .nav-links a:hover::after {
            width: 100%;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 1.25rem;
        }

        .header-actions button {
            background: none;
            border: none;
            font-size: 1.15rem;
            color: var(--primary);
            cursor: pointer;
            width: 40px;
            height: 40px;
            border-radius: 12px;
            display: grid;
            place-items: center;
            transition: all 0.25s ease;
        }

        .header-actions button:hover {
            background: #f1f5f9;
            color: var(--secondary);
            transform: translateY(-2px);
        }

        /* ========== HERO ========== */
        .hero {
            min-height: 88vh;
            display: grid;
            place-items: center;
            text-align: center;
            position: relative;
            overflow: hidden;
            background: 
                linear-gradient(135deg, rgba(15, 23, 42, 0.75), rgba(14, 165, 233, 0.35)),
                url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1600&q=80') center/cover no-repeat;
            color: white;
            padding: 4rem 1.5rem;
        }

        .hero::before {
            content: '';
            position: absolute;
            inset: 0;
            background: radial-gradient(circle at 30% 20%, rgba(14, 165, 233, 0.25), transparent 55%);
            pointer-events: none;
        }

        .hero-content {
            position: relative;
            z-index: 2;
            max-width: 720px;
        }

        .hero-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: rgba(255, 255, 255, 0.12);
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 0.4rem 1rem;
            border-radius: 999px;
            font-size: 0.85rem;
            font-weight: 500;
            margin-bottom: 1.5rem;
        }

        .hero h1 {
            font-size: clamp(2.5rem, 6vw, 4.25rem);
            font-weight: 800;
            letter-spacing: -1.5px;
            line-height: 1.1;
            margin-bottom: 1.25rem;
            text-shadow: 0 8px 30px rgba(0, 0, 0, 0.3);
        }

        .hero p {
            font-size: 1.15rem;
            opacity: 0.9;
            max-width: 540px;
            margin: 0 auto 2.25rem;
            line-height: 1.7;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            padding: 1rem 2.25rem;
            border: none;
            border-radius: 999px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.22, 1, 0.36, 1);
            text-decoration: none;
        }

        .btn-primary {
            background: linear-gradient(135deg, #0ea5e9, #0284c7);
            color: white;
            box-shadow: 0 12px 30px -8px rgba(14, 165, 233, 0.55);
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 18px 40px -8px rgba(14, 165, 233, 0.7);
        }

        /* ========== SECTIONS ========== */
        section {
            padding: 6rem 0;
        }

        .section-header {
            text-align: center;
            margin-bottom: 3.5rem;
        }

        .section-header h2 {
            font-size: clamp(1.75rem, 4vw, 2.5rem);
            font-weight: 700;
            letter-spacing: -0.5px;
            margin-bottom: 0.5rem;
        }

        .section-header p {
            color: var(--muted);
            font-size: 1.05rem;
        }

        /* ========== CATEGORIES ========== */
        .categories {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
            gap: 1.25rem;
        }

        .category-card {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            padding: 2rem 1.25rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.35s cubic-bezier(0.22, 1, 0.36, 1);
            box-shadow: 0 4px 20px -8px rgba(15, 23, 42, 0.06);
        }

        .category-card i {
            font-size: 2rem;
            background: linear-gradient(135deg, #0ea5e9, #8b5cf6);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin-bottom: 1rem;
            display: block;
            transition: transform 0.35s ease;
        }

        .category-card h3 {
            font-size: 1rem;
            font-weight: 600;
        }

        .category-card:hover {
            transform: translateY(-6px);
            box-shadow: var(--shadow);
            border-color: rgba(14, 165, 233, 0.25);
        }

        .category-card:hover i {
            transform: scale(1.15);
        }

        /* ========== PRODUCTS ========== */
        .products {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 1.75rem;
        }

        .product-card {
            background: var(--surface);
            border-radius: 28px;
            overflow: hidden;
            border: 1px solid var(--border);
            transition: all 0.4s cubic-bezier(0.22, 1, 0.36, 1);
            position: relative;
            box-shadow: 0 8px 30px -12px rgba(15, 23, 42, 0.08);
        }

        .product-card:hover {
            transform: translateY(-8px);
            box-shadow: var(--shadow);
        }

        .product-img {
            position: relative;
            overflow: hidden;
            aspect-ratio: 1 / 1;
        }

        .product-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.6s cubic-bezier(0.22, 1, 0.36, 1);
        }

        .product-card:hover .product-img img {
            transform: scale(1.06);
        }

        .badge {
            position: absolute;
            top: 1rem;
            left: 1rem;
            padding: 0.35rem 0.9rem;
            border-radius: 999px;
            font-size: 0.75rem;
            font-weight: 700;
            color: white;
            letter-spacing: 0.3px;
            z-index: 2;
        }

        .badge.new { background: linear-gradient(135deg, #0ea5e9, #0284c7); }
        .badge.hot { background: linear-gradient(135deg, #f43f5e, #e11d48); }
        .badge.sale { background: linear-gradient(135deg, #8b5cf6, #7c3aed); }

        .product-body {
            padding: 1.5rem;
        }

        .product-body h3 {
            font-size: 1.15rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .price-row {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 0.75rem;
        }

        .price-row strong {
            font-size: 1.35rem;
            font-weight: 700;
        }

        .old-price {
            color: var(--muted);
            text-decoration: line-through;
            font-size: 0.95rem;
        }

        .rating {
            color: #f59e0b;
            font-size: 0.9rem;
            margin-bottom: 1.25rem;
            letter-spacing: 1px;
        }

        .product-actions {
            display: flex;
            gap: 0.75rem;
        }

        .cart-btn {
            flex: 1;
            padding: 0.85rem;
            border: none;
            border-radius: 14px;
            background: var(--primary);
            color: white;
            font-weight: 600;
            font-size: 0.95rem;
            cursor: pointer;
            transition: all 0.25s ease;
        }

        .cart-btn:hover {
            background: var(--secondary);
            transform: translateY(-2px);
        }

        .wish-btn {
            width: 48px;
            border: 1px solid var(--border);
            border-radius: 14px;
            background: #f8fafc;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.25s ease;
            display: grid;
            place-items: center;
        }

        .wish-btn:hover {
            background: #fff1f2;
            border-color: #fda4af;
            transform: scale(1.05);
        }

        /* ========== DEAL ========== */
        .deal {
            display: grid;
            grid-template-columns: 1fr 1fr;
            background: linear-gradient(135deg, #0f172a, #1e293b);
            border-radius: 32px;
            overflow: hidden;
            color: white;
            box-shadow: 0 30px 60px -20px rgba(15, 23, 42, 0.4);
        }

        .deal-img {
            position: relative;
            min-height: 360px;
        }

        .deal-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.8s ease;
        }

        .deal:hover .deal-img img {
            transform: scale(1.04);
        }

        .deal-content {
            padding: 3rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .deal-content h2 {
            font-size: 2.25rem;
            font-weight: 700;
            margin-bottom: 0.75rem;
            letter-spacing: -0.5px;
        }

        .deal-content > p {
            color: #94a3b8;
            margin-bottom: 1.75rem;
        }

        .timer {
            display: flex;
            gap: 0.85rem;
            margin-bottom: 2rem;
        }

        .time-box {
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 16px;
            padding: 1rem;
            text-align: center;
            min-width: 72px;
            backdrop-filter: blur(8px);
            transition: all 0.3s ease;
        }

        .time-box:hover {
            background: rgba(14, 165, 233, 0.15);
            border-color: rgba(14, 165, 233, 0.35);
            transform: translateY(-3px);
        }

        .time-box h3 {
            font-size: 1.5rem;
            font-weight: 700;
        }

        .time-box p {
            font-size: 0.75rem;
            color: #94a3b8;
            margin-top: 0.2rem;
        }

        /* ========== TESTIMONIALS ========== */
        .testimonials {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
        }

        .testimonial {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 28px;
            padding: 2rem;
            box-shadow: 0 8px 30px -12px rgba(15, 23, 42, 0.06);
            transition: all 0.35s ease;
        }

        .testimonial:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow);
        }

        .testimonial .rating {
            margin-bottom: 1rem;
        }

        .testimonial p {
            color: var(--muted);
            font-size: 1.05rem;
            line-height: 1.7;
            margin-bottom: 1.5rem;
        }

        .testimonial-author {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .testimonial-author img {
            width: 52px;
            height: 52px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .testimonial-author h4 {
            font-size: 1rem;
            font-weight: 600;
        }

        /* ========== NEWSLETTER ========== */
        .newsletter {
            background: linear-gradient(135deg, #0ea5e9, #0284c7);
            border-radius: 32px;
            padding: 4rem 2rem;
            text-align: center;
            color: white;
            box-shadow: 0 25px 50px -15px rgba(14, 165, 233, 0.4);
        }

        .newsletter h2 {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .newsletter p {
            opacity: 0.9;
            margin-bottom: 1.75rem;
        }

        .newsletter-form {
            display: flex;
            max-width: 480px;
            margin: 0 auto;
            gap: 0.75rem;
            background: rgba(255, 255, 255, 0.15);
            padding: 0.5rem;
            border-radius: 999px;
            backdrop-filter: blur(8px);
        }

        .newsletter-form input {
            flex: 1;
            border: none;
            background: transparent;
            padding: 0.9rem 1.25rem;
            color: white;
            font-size: 1rem;
            outline: none;
        }

        .newsletter-form input::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        .newsletter-form button {
            background: white;
            color: #0284c7;
            border: none;
            padding: 0.9rem 1.75rem;
            border-radius: 999px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.25s ease;
        }

        .newsletter-form button:hover {
            transform: scale(1.03);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        /* ========== FOOTER ========== */
        footer {
            background: #0f172a;
            color: white;
            padding: 5rem 0 2rem;
            margin-top: 2rem;
        }

        .footer-grid {
            display: grid;
            grid-template-columns: 1.5fr 1fr 1fr 1fr;
            gap: 2.5rem;
            margin-bottom: 3rem;
        }

        footer h3 {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 1.25rem;
        }

        footer p, footer a {
            color: #94a3b8;
            text-decoration: none;
            font-size: 0.95rem;
            line-height: 1.9;
            display: block;
            transition: color 0.25s ease;
        }

        footer a:hover {
            color: #0ea5e9;
        }

        .copyright {
            text-align: center;
            padding-top: 2rem;
            border-top: 1px solid rgba(255, 255, 255, 0.08);
            color: #64748b;
            font-size: 0.9rem;
        }

        /* ========== RESPONSIVE ========== */
        @media (max-width: 900px) {
            .nav-links { display: none; }
            .deal { grid-template-columns: 1fr; }
            .deal-img { min-height: 280px; }
            .footer-grid { grid-template-columns: 1fr 1fr; }
        }

        @media (max-width: 600px) {
            section { padding: 4rem 0; }
            .newsletter-form { flex-direction: column; border-radius: 20px; }
            .newsletter-form button { width: 100%; }
            .footer-grid { grid-template-columns: 1fr; }
            .timer { flex-wrap: wrap; }
        }
    </style>
</head>
<body>
    <!-- HEADER -->
    <header>
        <div class="container navbar">
            <div class="logo">Nexus<span>Shop</span></div>
            <ul class="nav-links">
                <li><a href="#">Home</a></li>
                <li><a href="#">Categories</a></li>
                <li><a href="#">Products</a></li>
                <li><a href="#">Deals</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
            <div class="header-actions">
                <button aria-label="Search"><i class="fa-solid fa-magnifying-glass"></i></button>
                <button aria-label="Wishlist"><i class="fa-regular fa-heart"></i></button>
                <button aria-label="Cart"><i class="fa-solid fa-cart-shopping"></i></button>
            </div>
        </div>
    </header>

    <!-- HERO -->
    <section class="hero">
        <div class="hero-content">
            <div class="hero-badge">
                <i class="fa-solid fa-bolt"></i>
                New Collection Available
            </div>
            <h1>Ultra Premium Shopping Experience</h1>
            <p>Discover carefully curated products with exceptional quality, modern design, and lightning-fast delivery.</p>
            <a href="#" class="btn btn-primary">Shop Now <i class="fa-solid fa-arrow-right"></i></a>
        </div>
    </section>

    <!-- CATEGORIES -->
    <section>
        <div class="container">
            <div class="section-header">
                <h2>Shop by Category</h2>
                <p>Explore our premium collections</p>
            </div>
            <div class="categories">
                <div class="category-card">
                    <i class="fa-solid fa-mobile-screen"></i>
                    <h3>Mobiles</h3>
                </div>
                <div class="category-card">
                    <i class="fa-solid fa-laptop"></i>
                    <h3>Laptops</h3>
                </div>
                <div class="category-card">
                    <i class="fa-solid fa-headphones"></i>
                    <h3>Audio</h3>
                </div>
                <div class="category-card">
                    <i class="fa-solid fa-shirt"></i>
                    <h3>Fashion</h3>
                </div>
                <div class="category-card">
                    <i class="fa-solid fa-camera"></i>
                    <h3>Camera</h3>
                </div>
            </div>
        </div>
    </section>

    <!-- PRODUCTS -->
    <section>
        <div class="container">
            <div class="section-header">
                <h2>Trending Products</h2>
                <p>Best sellers this week</p>
            </div>
            <div class="products">
                <div class="product-card">
                    <div class="product-img">
                        <span class="badge new">NEW</span>
                        <img src="https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=700&q=80" alt="iPhone 15 Pro">
                    </div>
                    <div class="product-body">
                        <h3>iPhone 15 Pro</h3>
                        <div class="price-row">
                            <strong>$1,299</strong>
                            <span class="old-price">$1,499</span>
                        </div>
                        <div class="rating">★★★★★</div>
                        <div class="product-actions">
                            <button class="cart-btn">Add to Cart</button>
                            <button class="wish-btn">♡</button>
                        </div>
                    </div>
                </div>

                <div class="product-card">
                    <div class="product-img">
                        <span class="badge hot">HOT</span>
                        <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=700&q=80" alt="MacBook Pro M3">
                    </div>
                    <div class="product-body">
                        <h3>MacBook Pro M3</h3>
                        <div class="price-row">
                            <strong>$2,499</strong>
                            <span class="old-price">$2,799</span>
                        </div>
                        <div class="rating">★★★★★</div>
                        <div class="product-actions">
                            <button class="cart-btn">Add to Cart</button>
                            <button class="wish-btn">♡</button>
                        </div>
                    </div>
                </div>

                <div class="product-card">
                    <div class="product-img">
                        <span class="badge sale">SALE</span>
                        <img src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=700&q=80" alt="Nike Air Max">
                    </div>
                    <div class="product-body">
                        <h3>Nike Air Max</h3>
                        <div class="price-row">
                            <strong>$199</strong>
                            <span class="old-price">$299</span>
                        </div>
                        <div class="rating">★★★★☆</div>
                        <div class="product-actions">
                            <button class="cart-btn">Add to Cart</button>
                            <button class="wish-btn">♡</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- DEAL -->
    <section>
        <div class="container">
            <div class="deal">
                <div class="deal-img">
                    <img src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=900&q=80" alt="Smartwatch">
                </div>
                <div class="deal-content">
                    <h2>Flash Sale</h2>
                    <p>Get the premium smartwatch at a limited-time discount. Offer ends soon.</p>
                    <div class="timer">
                        <div class="time-box"><h3 id="days">01</h3><p>Days</p></div>
                        <div class="time-box"><h3 id="hours">12</h3><p>Hours</p></div>
                        <div class="time-box"><h3 id="minutes">30</h3><p>Min</p></div>
                        <div class="time-box"><h3 id="seconds">40</h3><p>Sec</p></div>
                    </div>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                </div>
            </div>
        </div>
    </section>

    <!-- TESTIMONIALS -->
    <section>
        <div class="container">
            <div class="section-header">
                <h2>Customer Reviews</h2>
                <p>Trusted by thousands of happy customers</p>
            </div>
            <div class="testimonials">
                <div class="testimonial">
                    <div class="rating">★★★★★</div>
                    <p>Amazing quality and premium feel. Delivery was super fast and packaging was excellent.</p>
                    <div class="testimonial-author">
                        <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=200&q=80" alt="Sarah">
                        <div>
                            <h4>Sarah Johnson</h4>
                        </div>
                    </div>
                </div>
                <div class="testimonial">
                    <div class="rating">★★★★★</div>
                    <p>Best e-commerce experience I’ve had. The UI is clean and everything feels premium.</p>
                    <div class="testimonial-author">
                        <img src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=200&q=80" alt="Michael">
                        <div>
                            <h4>Michael Lee</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- NEWSLETTER -->
    <section>
        <div class="container">
            <div class="newsletter">
                <h2>Stay in the loop</h2>
                <p>Get exclusive offers and product drops delivered to your inbox.</p>
                <form class="newsletter-form" onsubmit="return false;">
                    <input type="email" placeholder="Enter your email" required>
                    <button type="submit">Subscribe</button>
                </form>
            </div>
        </div>
    </section>

    <!-- FOOTER -->
    <footer>
        <div class="container">
            <div class="footer-grid">
                <div>
                    <h3>NexusShop</h3>
                    <p>Premium shopping experience with modern design and exceptional quality.</p>
                </div>
                <div>
                    <h3>Shop</h3>
                    <a href="#">Home</a>
                    <a href="#">Products</a>
                    <a href="#">Deals</a>
                    <a href="#">Categories</a>
                </div>
                <div>
                    <h3>Support</h3>
                    <a href="#">Help Center</a>
                    <a href="#">Contact Us</a>
                    <a href="#">Shipping Info</a>
                    <a href="#">Returns</a>
                </div>
                <div>
                    <h3>Legal</h3>
                    <a href="#">Privacy Policy</a>
                    <a href="#">Terms of Service</a>
                    <a href="#">Cookie Policy</a>
                </div>
            </div>
            <div class="copyright">
                © 2026 NexusShop. All rights reserved.
            </div>
        </div>
    </footer>

    <script>
        // Countdown Timer
        const targetDate = new Date().getTime() + (24 * 60 * 60 * 1000);

        setInterval(() => {
            const now = new Date().getTime();
            const diff = targetDate - now;

            const days = Math.floor(diff / (1000 * 60 * 60 * 24));
            const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((diff % (1000 * 60)) / 1000);

            document.getElementById("days").textContent = String(days).padStart(2, '0');
            document.getElementById("hours").textContent = String(hours).padStart(2, '0');
            document.getElementById("minutes").textContent = String(minutes).padStart(2, '0');
            document.getElementById("seconds").textContent = String(seconds).padStart(2, '0');
        }, 1000);
    </script>
</body>
</html>
