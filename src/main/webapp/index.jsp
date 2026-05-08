<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NexusShop - Modern E-Commerce</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
        rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            scroll-behavior: smooth;
        }

        :root {
            --primary: #0f172a;
            --secondary: #00d4ff;
            --white: #ffffff;
            --gray: #64748b;
            --light: #f8fafc;
            --danger: #ff4757;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(to bottom, #f8fbff, #eef5ff);
            color: var(--primary);
            overflow-x: hidden;
        }

        .container {
            width: 90%;
            max-width: 1300px;
            margin: auto;
        }

        /* HEADER */

        header {
            position: sticky;
            top: 0;
            z-index: 1000;
            background: rgba(255, 255, 255, 0.75);
            backdrop-filter: blur(14px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.05);
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 18px 0;
        }

        .logo {
            font-size: 28px;
            font-weight: 700;
        }

        .logo span {
            color: var(--secondary);
        }

        .nav-links {
            display: flex;
            gap: 28px;
            list-style: none;
        }

        .nav-links a {
            text-decoration: none;
            color: var(--primary);
            font-weight: 500;
            transition: .3s;
        }

        .nav-links a:hover {
            color: var(--secondary);
        }

        .header-icons {
            display: flex;
            gap: 20px;
            font-size: 20px;
        }

        .header-icons i {
            cursor: pointer;
            transition: .3s;
        }

        .header-icons i:hover {
            color: var(--secondary);
            transform: scale(1.2);
        }

        /* HERO */

        .hero {
            min-height: 90vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;

            background:
                linear-gradient(135deg,
                    rgba(0, 0, 0, 0.7),
                    rgba(0, 212, 255, 0.3)),
                url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1600&q=80');

            background-size: cover;
            background-position: center;
            color: white;
            padding: 40px;
        }

        .hero-content h1 {
            font-size: 70px;
            margin-bottom: 20px;
            animation: fadeUp 1s ease;
        }

        .hero-content p {
            max-width: 700px;
            margin: auto;
            font-size: 18px;
            line-height: 1.8;
            margin-bottom: 35px;
            animation: fadeUp 1.3s ease;
        }

        .btn {
            padding: 15px 35px;
            border: none;
            border-radius: 50px;
            font-size: 16px;
            cursor: pointer;
            transition: .4s;
            font-weight: 600;
        }

        .btn-primary {
            background: linear-gradient(135deg, #00d4ff, #0077ff);
            color: white;
            box-shadow: 0 10px 20px rgba(0, 212, 255, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 212, 255, 0.45);
        }

        /* SECTION */

        section {
            padding: 100px 0;
        }

        .section-title {
            text-align: center;
            margin-bottom: 60px;
        }

        .section-title h2 {
            font-size: 42px;
            margin-bottom: 10px;
        }

        .section-title p {
            color: var(--gray);
        }

        /* CATEGORIES */

        .categories {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 25px;
        }

        .category-card {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(10px);
            padding: 40px 20px;
            border-radius: 25px;
            text-align: center;
            transition: .4s;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .category-card:hover {
            transform: translateY(-10px);
            background: white;
            box-shadow: 0 20px 35px rgba(0, 0, 0, 0.08);
        }

        .category-card i {
            font-size: 40px;
            color: var(--secondary);
            margin-bottom: 15px;
        }

        /* PRODUCTS */

        .products {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(270px, 1fr));
            gap: 30px;
        }

        .product-card {
            background: white;
            border-radius: 25px;
            overflow: hidden;
            transition: .4s;
            position: relative;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.06);
        }

        .product-card:hover {
            transform: translateY(-12px) scale(1.02);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.12);
        }

        .product-card img {
            width: 100%;
            height: 280px;
            object-fit: cover;
            transition: transform .5s ease;
        }

        .product-card:hover img {
            transform: scale(1.08);
        }

        .badge {
            position: absolute;
            top: 15px;
            left: 15px;
            padding: 8px 14px;
            border-radius: 30px;
            background: linear-gradient(135deg, #ff4757, #ff6b81);
            color: white;
            font-size: 12px;
            font-weight: 700;
        }

        .product-info {
            padding: 25px;
        }

        .product-info h3 {
            margin-bottom: 10px;
        }

        .price {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 15px 0;
        }

        .price strong {
            font-size: 22px;
        }

        .old-price {
            color: gray;
            text-decoration: line-through;
        }

        .rating {
            color: #ffc107;
            margin-bottom: 20px;
        }

        .product-actions {
            display: flex;
            gap: 15px;
        }

        .cart-btn {
            flex: 1;
            padding: 12px;
            border: none;
            border-radius: 12px;
            background: var(--primary);
            color: white;
            cursor: pointer;
            transition: .3s;
        }

        .cart-btn:hover {
            background: var(--secondary);
        }

        .wish-btn {
            width: 50px;
            border: none;
            border-radius: 12px;
            cursor: pointer;
        }

        /* DEAL */

        .deal {
            background: linear-gradient(135deg, #0f172a, #1e293b);
            border-radius: 30px;
            overflow: hidden;
            color: white;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            align-items: center;
        }

        .deal img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .deal-content {
            padding: 50px;
        }

        .timer {
            display: flex;
            gap: 15px;
            margin: 25px 0;
        }

        .time-box {
            background: rgba(255, 255, 255, 0.1);
            padding: 18px;
            border-radius: 15px;
            text-align: center;
            min-width: 80px;
        }

        /* TESTIMONIALS */

        .testimonials {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 30px;
        }

        .testimonial {
            background: white;
            padding: 35px;
            border-radius: 25px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.06);
        }

        .testimonial img {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            object-fit: cover;
            margin-top: 20px;
        }

        /* NEWSLETTER */

        .newsletter {
            background: linear-gradient(135deg, #00d4ff, #0077ff);
            padding: 70px;
            border-radius: 30px;
            text-align: center;
            color: white;
        }

        .newsletter input {
            width: 60%;
            max-width: 500px;
            padding: 18px;
            border-radius: 50px;
            border: none;
            margin-top: 25px;
            outline: none;
        }

        /* FOOTER */

        footer {
            background: var(--primary);
            color: white;
            padding: 70px 0 30px;
            margin-top: 100px;
        }

        .footer-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 40px;
        }

        footer h3 {
            margin-bottom: 20px;
        }

        footer p,
        footer a {
            color: #cbd5e1;
            text-decoration: none;
            line-height: 2;
        }

        .copyright {
            text-align: center;
            margin-top: 50px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding-top: 20px;
        }

        /* ANIMATION */

        @keyframes fadeUp {
            from {
                opacity: 0;
                transform: translateY(40px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* RESPONSIVE */

        @media(max-width:900px) {

            .nav-links {
                display: none;
            }

            .hero-content h1 {
                font-size: 45px;
            }

            .newsletter input {
                width: 100%;
            }
        }

        @media(max-width:600px) {

            .hero-content h1 {
                font-size: 34px;
            }

            section {
                padding: 70px 0;
            }

            .section-title h2 {
                font-size: 30px;
            }
        }
    </style>
</head>

<body>

    <!-- HEADER -->

    <header>
        <div class="container navbar">

            <div class="logo">
                Nexus<span>Shop</span>
            </div>

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
            <h1>Premium Shopping Experience</h1>

            <p>
                Discover premium products with amazing offers,
                modern designs and lightning-fast delivery.
            </p>

            <button class="btn btn-primary">
                Shop Now
            </button>
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

            <div class="section-title">
                <h2>Trending Products</h2>
                <p>Best selling products</p>
            </div>

            <div class="products">

                <div class="product-card">

                    <span class="badge">NEW</span>

                    <img src="https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=700&q=80">

                    <div class="product-info">

                        <h3>iPhone 15 Pro</h3>

                        <div class="price">
                            <strong>$1299</strong>
                            <span class="old-price">$1499</span>
                        </div>

                        <div class="rating">
                            ★★★★★
                        </div>

                        <div class="product-actions">
                            <button class="cart-btn">
                                Add To Cart
                            </button>

                            <button class="wish-btn">
                                ❤️
                            </button>
                        </div>

                    </div>

                </div>

                <div class="product-card">

                    <span class="badge">HOT</span>

                    <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=700&q=80">

                    <div class="product-info">

                        <h3>MacBook Pro M3</h3>

                        <div class="price">
                            <strong>$2499</strong>
                            <span class="old-price">$2799</span>
                        </div>

                        <div class="rating">
                            ★★★★★
                        </div>

                        <div class="product-actions">
                            <button class="cart-btn">
                                Add To Cart
                            </button>

                            <button class="wish-btn">
                                ❤️
                            </button>
                        </div>

                    </div>

                </div>

                <div class="product-card">

                    <span class="badge">SALE</span>

                    <img src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=700&q=80">

                    <div class="product-info">

                        <h3>Nike Air Max</h3>

                        <div class="price">
                            <strong>$199</strong>
                            <span class="old-price">$299</span>
                        </div>

                        <div class="rating">
                            ★★★★☆
                        </div>

                        <div class="product-actions">
                            <button class="cart-btn">
                                Add To Cart
                            </button>

                            <button class="wish-btn">
                                ❤️
                            </button>
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

                <img
                    src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=900&q=80">

                <div class="deal-content">

                    <h2>Flash Sale</h2>

                    <p style="margin-top:15px;">
                        Get premium smartwatch with limited-time discounts.
                    </p>

                    <div class="timer">

                        <div class="time-box">
                            <h3 id="days">01</h3>
                            <p>Days</p>
                        </div>

                        <div class="time-box">
                            <h3 id="hours">12</h3>
                            <p>Hours</p>
                        </div>

                        <div class="time-box">
                            <h3 id="minutes">30</h3>
                            <p>Min</p>
                        </div>

                        <div class="time-box">
                            <h3 id="seconds">40</h3>
                            <p>Sec</p>
                        </div>

                    </div>

                    <button class="btn btn-primary">
                        Buy Now
                    </button>

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

                <div class="testimonial">

                    <div class="rating">
                        ★★★★★
                    </div>

                    <p>
                        Amazing quality and premium feel.
                        Delivery was super fast.
                    </p>

                    <img
                        src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=200&q=80">

                    <h4>Sarah Johnson</h4>

                </div>

                <div class="testimonial">

                    <div class="rating">
                        ★★★★★
                    </div>

                    <p>
                        Best e-commerce UI experience I have ever seen.
                    </p>

                    <img
                        src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=200&q=80">

                    <h4>Michael Lee</h4>

                </div>

            </div>

        </div>

    </section>

    <!-- NEWSLETTER -->

    <section>

        <div class="container">

            <div class="newsletter">

                <h2>Subscribe Newsletter</h2>

                <p style="margin-top:15px;">
                    Get latest offers and premium products updates.
                </p>

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
                    <p>
                        Premium shopping experience with modern UI.
                    </p>
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

    <!-- JAVASCRIPT -->

    <script>

        // FLASH SALE TIMER

        const targetDate = new Date().getTime() + (24 * 60 * 60 * 1000);

        setInterval(() => {

            const now = new Date().getTime();

            const diff = targetDate - now;

            const days = Math.floor(diff / (1000 * 60 * 60 * 24));

            const hours = Math.floor(
                (diff % (1000 * 60 * 60 * 24)) /
                (1000 * 60 * 60)
            );

            const minutes = Math.floor(
                (diff % (1000 * 60 * 60)) /
                (1000 * 60)
            );

            const seconds = Math.floor(
                (diff % (1000 * 60)) / 1000
            );

            document.getElementById("days").innerHTML = days;
            document.getElementById("hours").innerHTML = hours;
            document.getElementById("minutes").innerHTML = minutes;
            document.getElementById("seconds").innerHTML = seconds;

        }, 1000);

    </script>

</body>

</html>
