
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NexusIQ Admin Dashboard</title>

  <style>
    :root {
      --primary: #635bff;
      --primary-light: #efeeff;
      --background: #f5f7fb;
      --surface: #ffffff;
      --text: #20283b;
      --muted: #7b8498;
      --border: #e7eaf1;
      --green: #14866d;
      --red: #c2415d;
      --shadow: 0 8px 30px rgba(30, 40, 70, 0.06);
    }

    body.dark {
      --background: #101522;
      --surface: #192131;
      --text: #f0f3ff;
      --muted: #a5afc4;
      --border: #303a4d;
      --primary-light: #302d56;
      --shadow: 0 8px 30px rgba(0, 0, 0, 0.18);
    }

    * {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      font-family: Inter, "Segoe UI", Arial, sans-serif;
      background: var(--background);
      color: var(--text);
      transition: background 0.2s, color 0.2s;
    }

    button, input, select {
      font: inherit;
    }

    button {
      cursor: pointer;
    }

    .sidebar {
      width: 245px;
      position: fixed;
      inset: 0 auto 0 0;
      background: var(--surface);
      border-right: 1px solid var(--border);
      padding: 25px 16px;
      display: flex;
      flex-direction: column;
      z-index: 10;
    }

    .brand {
      display: flex;
      align-items: center;
      gap: 12px;
      padding: 0 8px 32px;
      font-size: 20px;
      font-weight: 800;
    }

    .brand-icon {
      width: 42px;
      height: 42px;
      display: grid;
      place-items: center;
      border-radius: 13px;
      background: linear-gradient(135deg, #635bff, #ad63f5);
      color: white;
    }

    .brand small {
      display: block;
      color: var(--muted);
      font-size: 10px;
      margin-top: 3px;
      letter-spacing: 1px;
    }

    .nav-label {
      padding: 10px 12px;
      color: var(--muted);
      font-size: 11px;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    .nav-btn {
      display: flex;
      align-items: center;
      gap: 12px;
      width: 100%;
      padding: 12px;
      margin-bottom: 5px;
      color: var(--muted);
      background: transparent;
      border: 0;
      border-radius: 11px;
      text-align: left;
      font-weight: 600;
    }

    .nav-btn:hover,
    .nav-btn.active {
      background: var(--primary-light);
      color: var(--primary);
    }

    .sidebar-bottom {
      margin-top: auto;
      padding: 14px;
      border: 1px solid var(--border);
      background: var(--background);
      border-radius: 14px;
    }

    .sidebar-bottom p {
      color: var(--muted);
      font-size: 12px;
      line-height: 1.6;
    }

    .main {
      margin-left: 245px;
      min-height: 100vh;
    }

    .topbar {
      min-height: 76px;
      padding: 15px 30px;
      display: flex;
      align-items: center;
      gap: 14px;
      position: sticky;
      top: 0;
      z-index: 5;
      background: var(--surface);
      border-bottom: 1px solid var(--border);
    }

    .page-title {
      margin-right: auto;
    }

    .page-title h1 {
      font-size: 20px;
      margin: 0;
    }

    .page-title p {
      margin: 4px 0 0;
      color: var(--muted);
      font-size: 12px;
    }

    .search {
      width: 240px;
      padding: 10px 12px;
      color: var(--text);
      background: var(--background);
      border: 1px solid var(--border);
      border-radius: 10px;
    }

    .icon-button {
      width: 40px;
      height: 40px;
      border: 1px solid var(--border);
      border-radius: 11px;
      background: var(--surface);
      color: var(--text);
    }

    .avatar {
      width: 39px;
      height: 39px;
      border-radius: 50%;
      background: #dcd7ff;
      color: #4135a5;
      display: grid;
      place-items: center;
      font-weight: 800;
    }

    .content {
      padding: 28px;
      max-width: 1600px;
      margin: auto;
    }

    .welcome {
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 16px;
      margin-bottom: 24px;
    }

    .welcome h2 {
      margin: 0;
      font-size: 25px;
    }

    .welcome p {
      color: var(--muted);
      margin: 7px 0 0;
    }

    .button {
      padding: 10px 15px;
      border-radius: 10px;
      border: 1px solid var(--border);
      background: var(--surface);
      color: var(--text);
      font-weight: 700;
    }

    .button.primary {
      background: var(--primary);
      color: white;
      border-color: var(--primary);
    }

    .button:hover {
      opacity: 0.9;
    }

    .grid {
      display: grid;
      gap: 18px;
    }

    .stats {
      grid-template-columns: repeat(4, minmax(0, 1fr));
      margin-bottom: 20px;
    }

    .card {
      background: var(--surface);
      border: 1px solid var(--border);
      border-radius: 17px;
      box-shadow: var(--shadow);
      min-width: 0;
    }

    .stat {
      padding: 20px;
    }

    .stat-heading {
      display: flex;
      align-items: center;
      justify-content: space-between;
      color: var(--muted);
      font-size: 12px;
      font-weight: 600;
    }

    .stat-icon {
      width: 36px;
      height: 36px;
      display: grid;
      place-items: center;
      border-radius: 11px;
      background: var(--primary-light);
      color: var(--primary);
      font-size: 18px;
    }

    .stat-value {
      font-size: 27px;
      font-weight: 800;
      margin: 14px 0 8px;
      letter-spacing: -1px;
    }

    .stat-note {
      font-size: 11px;
      color: var(--muted);
    }

    .positive {
      color: var(--green);
      font-weight: 700;
    }

    .charts {
      grid-template-columns: minmax(0, 1.6fr) minmax(260px, 1fr);
      margin-bottom: 20px;
    }

    .card-header {
      padding: 20px 20px 12px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 12px;
    }

    .card-header h3 {
      margin: 0;
      font-size: 15px;
    }

    .card-header p {
      margin: 5px 0 0;
      color: var(--muted);
      font-size: 12px;
    }

    .chart-content {
      padding: 8px 20px 20px;
    }

    .chart-value {
      font-size: 25px;
      font-weight: 800;
      margin: 0 0 12px;
    }

    .chart {
      width: 100%;
      height: auto;
      display: block;
    }

    .chart-grid {
      stroke: var(--border);
      stroke-dasharray: 4 5;
    }

    .chart-label {
      fill: var(--muted);
      font-size: 11px;
    }

    .traffic {
      padding: 10px 20px 22px;
    }

    .traffic-row {
      margin: 17px 0;
    }

    .traffic-heading {
      display: flex;
      justify-content: space-between;
      margin-bottom: 8px;
      font-size: 12px;
    }

    .traffic-heading span {
      color: var(--muted);
    }

    .progress {
      height: 8px;
      background: var(--background);
      border-radius: 20px;
      overflow: hidden;
    }

    .progress div {
      height: 100%;
      background: linear-gradient(90deg, var(--primary), #ac75f4);
      border-radius: inherit;
    }

    .table-card {
      overflow: hidden;
    }

    .table-wrap {
      overflow-x: auto;
    }

    table {
      border-collapse: collapse;
      width: 100%;
      min-width: 620px;
    }

    th, td {
      text-align: left;
      padding: 14px 20px;
      border-top: 1px solid var(--border);
      white-space: nowrap;
    }

    th {
      color: var(--muted);
      background: var(--background);
      font-size: 10px;
      text-transform: uppercase;
      letter-spacing: .7px;
    }

    td {
      font-size: 12px;
    }

    .customer {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .customer-icon {
      width: 32px;
      height: 32px;
      border-radius: 10px;
      display: grid;
      place-items: center;
      color: var(--primary);
      background: var(--primary-light);
      font-weight: 800;
    }

    .customer strong {
      display: block;
    }

    .customer small {
      display: block;
      color: var(--muted);
      margin-top: 3px;
    }

    .status {
      display: inline-block;
      padding: 5px 9px;
      border-radius: 20px;
      font-size: 10px;
      font-weight: 800;
    }

    .status.Paid, .status.Delivered {
      color: var(--green);
      background: color-mix(in srgb, var(--green) 12%, var(--surface));
    }

    .status.Pending {
      color: #a8660a;
      background: #fff2d8;
    }

    .status.Cancelled {
      color: var(--red);
      background: color-mix(in srgb, var(--red) 12%, var(--surface));
    }

    .text-button {
      border: 0;
      background: transparent;
      color: var(--primary);
      font-weight: 700;
    }

    .bottom-grid {
      grid-template-columns: 1fr 1fr;
      margin-top: 20px;
    }

    .activity-list {
      padding: 8px 20px 20px;
    }

    .activity-item {
      display: flex;
      gap: 12px;
      padding: 13px 0;
      border-bottom: 1px solid var(--border);
      font-size: 12px;
    }

    .activity-item:last-child {
      border-bottom: 0;
    }

    .activity-symbol {
      flex: 0 0 34px;
      width: 34px;
      height: 34px;
      border-radius: 10px;
      background: var(--background);
      display: grid;
      place-items: center;
    }

    .activity-item small {
      display: block;
      color: var(--muted);
      margin-top: 5px;
    }

    .quick-actions {
      padding: 10px 20px 20px;
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 11px;
    }

    .quick-action {
      text-align: left;
      padding: 14px;
      border: 1px solid var(--border);
      border-radius: 12px;
      background: var(--background);
      color: var(--text);
    }

    .quick-action:hover {
      border-color: var(--primary);
    }

    .quick-action strong {
      display: block;
      margin-top: 8px;
      font-size: 12px;
    }

    .quick-action small {
      color: var(--muted);
      font-size: 11px;
    }

    .page-panel { display: none; }
    .page-panel.active { display: block; }
    .muted { color: var(--muted); }
    .hidden { display: none !important; }

    .modal-backdrop {
      display: none;
      position: fixed;
      inset: 0;
      z-index: 50;
      padding: 18px;
      background: rgba(10, 15, 28, .55);
      align-items: center;
      justify-content: center;
    }

    .modal-backdrop.show { display: flex; }

    .modal {
      width: min(460px, 100%);
      max-height: 90vh;
      overflow: auto;
      background: var(--surface);
      border: 1px solid var(--border);
      border-radius: 18px;
      padding: 22px;
      box-shadow: 0 25px 70px rgba(0,0,0,.2);
    }

    .modal-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 12px;
    }

    .modal-header h3 { margin: 0; }
    .field { display: grid; gap: 6px; margin-top: 15px; }
    .field label { font-weight: 700; font-size: 12px; }
    .field input, .field select {
      width: 100%;
      border: 1px solid var(--border);
      background: var(--background);
      color: var(--text);
      padding: 11px;
      border-radius: 10px;
    }

    .modal-actions { display:flex; justify-content:flex-end; gap:8px; margin-top:20px; }
    .toast-area { position:fixed; right:18px; bottom:18px; z-index:80; display:grid; gap:8px; }
    .toast { background:var(--text); color:var(--surface); padding:12px 15px; border-radius:11px; box-shadow:var(--shadow); max-width:340px; }
    .empty { padding:30px; text-align:center; color:var(--muted); }
    .mobile-menu { display:none; }

    @media (max-width:1150px) {
      .stats { grid-template-columns:repeat(2,minmax(0,1fr)); }
      .charts { grid-template-columns:1fr; }
    }

    @media (max-width:850px) {
      .sidebar { transform:translateX(-100%); box-shadow:var(--shadow); }
      body.menu-open .sidebar { transform:translateX(0); }
      body.menu-open .overlay { display:block; }
      .main { margin-left:0; }
      .mobile-menu { display:inline-grid; place-items:center; flex:0 0 40px; }
      .overlay { display:none; position:fixed; inset:0; background:rgba(10,15,28,.45); z-index:8; }
      .bottom-grid { grid-template-columns:1fr; }
      .topbar { padding:14px 18px; }
      .content { padding:22px 18px; }
    }

    @media (max-width:560px) {
      .topbar { gap:8px; }
      .page-title h1 { font-size:17px; }
      .page-title p { display:none; }
      .search { display:none; }
      .content { padding:18px 12px 28px; }
      .welcome { flex-direction:column; align-items:flex-start; }
      .welcome h2 { font-size:21px; }
      .welcome .actions { display:flex; width:100%; }
      .welcome .actions .button { flex:1; }
      .stats { gap:10px; }
      .stat { padding:14px; }
      .stat-value { font-size:22px; }
      .stat-heading { align-items:flex-start; }
      .stat-icon { width:30px; height:30px; }
      .card-header { padding:16px 15px 10px; }
      .chart-content,.traffic,.activity-list,.quick-actions { padding-left:15px; padding-right:15px; }
      .quick-actions { gap:8px; }
      .quick-action { padding:11px; }
    }
  </style>
</head>
<body>
  <aside class="sidebar" aria-label="Main navigation">
    <div class="brand">
      <div class="brand-icon">N</div>
      <div>NexusIQ<small>ADMIN DASHBOARD</small></div>
    </div>
    <div class="nav-label">Workspace</div>
    <nav class="nav">
      <button class="nav-btn active" data-page="overview"><span>▦</span> Overview</button>
      <button class="nav-btn" data-page="orders"><span>▤</span> Orders <span style="margin-left:auto" class="nav-count" id="navOrderCount">7</span></button>
      <button class="nav-btn" data-page="customers"><span>♙</span> Customers</button>
      <button class="nav-btn" data-page="analytics"><span>◫</span> Analytics</button>
      <button class="nav-btn" data-page="reports"><span>▧</span> Reports</button>
    </nav>
    <div class="nav-label" style="margin-top:22px">Preferences</div>
    <button class="nav-btn" id="sidebarTheme"><span>◐</span> Toggle appearance</button>
    <button class="nav-btn" id="helpButton"><span>ⓘ</span> Help & support</button>
    <div style="margin-top:auto;padding:12px 8px;color:var(--muted);font-size:11px">
      <strong style="color:var(--text)">NexusIQ Admin</strong><br>Standalone demo · Sample data
    </div>
  </aside>
  <div class="overlay" id="overlay"></div>

  <main class="main">
    <header class="topbar">
      <button class="icon-button mobile-menu" id="menuButton" aria-label="Open menu" aria-expanded="false">☰</button>
      <div class="page-title"><h1 id="pageTitle">Overview</h1><p id="pageSubtitle">Here’s what’s happening with your store.</p></div>
      <input class="search" id="searchInput" type="search" placeholder="Search orders or customers…" aria-label="Search orders or customers">
      <button class="icon-button" id="notificationsButton" aria-label="Notifications">♧</button>
      <button class="icon-button" id="themeButton" aria-label="Toggle dark mode">◐</button>
      <div class="avatar" title="Admin profile">AS</div>
    </header>

    <div class="content">
      <section class="page-panel active" id="panel-overview">
        <div class="welcome">
          <div><h2>Welcome back, Admin 👋</h2><p class="muted">Here’s your store performance at a glance.</p></div>
          <div class="actions"><button class="button" id="periodButton">▦ <span id="periodLabel">Last 30 days</span> ▾</button><button class="button primary" id="exportSummary">↓ Export summary</button></div>
        </div>

        <div class="grid stats">
          <article class="card stat"><div class="stat-heading">Total revenue <span class="stat-icon">₹</span></div><div class="stat-value" id="revenueValue">₹8,42,560</div><div class="stat-note"><span class="positive">↗ 12.8%</span> vs previous period</div></article>
          <article class="card stat"><div class="stat-heading">Total orders <span class="stat-icon">▤</span></div><div class="stat-value" id="ordersValue">1,284</div><div class="stat-note"><span class="positive">↗ 8.4%</span> vs previous period</div></article>
          <article class="card stat"><div class="stat-heading">Conversion rate <span class="stat-icon">◉</span></div><div class="stat-value">3.62%</div><div class="stat-note"><span class="positive">↗ 1.2%</span> vs previous period</div></article>
          <article class="card stat"><div class="stat-heading">Active customers <span class="stat-icon">♙</span></div><div class="stat-value" id="activeCustomerValue">5,849</div><div class="stat-note">Based on sample data</div></article>
        </div>

        <div class="grid charts">
          <section class="card">
            <div class="card-header"><div><h3>Revenue overview</h3><p>Revenue and orders over time</p></div><select class="select" id="chartPeriod" aria-label="Chart period"><option value="week">This week</option><option value="month" selected>Last 30 days</option><option value="year">This year</option></select></div>
            <div class="chart-content"><div class="chart-value" id="chartValue">₹8,42,560 <span class="positive" style="font-size:12px">↗ 12.8%</span></div>
              <svg class="chart" viewBox="0 0 640 225" role="img" aria-label="Illustrative revenue and order trend">
                <defs><linearGradient id="fill" x1="0" x2="0" y1="0" y2="1"><stop offset="0%" stop-color="#756cf8" stop-opacity=".25"/><stop offset="100%" stop-color="#756cf8" stop-opacity="0"/></linearGradient></defs>
                <g class="chart-grid"><line x1="45" y1="25" x2="620" y2="25"/><line x1="45" y1="70" x2="620" y2="70"/><line x1="45" y1="115" x2="620" y2="115"/><line x1="45" y1="160" x2="620" y2="160"/></g>
                <g class="chart-label"><text x="1" y="29">₹30k</text><text x="1" y="74">₹20k</text><text x="1" y="119">₹10k</text><text x="19" y="164">₹0</text><text x="45" y="193">01</text><text x="155" y="193">06</text><text x="270" y="193">12</text><text x="380" y="193">18</text><text x="495" y="193">24</text><text x="600" y="193">30</text></g>
                <path d="M45 142 L100 124 L157 130 L215 93 L273 108 L331 76 L389 88 L447 52 L505 69 L563 37 L620 48 L620 160 L45 160 Z" fill="url(#fill)"/>
                <path d="M45 142 L100 124 L157 130 L215 93 L273 108 L331 76 L389 88 L447 52 L505 69 L563 37 L620 48" fill="none" stroke="#756cf8" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M45 151 L100 143 L157 147 L215 127 L273 137 L331 115 L389 121 L447 104 L505 114 L563 95 L620 102" fill="none" stroke="#b5a6ff" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
              <div class="stat-note">● Revenue &nbsp; <span style="color:#b5a6ff">● Orders</span> · Sample chart</div>
            </div>
          </section>
          <section class="card">
            <div class="card-header"><div><h3>Traffic sources</h3><p>Where visitors come from</p></div><button class="text-button" id="trafficDetails">Details ↗</button></div>
            <div class="traffic">
              <div class="traffic-row"><div class="traffic-heading"><span>Direct</span><strong>38.4%</strong></div><div class="progress"><div style="width:38.4%"></div></div></div>
              <div class="traffic-row"><div class="traffic-heading"><span>Organic search</span><strong>29.6%</strong></div><div class="progress"><div style="width:29.6%;opacity:.82"></div></div></div>
              <div class="traffic-row"><div class="traffic-heading"><span>Social media</span><strong>19.2%</strong></div><div class="progress"><div style="width:19.2%;opacity:.68"></div></div></div>
              <div class="traffic-row"><div class="traffic-heading"><span>Referral</span><strong>12.8%</strong></div><div class="progress"><div style="width:12.8%;opacity:.52"></div></div></div>
            </div>
          </section>
        </div>

        <section class="card table-card">
          <div class="card-header"><div><h3>Recent orders</h3><p>Track your latest transactions</p></div><button class="text-button" data-goto="orders">View all →</button></div>
          <div class="table-wrap"><table><thead><tr><th>Order</th><th>Customer</th><th>Date</th><th>Amount</th><th>Status</th><th>Action</th></tr></thead><tbody id="recentOrders"></tbody></table></div>
        </section>

        <div class="grid bottom-grid">
          <section class="card"><div class="card-header"><div><h3>Recent activity</h3><p>Latest store updates</p></div><button class="text-button" id="activityButton">View all</button></div><div class="activity-list" id="activityList">
            <div class="activity-item"><div class="activity-symbol">✓</div><div><strong>Order NX-1048 delivered</strong><small>12 minutes ago · Fulfilment</small></div></div>
            <div class="activity-item"><div class="activity-symbol">♙</div><div><strong>New customer joined</strong><small>38 minutes ago · Customers</small></div></div>
            <div class="activity-item"><div class="activity-symbol">₹</div><div><strong>Payment received</strong><small>1 hour ago · Payments</small></div></div>
          </div></section>
          <section class="card"><div class="card-header"><div><h3>Quick actions</h3><p>Common tasks in one place</p></div></div><div class="quick-actions">
            <button class="quick-action" id="createOrder"><span>＋</span><strong>Create an order</strong><small>Add a sample sale</small></button>
            <button class="quick-action" id="createCustomer"><span>♙</span><strong>Add a customer</strong><small>Manage your customer list</small></button>
            <button class="quick-action" id="openReports"><span>▧</span><strong>Generate report</strong><small>Export CSV data</small></button>
            <button class="quick-action" id="openSettings"><span>⚙</span><strong>Dashboard settings</strong><small>Change appearance</small></button>
          </div></section>
        </div>
      </section>

      <section class="page-panel" id="panel-orders">
        <div class="welcome"><div><h2>Orders</h2><p class="muted">Search, filter, and review transactions.</p></div><button class="button primary" id="ordersExport">↓ Export orders</button></div>
        <section class="card table-card"><div class="card-header"><div><h3>All orders</h3><p id="orderCount">Orders in sample data</p></div><select class="select" id="statusFilter" aria-label="Filter order status"><option value="all">All statuses</option><option>Paid</option><option>Pending</option><option>Delivered</option><option>Cancelled</option></select></div><div class="table-wrap"><table><thead><tr><th>Order</th><th>Customer</th><th>Date</th><th>Amount</th><th>Status</th><th>Action</th></tr></thead><tbody id="allOrders"></tbody></table></div><div id="ordersEmpty" class="empty hidden">No orders match your search.</div></section>
      </section>

      <section class="page-panel" id="panel-customers">
        <div class="welcome"><div><h2>Customers</h2><p class="muted">Keep customer information organized.</p></div><button class="button primary" id="addCustomerPage">＋ Add customer</button></div>
        <section class="card table-card"><div class="card-header"><div><h3>Customer directory</h3><p>Customer records in this demo</p></div></div><div class="table-wrap"><table><thead><tr><th>Customer</th><th>Orders</th><th>Total spent</th><th>Last order</th></tr></thead><tbody id="customerRows"></tbody></table></div></section>
      </section>

      <section class="page-panel" id="panel-analytics">
        <div class="welcome"><div><h2>Analytics</h2><p class="muted">Understand the trends behind your store performance.</p></div><button class="button primary" id="analyticsExport">↓ Export analytics</button></div>
        <div class="grid stats">
          <article class="card stat"><div class="stat-heading">Average order value</div><div class="stat-value">₹656</div><div class="stat-note">Across demo orders</div></article>
          <article class="card stat"><div class="stat-heading">Returning customers</div><div class="stat-value">42.7%</div><div class="stat-note">Sample metric</div></article>
          <article class="card stat"><div class="stat-heading">Refund rate</div><div class="stat-value">1.8%</div><div class="stat-note">Sample metric</div></article>
          <article class="card stat"><div class="stat-heading">Cart abandonment</div><div class="stat-value">24.3%</div><div class="stat-note">Sample metric</div></article>
        </div>
        <section class="card"><div class="card-header"><div><h3>Performance notes</h3><p>Illustrative observations from sample data</p></div></div><div class="activity-list"><div class="activity-item"><div class="activity-symbol">↗</div><div><strong>Revenue is trending upward.</strong><small>Compare against live data before making decisions.</small></div></div><div class="activity-item"><div class="activity-symbol">◎</div><div><strong>Direct visits are the largest traffic source.</strong><small>Consider comparing conversion rates by channel.</small></div></div></div></section>
      </section>

      <section class="page-panel" id="panel-reports">
        <div class="welcome"><div><h2>Reports</h2><p class="muted">Export dashboard sample data as CSV files.</p></div></div>
        <div class="grid" style="grid-template-columns:repeat(auto-fit,minmax(230px,1fr))">
          <section class="card stat"><div class="stat-icon">▤</div><h3>Orders report</h3><p class="muted">Order number, customer, date, amount, and status.</p><button class="button primary" id="reportOrders">Download CSV</button></section>
          <section class="card stat"><div class="stat-icon">♙</div><h3>Customers report</h3><p class="muted">Customer name, email, order count, and spending.</p><button class="button primary" id="reportCustomers">Download CSV</button></section>
          <section class="card stat"><div class="stat-icon">₹</div><h3>Summary report</h3><p class="muted">Key metrics shown in this demo.</p><button class="button primary" id="reportSummary">Download CSV</button></section>
        </div>
      </section>
    </div>
  </main>

  <div class="toast-area" id="toastArea" aria-live="polite"></div>
  <div class="modal-backdrop" id="modalBackdrop" role="dialog" aria-modal="true" aria-labelledby="modalTitle">
    <div class="modal"><div class="modal-header"><h3 id="modalTitle">Details</h3><button class="icon-button" id="modalClose" aria-label="Close dialog">×</button></div><div id="modalBody"></div><div class="modal-actions" id="modalActions"></div></div>
  </div>

<script>
(() => {
  "use strict";
  const $ = (selector, root = document) => root.querySelector(selector);
  const $$ = (selector, root = document) => [...root.querySelectorAll(selector)];
  const money = value => new Intl.NumberFormat("en-IN", {style:"currency", currency:"INR", maximumFractionDigits:0}).format(value);
  const safe = value => String(value ?? "").replace(/[&<>"']/g, ch => ({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;"}[ch]));

  let orders = [
    {id:"NX-1048",name:"Priya Sharma",email:"priya@example.com",initials:"PS",date:"13 Oct 2026",amount:12499,status:"Delivered"},
    {id:"NX-1047",name:"Rahul Verma",email:"rahul@example.com",initials:"RV",date:"13 Oct 2026",amount:8299,status:"Paid"},
    {id:"NX-1046",name:"Ananya Reddy",email:"ananya@example.com",initials:"AR",date:"12 Oct 2026",amount:4599,status:"Pending"},
    {id:"NX-1045",name:"Karthik Rao",email:"karthik@example.com",initials:"KR",date:"12 Oct 2026",amount:2199,status:"Cancelled"},
    {id:"NX-1044",name:"Meera Iyer",email:"meera@example.com",initials:"MI",date:"11 Oct 2026",amount:6799,status:"Delivered"},
    {id:"NX-1043",name:"Arjun Nair",email:"arjun@example.com",initials:"AN",date:"10 Oct 2026",amount:1399,status:"Paid"},
    {id:"NX-1042",name:"Sneha Das",email:"sneha@example.com",initials:"SD",date:"09 Oct 2026",amount:3499,status:"Pending"}
  ];
  let customers = [
    {name:"Priya Sharma",email:"priya@example.com",initials:"PS",count:4,spent:38450,last:"13 Oct 2026"},
    {name:"Rahul Verma",email:"rahul@example.com",initials:"RV",count:3,spent:22490,last:"13 Oct 2026"},
    {name:"Ananya Reddy",email:"ananya@example.com",initials:"AR",count:2,spent:9180,last:"12 Oct 2026"},
    {name:"Karthik Rao",email:"karthik@example.com",initials:"KR",count:5,spent:16700,last:"12 Oct 2026"},
    {name:"Meera Iyer",email:"meera@example.com",initials:"MI",count:6,spent:54200,last:"11 Oct 2026"},
    {name:"Arjun Nair",email:"arjun@example.com",initials:"AN",count:1,spent:1399,last:"10 Oct 2026"}
  ];
  let searchTerm = "";
  let nextOrder = 1049;

  const statusClass = status => ({Paid:"paid",Delivered:"delivered",Pending:"pending",Cancelled:"cancelled"}[status] || "pending");
  function row(order) {
    return `<tr><td><strong>${safe(order.id)}</strong></td><td><div class="customer"><div class="customer-icon">${safe(order.initials)}</div><div><strong>${safe(order.name)}</strong><small>${safe(order.email)}</small></div></div></td><td>${safe(order.date)}</td><td><strong>${money(order.amount)}</strong></td><td><span class="status ${statusClass(order.status)}">${safe(order.status)}</span></td><td><button class="text-button" data-order="${safe(order.id)}">View details</button></td></tr>`;
  }
  function render() {
    const status = $("#statusFilter")?.value || "all";
    const filtered = orders.filter(o => `${o.id} ${o.name} ${o.email} ${o.status}`.toLowerCase().includes(searchTerm) && (status === "all" || o.status.toLowerCase() === status.toLowerCase()));
    $("#recentOrders").innerHTML = orders.slice(0,5).map(row).join("");
    $("#allOrders").innerHTML = filtered.map(row).join("");
    $("#ordersEmpty").classList.toggle("hidden", filtered.length > 0);
    $("#orderCount").textContent = `${filtered.length} order${filtered.length === 1 ? "" : "s"} shown`;
    $("#navOrderCount").textContent = orders.length;
    $("#customerRows").innerHTML = customers.filter(c => `${c.name} ${c.email}`.toLowerCase().includes(searchTerm)).map(c =>
      `<tr><td><div class="customer"><div class="customer-icon">${safe(c.initials)}</div><div><strong>${safe(c.name)}</strong><small>${safe(c.email)}</small></div></div></td><td>${c.count}</td><td><strong>${money(c.spent)}</strong></td><td>${safe(c.last)}</td></tr>`
    ).join("");
  }
  function notify(message) {
    const el = document.createElement("div"); el.className = "toast"; el.textContent = message;
    $("#toastArea").append(el); setTimeout(() => el.remove(), 3200);
  }
  function closeModal() { $("#modalBackdrop").classList.remove("show"); }
  function modal(title, html, actions = '<button class="button" id="cancelModal">Close</button>') {
    $("#modalTitle").textContent = title; $("#modalBody").innerHTML = html; $("#modalActions").innerHTML = actions;
    $("#modalBackdrop").classList.add("show");
    $("#modalClose").focus();
    $("#cancelModal")?.addEventListener("click", closeModal);
  }
  function navigate(page) {
    $$(".nav-btn[data-page]").forEach(btn => btn.classList.toggle("active", btn.dataset.page === page));
    $$(".page-panel").forEach(panel => panel.classList.toggle("active", panel.id === `panel-${page}`));
    const title = {overview:["Overview","Here’s what’s happening with your store."],orders:["Orders","Review and manage transactions."],customers:["Customers","Keep customer information organized."],analytics:["Analytics","Understand your store performance."],reports:["Reports","Download summaries from demo data."]}[page];
    $("#pageTitle").textContent = title[0]; $("#pageSubtitle").textContent = title[1];
    document.body.classList.remove("menu-open"); $("#menuButton").setAttribute("aria-expanded","false");
    window.scrollTo({top:0,behavior:"smooth"});
  }
  function csvDownload(filename, rows) {
    const content = rows.map(r => r.map(v => `"${String(v ?? "").replace(/"/g,'""')}"`).join(",")).join("\r\n");
    const url = URL.createObjectURL(new Blob(["\uFEFF"+content], {type:"text/csv;charset=utf-8;"}));
    const a = document.createElement("a"); a.href = url; a.download = filename; document.body.append(a); a.click(); a.remove(); URL.revokeObjectURL(url);
    notify(`${filename} downloaded.`);
  }
  function exportOrders() { csvDownload("nexusiq-orders.csv", [["Order ID","Customer","Email","Date","Amount INR","Status"],...orders.map(o => [o.id,o.name,o.email,o.date,o.amount,o.status])]); }
  function exportCustomers() { csvDownload("nexusiq-customers.csv", [["Name","Email","Orders","Total spent INR","Last order"],...customers.map(c => [c.name,c.email,c.count,c.spent,c.last])]); }
  function exportSummary() { csvDownload("nexusiq-summary.csv", [["Metric","Value"],["Total revenue","842560"],["Total orders","1284"],["Conversion rate","3.62%"],["Active customers","5849"]]); }

  function viewOrder(id) {
    const o = orders.find(item => item.id === id); if (!o) return;
    modal(`Order ${o.id}`, `<div class="customer"><div class="customer-icon">${safe(o.initials)}</div><div><strong>${safe(o.name)}</strong><small>${safe(o.email)}</small></div></div>
      <div class="field"><label>Order date</label><div>${safe(o.date)}</div></div><div class="field"><label>Amount</label><strong>${money(o.amount)}</strong></div>
      <div class="field"><label>Status</label><span class="status ${statusClass(o.status)}">${safe(o.status)}</span></div>
      <p class="muted">Demo record only. No real payment is connected.</p>`,
      '<button class="button" id="cancelModal">Close</button><button class="button primary" id="nextStatus">Change status</button>');
    $("#nextStatus").addEventListener("click", () => {
      const statuses = ["Pending","Paid","Delivered","Cancelled"];
      o.status = statuses[(statuses.indexOf(o.status)+1) % statuses.length];
      render(); closeModal(); notify(`${o.id} status changed to ${o.status}.`);
    });
  }
  function addCustomer() {
    modal("Add customer", `<p class="muted">Add a sample customer to this dashboard.</p><form id="customerForm"><div class="field"><label for="customerName">Full name</label><input id="customerName" name="name" required maxlength="80" placeholder="e.g. Kavya Rao"></div><div class="field"><label for="customerEmail">Email address</label><input id="customerEmail" name="email" type="email" required maxlength="120" placeholder="name@example.com"></div></form>`,
      '<button class="button" id="cancelModal">Cancel</button><button class="button primary" id="saveCustomer">Save customer</button>');
    $("#saveCustomer").addEventListener("click", () => {
      const form = $("#customerForm"); if (!form.reportValidity()) return;
      const data = new FormData(form), name = data.get("name").trim(), email = data.get("email").trim();
      if (customers.some(c => c.email.toLowerCase() === email.toLowerCase())) { notify("That email is already registered."); return; }
      const initials = name.split(/\s+/).map(part => part[0]).join("").slice(0,2).toUpperCase();
      customers.unshift({name,email,initials,count:0,spent:0,last:"—"});
      closeModal(); render(); notify(`${name} added to the sample customer list.`);
      $("#activityList").insertAdjacentHTML("afterbegin", `<div class="activity-item"><div class="activity-symbol">♙</div><div><strong>New customer added</strong><small>${safe(name)} · Just now</small></div></div>`);
    });
  }
  function addOrder() {
    if (!customers.length) { notify("Add a customer before creating an order."); return; }
    modal("Create order", `<p class="muted">This creates a sample order only. No payment will be processed.</p><form id="orderForm"><div class="field"><label for="orderCustomer">Customer</label><select id="orderCustomer" name="customer" required>${customers.map(c => `<option value="${safe(c.email)}">${safe(c.name)}</option>`).join("")}</select></div><div class="field"><label for="orderAmount">Amount (₹)</label><input id="orderAmount" name="amount" type="number" min="1" max="10000000" required placeholder="Enter amount"></div><div class="field"><label for="orderStatus">Status</label><select id="orderStatus" name="status"><option>Pending</option><option>Paid</option><option>Delivered</option></select></div></form>`,
      '<button class="button" id="cancelModal">Cancel</button><button class="button primary" id="saveOrder">Create order</button>');
    $("#saveOrder").addEventListener("click", () => {
      const form = $("#orderForm"); if (!form.reportValidity()) return;
      const data = new FormData(form), customer = customers.find(c => c.email === data.get("customer")), amount = Number(data.get("amount"));
      if (!customer || !Number.isFinite(amount) || amount <= 0) { notify("Enter valid order details."); return; }
      const id = `NX-${nextOrder++}`, date = new Date().toLocaleDateString("en-GB",{day:"2-digit",month:"short",year:"numeric"});
      orders.unshift({id,name:customer.name,email:customer.email,initials:customer.initials,date,amount,status:data.get("status")});
      customer.count++; customer.spent += amount; customer.last = date;
      closeModal(); render(); notify(`${id} created. No payment was processed.`);
      $("#activityList").insertAdjacentHTML("afterbegin", `<div class="activity-item"><div class="activity-symbol">＋</div><div><strong>New order ${safe(id)}</strong><small>${safe(customer.name)} · Just now</small></div></div>`);
    });
  }

  $$(".nav-btn[data-page]").forEach(btn => btn.addEventListener("click", () => navigate(btn.dataset.page)));
  $$("[data-goto]").forEach(btn => btn.addEventListener("click", () => navigate(btn.dataset.goto)));
  document.addEventListener("click", event => {
    const button = event.target.closest("[data-order]");
    if (button) viewOrder(button.dataset.order);
  });
  $("#searchInput").addEventListener("input", event => { searchTerm = event.target.value.trim().toLowerCase(); render(); });
  $("#statusFilter").addEventListener("change", render);
  $("#menuButton").addEventListener("click", () => {
    const open = document.body.classList.toggle("menu-open");
    $("#menuButton").setAttribute("aria-expanded", String(open));
  });
  $("#overlay").addEventListener("click", () => { document.body.classList.remove("menu-open"); $("#menuButton").setAttribute("aria-expanded","false"); });
  function toggleTheme() {
    document.body.classList.toggle("dark");
    const mode = document.body.classList.contains("dark") ? "dark" : "light";
    try { localStorage.setItem("nexusiq-theme", mode); } catch (_) {}
    notify(`${mode === "dark" ? "Dark" : "Light"} mode enabled.`);
  }
  try { if (localStorage.getItem("nexusiq-theme") === "dark") document.body.classList.add("dark"); } catch (_) {}
  $("#themeButton").addEventListener("click", toggleTheme);
  $("#sidebarTheme").addEventListener("click", toggleTheme);
  $("#modalClose").addEventListener("click", closeModal);
  $("#modalBackdrop").addEventListener("click", event => { if (event.target === $("#modalBackdrop")) closeModal(); });
  document.addEventListener("keydown", event => { if (event.key === "Escape") { closeModal(); document.body.classList.remove("menu-open"); } });

  $("#exportSummary").addEventListener("click", exportSummary);
  $("#ordersExport").addEventListener("click", exportOrders);
  $("#analyticsExport").addEventListener("click", exportSummary);
  $("#reportOrders").addEventListener("click", exportOrders);
  $("#reportCustomers").addEventListener("click", exportCustomers);
  $("#reportSummary").addEventListener("click", exportSummary);
  $("#openReports").addEventListener("click", () => navigate("reports"));
  $("#createOrder").addEventListener("click", addOrder);
  $("#createCustomer").addEventListener("click", addCustomer);
  $("#addCustomerPage").addEventListener("click", addCustomer);
  $("#openSettings").addEventListener("click", () => modal("Dashboard settings", `<p class="muted">Choose how the dashboard looks on this device.</p><div class="field"><label for="themeChoice">Appearance</label><select id="themeChoice"><option value="light">Light</option><option value="dark">Dark</option></select></div>`,
    '<button class="button" id="cancelModal">Cancel</button><button class="button primary" id="saveTheme">Save settings</button>'));
  document.addEventListener("click", event => {
    if (event.target.id === "saveTheme") {
      const dark = $("#themeChoice").value === "dark";
      document.body.classList.toggle("dark", dark);
      try { localStorage.setItem("nexusiq-theme", dark ? "dark" : "light"); } catch (_) {}
      closeModal(); notify("Appearance settings saved.");
    }
  });
  $("#helpButton").addEventListener("click", () => modal("Help & support", "<p>This is a standalone dashboard demo.</p><p>• Use the sidebar to change sections.<br>• Search orders and customers from the top bar.<br>• Download CSV reports from Reports.<br>• Use Quick actions to create sample records.</p><p class='muted'>This page is not connected to a live database or payment gateway.</p>"));
  $("#notificationsButton").addEventListener("click", () => modal("Notifications", "<p><strong>Recent updates</strong></p><p>• Order NX-1048 was delivered.<br>• A new customer joined your store.<br>• A payment was received.</p><p class='muted'>These are illustrative demo notifications.</p>"));
  $("#trafficDetails").addEventListener("click", () => modal("Traffic source details", "<p>Direct: 38.4% · Organic search: 29.6% · Social media: 19.2% · Referral: 12.8%</p><p class='muted'>Connect a real analytics source before using these figures for business decisions.</p>"));
  $("#activityButton").addEventListener("click", () => modal("Recent activity", "<p>Activity includes sample order, customer, and payment updates.</p><p class='muted'>Activity history is not stored on a server in this demo.</p>"));
  $("#periodButton").addEventListener("click", () => {
    const options = ["Last 7 days","Last 30 days","Last 90 days","This year"];
    const current = $("#periodLabel").textContent;
    const next = options[(options.indexOf(current)+1) % options.length];
    $("#periodLabel").textContent = next;
    $("#chartPeriod").value = next === "Last 7 days" ? "week" : next === "This year" ? "year" : "month";
    notify(`Selected ${next}. Metrics are sample data.`);
  });
  $("#chartPeriod").addEventListener("change", event => {
    const labels = {week:"Last 7 days",month:"Last 30 days",year:"This year"};
    $("#periodLabel").textContent = labels[event.target.value];
    notify(`Selected ${labels[event.target.value]}. Chart is illustrative.`);
  });
  render();
})();
</script>
</body>
</html>
