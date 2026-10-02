<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NexusShop · 3D Interactive</title>

    <!-- Google Fonts & Font Awesome -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            scroll-behavior: smooth;
        }

        :root {
            --primary: #0b1120;
            --secondary: #00e0ff;
            --accent: #7c3aed;
            --white: #ffffff;
            --gray: #94a3b8;
            --light: #f1f5f9;
            --danger: #ff3b5c;
            --glass: rgba(255, 255, 255, 0.55);
            --glass-border: rgba(255, 255, 255, 0.3);
            --card-shadow: 0 30px 50px -20px rgba(0, 0, 0, 0.3);
        }

        body {
            font-family: 'Inter', sans-serif;
            background: radial-gradient(circle at 10% 20%, #f0f9ff, #dbeafe);
            color: var(--primary);
            overflow-x: hidden;
            perspective: 1200px;
        }

        .container {
            width: 90%;
            max-width: 1300px;
            margin: auto;
        }

        /* ---------- 3D GLOBAL EFFECTS ---------- */
        .tilt-card {
            transition: transform 0.15s ease-out, box-shadow 0.3s ease;
            transform-style: preserve-3d;
            will-change: transform;
        }

        .tilt-card:hover {
            box-shadow: 0 40px 60px -15px rgba(0, 212, 255, 0.4);
        }

        /* HEADER */
        header {
            position: sticky;
            top: 0;
            z-index: 1000;
            background: rgba(255, 255, 255, 0.6);
            backdrop-filter: blur(16px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.6);
            box-shadow: 0 20px 40px -12px rgba(0, 0, 0, 0.1);
            transform-style: preserve-3d;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 16px 0;
            transform-style: preserve-3d;
        }

        .logo {
            font-size: 28px;
            font-weight: 800;
            letter-spacing: -0.5px;
            transform: translateZ(20px);
        }

        .logo span {
            background: linear-gradient(135deg, #00e0ff, #7c3aed);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .nav-links {
            display: flex;
            gap: 28px;
            list-style: none;
            transform-style: preserve-3d;
        }

        .nav-links a {
            text-decoration: none;
            color: var(--primary);
            font-weight: 600;
            transition: .3s;
            padding: 6px 2px;
            border-bottom: 2px solid transparent;
            transform: translateZ(10px);
        }

        .nav-links a:hover {
            color: var(--secondary);
            border-bottom-color: var(--secondary);
            transform: translateZ(20px) scale(1.05);
        }

        .header-icons {
            display: flex;
            gap: 20px;
            font-size: 20px;
            transform-style: preserve-3d;
        }

        .header-icons i {
            cursor: pointer;
            transition: .3s;
            transform: translateZ(10px);
        }

        .header-icons i:hover {
            color: var(--secondary);
            transform: translateZ(30px) scale(1.2) rotateY(10deg);
        }

        /* HERO */
        .hero {
            min-height: 90vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            position: relative;
            overflow: hidden;
            background: linear-gradient(135deg, rgba(0, 0, 0, 0.7), rgba(0, 224, 255, 0.2)),
                        url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1600&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: white;
            padding: 40px;
            transform-style: preserve-3d;
        }

        .hero::after {
            content: '';
            position: absolute;
            inset: 0;
            background: radial-gradient(circle at 20% 30%, rgba(0, 224, 255, 0.25), transparent 60%);
            pointer-events: none;
            z-index: 0;
        }

        .hero-content {
            position: relative;
            z-index: 2;
            transform-style: preserve-3d;
            animation: float3d 6s ease-in-out infinite;
        }

        @keyframes float3d {
            0% { transform: translateY(0) rotateX(0deg) rotateY(0deg); }
            50% { transform: translateY(-18px) rotateX(1deg) rotateY(1deg); }
            100% { transform: translateY(0) rotateX(0deg) rotateY(0deg); }
        }

        .hero-content h1 {
            font-size: 74px;
            font-weight: 800;
            margin-bottom: 20px;
            letter-spacing: -2px;
            text-shadow: 0 10px 30px rgba(0,0,0,0.5), 0 0 30px rgba(0, 224, 255, 0.5);
            transform: translateZ(60px);
        }

        .hero-content p {
            max-width: 700px;
            margin: auto;
            font-size: 19px;
            line-height: 1.8;
            margin-bottom: 35px;
            text-shadow: 0 4px 15px rgba(0,0,0,0.5);
            transform: translateZ(40px);
        }

        .btn {
            padding: 16px 40px;
            border: none;
            border-radius: 50px;
            font-size: 16px;
            cursor: pointer;
            transition: .4s;
            font-weight: 700;
            letter-spacing: 0.3px;
            position: relative;
            transform-style: preserve-3d;
            transform: translateZ(30px);
        }

        .btn-primary {
            background: linear-gradient(135deg, #00e0ff, #0077ff);
            color: white;
            box-shadow: 0 20px 30px -8px rgba(0, 224, 255, 0.6), 0 0 0 1px rgba(255,255,255,0.2) inset;
        }

        .btn-primary:hover {
            transform: translateZ(50px) translateY(-5px) scale(1.03);
            box-shadow: 0 30px 40px -8px rgba(0, 224, 255, 0.8), 0 0 0 1px rgba(255,255,255,0.4) inset;
        }

        /* SECTION */
        section {
            padding: 100px 0;
            transform-style: preserve-3d;
        }

        .section-title {
            text-align: center;
            margin-bottom: 60px;
            transform-style: preserve-3d;
        }

        .section-title h2 {
            font-size: 44px;
            font-weight: 700;
            margin-bottom: 10px;
            transform: translateZ(30px);
        }

        .section-title p {
            color: var(--gray);
            transform: translateZ(20px);
        }

        /* CATEGORIES */
        .categories {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 25px;
            transform-style: preserve-3d;
        }

        .category-card {
            background: var(--glass);
            backdrop-filter: blur(12px);
            padding: 40px 20px;
            border-radius: 30px;
            text-align: center;
            transition: .4s;
            border: 1px solid var(--glass-border);
            transform-style: preserve-3d;
            box-shadow: 0 15px 30px -10px rgba(0, 0, 0, 0.1);
            cursor: pointer;
        }

        .category-card i {
            font-size: 44px;
            background: linear-gradient(135deg, #00e0ff, #7c3aed);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin-bottom: 18px;
            transform: translateZ(25px);
            transition: .3s;
        }

        .category-card h3 {
            transform: translateZ(15px);
            font-weight: 600;
        }

        .category-card:hover i {
            transform: translateZ(45px) scale(1.2) rotateY(8deg);
        }

        /* PRODUCTS */
        .products {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(270px, 1fr));
            gap: 30px;
            transform-style: preserve-3d;
        }

        .product-card {
            background: white;
            border-radius: 30px;
            overflow: hidden;
            transition: .4s;
            position: relative;
            box-shadow: var(--card-shadow);
            transform-style: preserve-3d;
            will-change: transform;
        }

        .product-card img {
            width: 100%;
            height: 280px;
            object-fit: cover;
            transition: transform .6s cubic-bezier(0.23, 1, 0.32, 1);
        }

        .product-card:hover img {
            transform: scale(1.1) translateZ(10px);
        }

        .badge {
            position: absolute;
            top: 20px;
            left: 20px;
            padding: 8px 18px;
            border-radius: 40px;
            background: linear-gradient(135deg, #ff3b5c, #ff6b81);
            color: white;
            font-size: 12px;
            font-weight: 700;
            z-index: 5;
            transform: translateZ(30px);
            box-shadow: 0 10px 20px -5px rgba(255, 59, 92, 0.5);
        }

        .product-info {
            padding: 28px;
            transform-style: preserve-3d;
        }

        .product-info h3 {
            margin-bottom: 10px;
            transform: translateZ(15px);
        }

        .price {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 15px 0;
            transform: translateZ(10px);
        }

        .price strong {
            font-size: 24px;
        }

        .old-price {
            color: gray;
            text-decoration: line-through;
        }

        .rating {
            color: #ffc107;
            margin-bottom: 20px;
            transform: translateZ(5px);
        }

        .product-actions {
            display: flex;
            gap: 15px;
            transform-style: preserve-3d;
        }

        .cart-btn {
            flex: 1;
            padding: 14px;
            border: none;
            border-radius: 14px;
            background: var(--primary);
            color: white;
            cursor: pointer;
            transition: .3s;
            font-weight: 600;
            transform: translateZ(10px);
        }

        .cart-btn:hover {
            background: var(--secondary);
            transform: translateZ(25px) scale(1.02);
            box-shadow: 0 15px 25px -8px rgba(0, 224, 255, 0.6);
        }

        .wish-btn {
            width: 54px;
            border: none;
            border-radius: 14px;
            cursor: pointer;
            background: #f1f5f9;
            transition: .3s;
            transform: translateZ(10px);
            font-size: 18px;
        }

        .wish-btn:hover {
            background: #ffe4e6;
            transform: translateZ(25px) rotateY(10deg);
        }

        /* DEAL */
        .deal {
            background: linear-gradient(135deg, #0b1120, #1e293b);
            border-radius: 40px;
            overflow: hidden;
            color: white;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            align-items: center;
            transform-style: preserve-3d;
            box-shadow: 0 50px 70px -30px rgba(0, 0, 0, 0.6);
        }

        .deal img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform .8s ease;
        }

        .deal:hover img {
            transform: scale(1.04);
        }

        .deal-content {
            padding: 50px;
            transform-style: preserve-3d;
        }

        .deal-content h2 {
            font-size: 40px;
            transform: translateZ(30px);
        }

        .timer {
            display: flex;
            gap: 15px;
            margin: 25px 0;
            transform-style: preserve-3d;
        }

        .time-box {
            background: rgba(255, 255, 255, 0.08);
            padding: 18px;
            border-radius: 18px;
            text-align: center;
            min-width: 85px;
            backdrop-filter: blur(6px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            transform: translateZ(20px);
            transition: .3s;
        }

        .time-box:hover {
            transform: translateZ(40px) translateY(-5px);
            background: rgba(0, 224, 255, 0.15);
            border-color: rgba(0, 224, 255, 0.4);
        }

        /* TESTIMONIALS */
        .testimonials {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 30px;
            transform-style: preserve-3d;
        }

        .testimonial {
            background: white;
            padding: 35px;
            border-radius: 30px;
            box-shadow: var(--card-shadow);
            transform-style: preserve-3d;
        }

        .testimonial img {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            object-fit: cover;
            margin-top: 20px;
            border: 3px solid white;
            box-shadow: 0 10px 20px -5px rgba(0,0,0,0.2);
            transform: translateZ(25px);
            transition: .3s;
        }

        .testimonial:hover img {
            transform: translateZ(45px) scale(1.1);
        }

        /* NEWSLETTER */
        .newsletter {
            background: linear-gradient(135deg, #00e0ff, #0077ff);
            padding: 70px;
            border-radius: 40px;
            text-align: center;
            color: white;
            transform-style: preserve-3d;
            box-shadow: 0 50px 70px -30px rgba(0, 119, 255, 0.5);
            transition: transform .3s;
        }

        .newsletter:hover {
            transform: translateZ(20px);
        }

        .newsletter input {
            width: 60%;
            max-width: 500px;
            padding: 18px 24px;
            border-radius: 60px;
            border: none;
            margin-top: 25px;
            outline: none;
            font-size: 16px;
            transform: translateZ(25px);
            box-shadow: 0 15px 30px -10px rgba(0,0,0,0.2);
            transition: .3s;
        }

        .newsletter input:focus {
            transform: translateZ(40px) scale(1.02);
            box-shadow: 0 25px 40px -10px rgba(0,0,0,0.3);
        }

        /* FOOTER */
        footer {
            background: var(--primary);
            color: white;
            padding: 70px 0 30px;
            margin-top: 100px;
            transform-style: preserve-3d;
        }

        .footer-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 40px;
            transform-style: preserve-3d;
        }

        footer h3 {
            margin-bottom: 20px;
            transform: translateZ(15px);
        }

        footer p,
        footer a {
            color: #cbd5e1;
            text-decoration: none;
            line-height: 2;
            transition: .3s;
            display: inline-block;
            transform: translateZ(5px);
        }

        footer a:hover {
            color: var(--secondary);
            transform: translateZ(20px) translateX(5px);
        }

        .copyright {
            text-align: center;
            margin-top: 50px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding-top: 20px;
            transform: translateZ(10px);
        }

        /* RESPONSIVE */
        @media(max-width:900px) {
            .nav-links {
                display: none;
            }
            .hero-content h1 {
                font-size: 48px;
            }
            .newsletter input {
                width: 100%;
            }
        }

        @media(max-width:600px) {
            .hero-content h1 {
                font-size: 36px;
            }
            section {
                padding: 70px 0;
            }
            .section-title h2 {
                font-size: 32px;
            }
            .deal-content h2 {
                font-size: 30px;
            }
        }
    </style>
</head>
<body>

    <!-- HEADER -->
    <header>
        <div class="container navbar">
            <div class="logo tilt-card">Nexus<span>Shop</span></div>
            <ul class="nav-links">
                <li><a href="#">Home</a></li>
                <li><a href="#">Categories</a></li>
                <li><a href="#">Products</a></li>
                <li><a href="#">Deals</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
            <div class="header-icons">
                <i class="fa-solid fa-magnifying-glass"></i>
                <i class="fa-regular fa-heart"></i>
                <i class="fa-solid fa-cart-shopping"></i>
            </div>
        </div>
    </header>

    <!-- HERO -->
    <section class="hero">
        <div class="hero-content">
            <h1>Ultra Premium Shopping Experience</h1>
            <p>Discover premium products with amazing offers, modern designs and lightning-fast delivery.</p>
            <button class="btn btn-primary">Shop Now</button>
        </div>
    </section>

    <!-- CATEGORIES -->
    <section>
        <div class="container">
            <div class="section-title">
                <h2>Shop by Category</h2>
                <p>Explore premium collections</p>
            </div>
            <div class="categories">
                <div class="category-card tilt-card">
                    <i class="fa-solid fa-mobile-screen"></i>
                    <h3>Mobiles</h3>
                </div>
                <div class="category-card tilt-card">
                    <i class="fa-solid fa-laptop"></i>
                    <h3>Laptops</h3>
                </div>
                <div class="category-card tilt-card">
                    <i class="fa-solid fa-headphones"></i>
                    <h3>Audio</h3>
                </div>
                <div class="category-card tilt-card">
                    <i class="fa-solid fa-shirt"></i>
                    <h3>Fashion</h3>
                </div>
                <div class="category-card tilt-card">
                    <i class="fa-solid fa-camera"></i>
                    <h3>Camera</h3>
                </div>
            </div>
        </div>
    </section>

    <!-- PRODUCTS -->
    <section>
        <div class="container">
            <div class="section-title">
                <h2>Trending Products</h2>
                <p>Best selling products</p>
            </div>
            <div class="products">
                <!-- product 1 -->
                <div class="product-card tilt-card">
                    <span class="badge">NEW</span>
                    <img src="https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=700&q=80" alt="iPhone 15 Pro">
                    <div class="product-info">
                        <h3>iPhone 15 Pro</h3>
                        <div class="price">
                            <strong>$1299</strong>
                            <span class="old-price">$1499</span>
                        </div>
                        <div class="rating">★★★★★</div>
                        <div class="product-actions">
                            <button class="cart-btn">Add To Cart</button>
                            <button class="wish-btn">❤️</button>
                        </div>
                    </div>
                </div>
                <!-- product 2 -->
                <div class="product-card tilt-card">
                    <span class="badge">HOT</span>
                    <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=700&q=80" alt="MacBook Pro M3">
                    <div class="product-info">
                        <h3>MacBook Pro M3</h3>
                        <div class="price">
                            <strong>$2499</strong>
                            <span class="old-price">$2799</span>
                        </div>
                        <div class="rating">★★★★★</div>
                        <div class="product-actions">
                            <button class="cart-btn">Add To Cart</button>
                            <button class="wish-btn">❤️</button>
                        </div>
                    </div>
                </div>
                <!-- product 3 -->
                <div class="product-card tilt-card">
                    <span class="badge">SALE</span>
                    <img src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=700&q=80" alt="Nike Air Max">
                    <div class="product-info">
                        <h3>Nike Air Max</h3>
                        <div class="price">
                            <strong>$199</strong>
                            <span class="old-price">$299</span>
                        </div>
                        <div class="rating">★★★★☆</div>
                        <div class="product-actions">
                            <button class="cart-btn">Add To Cart</button>
                            <button class="wish-btn">❤️</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- DEAL -->
    <section>
        <div class="container">
            <div class="deal tilt-card">
                <img src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=900&q=80" alt="Smartwatch">
                <div class="deal-content">
                    <h2>Flash Sale</h2>
                    <p style="margin-top:15px;">Get premium smartwatch with limited-time discounts.</p>
                    <div class="timer">
                        <div class="time-box"><h3 id="days">01</h3><p>Days</p></div>
                        <div class="time-box"><h3 id="hours">12</h3><p>Hours</p></div>
                        <div class="time-box"><h3 id="minutes">30</h3><p>Min</p></div>
                        <div class="time-box"><h3 id="seconds">40</h3><p>Sec</p></div>
                    </div>
                    <button class="btn btn-primary">Buy Now</button>
                </div>
            </div>
        </div>
    </section>

    <!-- TESTIMONIALS -->
    <section>
        <div class="container">
            <div class="section-title">
                <h2>Customer Reviews</h2>
                <p>Trusted by thousands of customers</p>
            </div>
            <div class="testimonials">
                <div class="testimonial tilt-card">
                    <div class="rating">★★★★★</div>
                    <p>Amazing quality and premium feel. Delivery was super fast.</p>
                    <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=200&q=80" alt="Sarah">
                    <h4>Sarah Johnson</h4>
                </div>
                <div class="testimonial tilt-card">
                    <div class="rating">★★★★★</div>
                    <p>Best e-commerce UI experience I have ever seen.</p>
                    <img src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=200&q=80" alt="Michael">
                    <h4>Michael Lee</h4>
                </div>
            </div>
        </div>
    </section>

    <!-- NEWSLETTER -->
    <section>
        <div class="container">
            <div class="newsletter tilt-card">
                <h2>Subscribe Newsletter</h2>
                <p style="margin-top:15px;">Get latest offers and premium products updates.</p>
                <input type="email" placeholder="Enter your email">
            </div>
        </div>
    </section>

    <!-- FOOTER -->
    <footer>
        <div class="container">
            <div class="footer-grid">
                <div>
                    <h3>NexusShop</h3>
                    <p>Premium shopping experience with modern UI.</p>
                </div>
                <div>
                    <h3>Quick Links</h3>
                    <a href="#">Home</a><br>
                    <a href="#">Products</a><br>
                    <a href="#">Deals</a>
                </div>
                <div>
                    <h3>Support</h3>
                    <a href="#">Help Center</a><br>
                    <a href="#">Contact</a><br>
                    <a href="#">Privacy Policy</a>
                </div>
            </div>
            <div class="copyright">
                © 2026 NexusShop. All Rights Reserved.
            </div>
        </div>
    </footer>

    <script>
        // ---------- 3D TILT EFFECT (interactive) ----------
        function applyTilt() {
            const tiltElements = document.querySelectorAll('.tilt-card');
            
            tiltElements.forEach(el => {
                el.addEventListener('mousemove', (e) => {
                    const rect = el.getBoundingClientRect();
                    const x = e.clientX - rect.left;
                    const y = e.clientY - rect.top;
                    
                    const centerX = rect.width / 2;
                    const centerY = rect.height / 2;
                    
                    const rotateY = ((x - centerX) / centerX) * 8;  // max 8deg
                    const rotateX = ((centerY - y) / centerY) * 8;
                    
                    el.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) scale(1.02)`;
                });
                
                el.addEventListener('mouseleave', () => {
                    el.style.transform = 'perspective(1000px) rotateX(0deg) rotateY(0deg) scale(1)';
                });
            });
        }

        // ---------- FLASH SALE TIMER ----------
        const targetDate = new Date().getTime() + (24 * 60 * 60 * 1000);

        setInterval(() => {
            const now = new Date().getTime();
            const diff = targetDate - now;

            const days = Math.floor(diff / (1000 * 60 * 60 * 24));
            const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((diff % (1000 * 60)) / 1000);

            document.getElementById("days").innerHTML = days;
            document.getElementById("hours").innerHTML = hours;
            document.getElementById("minutes").innerHTML = minutes;
            document.getElementById("seconds").innerHTML = seconds;
        }, 1000);

        // ---------- ADD EXTRA FLOATING ON HERO ----------
        // subtle parallax on hero content
        const hero = document.querySelector('.hero');
        const heroContent = document.querySelector('.hero-content');
        
        if (hero && heroContent) {
            hero.addEventListener('mousemove', (e) => {
                const x = (e.clientX / window.innerWidth - 0.5) * 12;
                const y = (e.clientY / window.innerHeight - 0.5) * 12;
                heroContent.style.transform = `translateY(-10px) rotateX(${y}deg) rotateY(${x}deg)`;
            });
            hero.addEventListener('mouseleave', () => {
                heroContent.style.transform = 'translateY(0) rotateX(0deg) rotateY(0deg)';
            });
        }

        // Initialize tilt after DOM is ready
        window.addEventListener('DOMContentLoaded', () => {
            applyTilt();
        });
    </script>
</body>
</html>
