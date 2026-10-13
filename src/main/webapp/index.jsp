<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="theme-color" content="#0a1020">
<title>NexusIQ — Admin Command Center</title>

<style>
:root {
  --bg:#0a1020;
  --surface:rgba(21,30,53,.78);
  --solid:#151e35;
  --text:#f0f4ff;
  --muted:#94a2c0;
  --line:rgba(158,180,235,.15);
  --cyan:#58e2f5;
  --violet:#9c7cff;
  --green:#55e2ae;
  --pink:#ff80be;
  --amber:#ffc76c;
  --shadow:0 20px 60px #0003;
}

body.light {
  --bg:#edf1fb;
  --surface:rgba(255,255,255,.82);
  --solid:#fff;
  --text:#17213a;
  --muted:#66728d;
  --line:rgba(70,91,140,.16);
  --shadow:0 18px 50px #344c8118;
}

* { box-sizing:border-box; }

body {
  margin:0;
  background:
    radial-gradient(ellipse at 10% 0%,#6759ff20,transparent 35%),
    radial-gradient(ellipse at 90% 15%,#35d9f21a,transparent 30%),
    var(--bg);
  color:var(--text);
  font:14px/1.5 Inter,system-ui,-apple-system,"Segoe UI",sans-serif;
  transition:background .25s,color .25s;
}

button,input,select { font:inherit; }
button { cursor:pointer;color:inherit; }

.sidebar {
  position:fixed;
  inset:0 auto 0 0;
  width:238px;
  padding:24px 16px;
  border-right:1px solid var(--line);
  background:var(--surface);
  backdrop-filter:blur(22px);
  z-index:10;
  display:flex;
  flex-direction:column;
  transition:transform .3s;
}

.brand {
  display:flex;
  gap:11px;
  align-items:center;
  padding:0 9px 30px;
  color:var(--text);
  text-decoration:none;
}

.mark {
  height:40px;
  width:40px;
  border-radius:14px;
  background:linear-gradient(135deg,var(--cyan),var(--violet));
  display:grid;
  place-items:center;
  color:#071326;
  font-size:22px;
  font-weight:900;
  box-shadow:0 8px 24px #6584ff40;
}

.brand strong { font-size:17px;letter-spacing:-.5px; }
.brand strong span { color:var(--cyan); }
.sub { font-size:10px;letter-spacing:1.6px;color:var(--muted);text-transform:uppercase; }

.nav-label {
  font-size:10px;
  text-transform:uppercase;
  letter-spacing:1.6px;
  color:var(--muted);
  padding:10px 13px;
}

.nav { display:grid;gap:5px; }

.nav button {
  border:1px solid transparent;
  background:none;
  text-align:left;
  color:var(--muted);
  padding:11px 13px;
  border-radius:12px;
  display:flex;
  align-items:center;
  gap:12px;
  transition:.2s;
}

.nav button:hover,.nav button.active {
  background:linear-gradient(100deg,#58e2f51a,#9c7cff18);
  color:var(--text);
  border-color:#58e2f525;
  transform:translateX(2px);
}

.nav .ico { font-size:17px;width:19px;text-align:center; }

.count {
  margin-left:auto;
  color:var(--pink);
  background:#ff80be1b;
  border-radius:7px;
  padding:2px 7px;
  font-size:10px;
}

.workspace {
  margin-top:auto;
  border:1px solid var(--line);
  background:var(--surface);
  border-radius:16px;
  padding:14px;
  margin-bottom:15px;
}

.workhead { display:flex;gap:9px;align-items:center; }
.workicon {
  width:32px;height:32px;border-radius:10px;
  background:linear-gradient(135deg,#ffbd70,#ff80be);
  display:grid;place-items:center;color:#251128;
}

.workspace small,.user small { color:var(--muted); }
.usage { display:flex;justify-content:space-between;color:var(--muted);font-size:10px;margin-top:14px; }
.progress { height:5px;background:var(--line);border-radius:9px;margin-top:7px;overflow:hidden; }
.progress span { display:block;width:68%;height:100%;background:linear-gradient(90deg,var(--cyan),var(--violet)); }

.user {
  display:flex;align-items:center;gap:10px;
  border-top:1px solid var(--line);padding:13px 6px 0;
}

.avatar {
  width:36px;height:36px;border-radius:50%;
  background:linear-gradient(135deg,#637bff,#c16cff);
  display:grid;place-items:center;color:white;font-weight:800;flex:none;
}

.user small { display:block; }
.more { margin-left:auto;border:0;background:none;color:var(--muted);font-size:19px; }

main { margin-left:238px;padding:0 30px 34px;max-width:1800px; }

.topbar {
  height:78px;
  border-bottom:1px solid var(--line);
  display:flex;align-items:center;justify-content:space-between;
  margin-bottom:26px;
}

.crumb { font-size:12px;color:var(--muted); }
.crumb b { color:var(--text); }
.actions { display:flex;align-items:center;gap:9px; }

.iconbtn,.btn,.select {
  border:1px solid var(--line);
  background:var(--surface);
  border-radius:11px;
  color:var(--text);
  padding:10px 12px;
  transition:.2s;
}

.iconbtn {
  width:39px;height:39px;
  display:grid;place-items:center;
  position:relative;
}

.iconbtn:hover,.btn:hover {
  transform:translateY(-2px);
  border-color:#58e2f577;
}

.dot {
  position:absolute;right:7px;top:7px;
  width:6px;height:6px;border-radius:50%;
  background:var(--pink);
}

.search { position:relative; }
.search input {
  width:220px;
  padding:10px 12px 10px 35px;
  background:var(--surface);
  border:1px solid var(--line);
  border-radius:11px;
  color:var(--text);
  outline:none;
  transition:.2s;
}
.search input:focus { width:255px;border-color:var(--cyan); }
.search span { position:absolute;left:12px;top:8px;color:var(--muted);font-size:19px; }
.mobile { display:none; }

.heading {
  display:flex;align-items:flex-end;justify-content:space-between;
  gap:18px;margin-bottom:22px;
}

.eyebrow {
  color:var(--cyan);font-size:10px;letter-spacing:1.8px;
  text-transform:uppercase;font-weight:800;margin-bottom:7px;
}

h1 { font-size:clamp(25px,3vw,34px);letter-spacing:-1.2px;line-height:1.15;margin:0; }
.heading p { margin:8px 0 0;color:var(--muted);font-size:13px; }
.head-actions { display:flex;align-items:center;gap:8px; }
.select { font-size:12px; }
.btn { font-size:12px;font-weight:700; }

.primary {
  background:linear-gradient(110deg,var(--cyan),var(--violet));
  border:0;color:#091327;
  box-shadow:0 8px 24px #708aff2b;
}

.grid { display:grid;gap:16px; }
.metrics { grid-template-columns:repeat(4,minmax(0,1fr));margin-bottom:16px; }

.panel {
  min-width:0;
  background:var(--surface);
  border:1px solid var(--line);
  border-radius:21px;
  backdrop-filter:blur(18px);
  box-shadow:var(--shadow);
  animation:rise .5s both;
  transition:border-color .25s,transform .25s;
}

.panel:hover { border-color:#8cb9ff42; }

.metric { padding:18px;position:relative;overflow:hidden; }
.metric:after {
  content:"";position:absolute;right:-35px;top:-45px;
  width:95px;height:95px;border-radius:50%;
  background:var(--glow,#58e2f51c);filter:blur(5px);
}

.metric-top {
  display:flex;align-items:center;justify-content:space-between;
  color:var(--muted);font-size:12px;position:relative;z-index:1;
}

.metric-icon {
  width:32px;height:32px;border-radius:10px;
  background:var(--iconbg,#58e2f51c);
  color:var(--iconcolor,var(--cyan));
  display:grid;place-items:center;font-size:16px;
}

.value {
  font-size:clamp(22px,2vw,28px);
  font-weight:850;letter-spacing:-1px;
  margin:14px 0 4px;position:relative;z-index:1;
}

.metric-foot { display:flex;align-items:center;gap:6px;color:var(--muted);font-size:10px; }
.up { color:var(--green);font-weight:800; }
.down { color:var(--pink);font-weight:800; }
.spark { margin-left:auto;width:60px;height:23px; }

.middle { grid-template-columns:minmax(0,1.65fr) minmax(270px,.9fr);margin-bottom:16px; }
.lower { grid-template-columns:minmax(0,1.4fr) minmax(270px,.85fr); }

.panel-head {
  display:flex;align-items:center;justify-content:space-between;
  gap:10px;padding:19px 20px 0;
}

.panel-title { font-size:14px;font-weight:800; }
.panel-sub { font-size:11px;color:var(--muted);margin-top:3px; }

.range {
  border:0;background:none;color:var(--muted);
  padding:6px 9px;border-radius:8px;font-size:10px;font-weight:800;
}
.range.active { color:var(--cyan);background:#58e2f51b; }

.summary { display:flex;align-items:baseline;gap:9px;margin:7px 0 0; }
.summary strong { font-size:24px;letter-spacing:-.8px; }
.summary span { font-size:11px;color:var(--green); }

.chart-wrap { padding:12px 15px 15px; }
.chart { width:100%;height:210px;display:block;overflow:visible; }
.chart text { fill:var(--muted);font-size:10px; }
.chart .gridline { stroke:var(--line);stroke-dasharray:3 5; }
.chart .line {
  fill:none;stroke:var(--cyan);stroke-width:3;
  stroke-linecap:round;stroke-linejoin:round;
  filter:drop-shadow(0 4px 6px #58e2f533);
}
.chart .line2 {
  fill:none;stroke:var(--violet);stroke-width:2.5;
  stroke-linecap:round;stroke-linejoin:round;
}

.legend {
  display:flex;justify-content:center;gap:18px;
  color:var(--muted);font-size:10px;
}
.legend i {
  display:inline-block;width:7px;height:7px;
  border-radius:50%;background:var(--cyan);margin-right:6px;
}
.legend i.v { background:var(--violet); }

.channels { padding:16px 20px 20px;display:grid;gap:16px; }
.channel {
  display:grid;grid-template-columns:34px 1fr auto;
  align-items:center;gap:10px;
}
.channel-icon {
  width:34px;height:34px;border-radius:11px;
  background:#9c7cff20;color:var(--violet);
  display:grid;place-items:center;
}
.channel:nth-child(2) .channel-icon { background:#58e2f51b;color:var(--cyan); }
.channel:nth-child(3) .channel-icon { background:#55e2ae1b;color:var(--green); }
.channel:nth-child(4) .channel-icon { background:#ff80be1b;color:var(--pink); }
.channel-name { font-size:12px;font-weight:750; }
.channel-meta { font-size:10px;color:var(--muted);margin-top:2px; }
.channel-val { font-size:12px;font-weight:800;text-align:right; }
.channel-change { font-size:10px;color:var(--green);text-align:right;margin-top:2px; }

.table-wrap { overflow:auto;padding:8px 18px 16px; }
table { border-collapse:collapse;width:100%;white-space:nowrap; }
th {
  text-align:left;color:var(--muted);font-size:10px;
  text-transform:uppercase;letter-spacing:.7px;
  padding:13px 9px;border-bottom:1px solid var(--line);
}
td { padding:13px 9px;font-size:11px;border-bottom:1px solid var(--line); }
tbody tr { transition:background .2s; }
tbody tr:hover { background:var(--surface); }
tbody tr:last-child td { border:0; }

.customer { display:flex;align-items:center;gap:8px;font-weight:700; }
.mini {
  width:28px;height:28px;border-radius:9px;
  background:linear-gradient(135deg,#617dff,#bd78ff);
  color:#fff;display:grid;place-items:center;font-size:10px;font-weight:800;
}
.mini.orange { background:linear-gradient(135deg,#ffbd70,#ff80be); }
.mini.green { background:linear-gradient(135deg,#48dcb1,#42b9dc); }
.mini.blue { background:linear-gradient(135deg,#50d5f2,#6278ff); }

.status {
  display:inline-flex;align-items:center;gap:5px;
  padding:4px 8px;border-radius:7px;font-size:10px;font-weight:800;
}
.status:before { content:"";width:5px;height:5px;border-radius:50%;background:currentColor; }
.paid { color:var(--green);background:#55e2ae19; }
.pending { color:var(--amber);background:#ffc76c1b; }
.failed { color:var(--pink);background:#ff80be1b; }

.view { border:0;background:none;color:var(--cyan);font-weight:800;font-size:11px; }
.empty { display:none;padding:24px;text-align:center;color:var(--muted); }

.activity-list { padding:18px 20px 20px;display:grid;gap:17px; }
.activity { display:grid;grid-template-columns:34px 1fr;gap:10px;position:relative; }
.activity:not(:last-child):after {
  content:"";position:absolute;left:16px;top:36px;bottom:-14px;
  width:1px;background:var(--line);
}
.activity-icon {
  width:34px;height:34px;border-radius:11px;
  display:grid;place-items:center;background:#58e2f51b;color:var(--cyan);
}
.activity:nth-child(2) .activity-icon { background:#9c7cff20;color:var(--violet); }
.activity:nth-child(3) .activity-icon { background:#55e2ae1b;color:var(--green); }
.activity:nth-child(4) .activity-icon { background:#ff80be1b;color:var(--pink); }
.activity p { margin:2px 0 4px;font-size:11px; }
.activity time { font-size:10px;color:var(--muted); }

.toast {
  position:fixed;right:22px;bottom:22px;
  background:var(--solid);border:1px solid #58e2f555;
  border-radius:13px;padding:13px 17px;box-shadow:var(--shadow);
  z-index:50;opacity:0;transform:translateY(12px);
  pointer-events:none;transition:.25s;
}
.toast.show { opacity:1;transform:translateY(0); }

.modal-bg {
  position:fixed;inset:0;z-index:40;background:#030713aa;
  backdrop-filter:blur(8px);display:none;place-items:center;padding:18px;
}
.modal-bg.open { display:grid;animation:fade .2s; }
.modal {
  width:min(430px,100%);padding:23px;background:var(--solid);
  border:1px solid var(--line);border-radius:20px;
  box-shadow:var(--shadow);animation:rise .25s;
}
.modal-head { display:flex;justify-content:space-between;align-items:center; }
.modal h2 { font-size:19px;margin:0; }
.field { display:grid;gap:6px;margin-top:15px; }
.field label { font-size:11px;color:var(--muted);font-weight:750; }
.field input,.field select {
  padding:11px;border:1px solid var(--line);
  background:var(--bg);color:var(--text);
  border-radius:10px;outline:none;width:100%;
}
.field input:focus,.field select:focus { border-color:var(--cyan); }
.modal-actions { display:flex;justify-content:flex-end;gap:8px;margin-top:20px; }
.close {
  width:31px;height:31px;border:1px solid var(--line);
  border-radius:9px;background:var(--surface);
}
.mobile-overlay { display:none; }

@keyframes rise {
  from { opacity:0;transform:translateY(13px); }
  to { opacity:1;transform:translateY(0); }
}
@keyframes fade { from { opacity:0; } to { opacity:1; } }
@keyframes pulse { 50% { box-shadow:0 0 0 7px #58e2f500; } }

.metrics .panel:nth-child(2) { animation-delay:.06s; }
.metrics .panel:nth-child(3) { animation-delay:.12s; }
.metrics .panel:nth-child(4) { animation-delay:.18s; }
.middle .panel:nth-child(2),.lower .panel:nth-child(2) { animation-delay:.1s; }

@media(max-width:1150px) {
  .sidebar { width:215px; }
  main { margin-left:215px;padding:0 22px 30px; }
  .metrics { grid-template-columns:repeat(2,minmax(0,1fr)); }
}

@media(max-width:850px) {
  .sidebar { width:255px;transform:translateX(-105%); }
  .sidebar.open { transform:translateX(0); }
  .mobile-overlay.show {
    display:block;position:fixed;inset:0;background:#03071399;z-index:9;
  }
  main { margin-left:0;padding:0 20px 28px; }
  .mobile { display:grid; }
  .middle,.lower { grid-template-columns:1fr; }
  .search input { width:180px; }
  .search input:focus { width:210px; }
}

@media(max-width:560px) {
  main { padding:0 13px 24px; }
  .topbar { height:68px;margin-bottom:21px; }
  .crumb,.search { display:none; }
  .heading { align-items:flex-start;flex-direction:column; }
  .head-actions { width:100%; }
  .head-actions .primary { margin-left:auto; }
  .metrics { gap:10px; }
  .metric { padding:13px; }
  .metric-top { font-size:10px; }
  .metric-icon { width:28px;height:28px; }
  .value { font-size:22px;margin-top:11px; }
  .metric-foot { font-size:9px;flex-wrap:wrap; }
  .spark { display:none; }
  .panel-head { padding:16px 15px 0; }
  .chart-wrap { padding:10px 7px; }
  .chart { height:180px; }
  .channels,.activity-list { padding:16px 15px; }
  .table-wrap { padding:8px 10px 13px; }
  .actions { gap:6px; }
  .iconbtn { width:35px;height:35px; }
  .select { max-width:130px; }
  .heading p { font-size:12px; }
}

@media(prefers-reduced-motion:reduce) {
  *,*:before,*:after {
    animation-duration:.01ms!important;
    transition-duration:.01ms!important;
    scroll-behavior:auto!important;
  }
}
</style>
</head>

<body>
<div class="mobile-overlay" id="overlay"></div>

<aside class="sidebar" id="sidebar">
  <a class="brand" href="#">
    <div class="mark">N</div>
    <div>
      <strong>Nexus<span>IQ</span></strong>
      <div class="sub">Command center</div>
    </div>
  </a>

  <div class="nav-label">Workspace</div>
  <nav class="nav" aria-label="Workspace">
    <button class="active" data-page="Overview"><span class="ico">◈</span>Overview</button>
    <button data-page="Analytics"><span class="ico">▥</span>Analytics</button>
    <button data-page="Customers"><span class="ico">♙</span>Customers <span class="count">8</span></button>
    <button data-page="Orders"><span class="ico">▤</span>Orders</button>
    <button data-page="Products"><span class="ico">◇</span>Products</button>
  </nav>

  <div class="nav-label" style="margin-top:22px">Manage</div>
  <nav class="nav" aria-label="Management">
    <button data-page="Reports"><span class="ico">▧</span>Reports</button>
    <button data-page="Integrations"><span class="ico">⤢</span>Integrations</button>
    <button data-page="Settings"><span class="ico">⚙</span>Settings</button>
  </nav>

  <div class="workspace">
    <div class="workhead">
      <div class="workicon">✦</div>
      <div><b>Nexus Studio</b><br><small>Pro workspace</small></div>
    </div>
    <div class="usage"><span>Monthly usage</span><b>68%</b></div>
    <div class="progress"><span></span></div>
  </div>

  <div class="user">
    <div class="avatar">AM</div>
    <div><b>Alex Morgan</b><small>Workspace admin</small></div>
    <button class="more" id="profile">···</button>
  </div>
</aside>

<main>
<header class="topbar">
  <div style="display:flex;align-items:center;gap:13px">
    <button class="iconbtn mobile" id="menu" aria-label="Open navigation">☰</button>
    <div class="crumb">Workspace <span style="color:var(--line);padding:0 7px">/</span><b id="crumb">Overview</b></div>
  </div>
  <div class="actions">
    <label class="search">
      <span>⌕</span>
      <input id="search" type="search" placeholder="Search orders..." aria-label="Search orders">
    </label>
    <button class="iconbtn" id="theme" aria-label="Toggle light and dark mode" title="Toggle theme">☼</button>
    <button class="iconbtn" id="notify" aria-label="Notifications">♧<i class="dot"></i></button>
    <div class="avatar">AM</div>
  </div>
</header>

<section class="heading">
  <div>
    <div class="eyebrow">Tuesday, October 13, 2026 · Live overview</div>
    <h1 id="title">Good afternoon, DeviPriya <span style="animation:pulse 2s infinite;display:inline-block">✦</span></h1>
    <p id="subtitle">Here’s what’s happening with your store today.</p>
  </div>
  <div class="head-actions">
    <select class="select" id="period" aria-label="Reporting period">
      <option value="7">Last 7 days</option>
      <option value="30" selected>Last 30 days</option>
      <option value="90">Last 90 days</option>
    </select>
    <button class="btn primary" id="create">＋ Create report</button>
  </div>
</section>

<section class="grid metrics">
  <article class="panel metric" style="--iconcolor:var(--cyan);--iconbg:#58e2f51b;--glow:#58e2f51a">
    <div class="metric-top">Total revenue <span class="metric-icon">↗</span></div>
    <div class="value" id="revenue">$48,294</div>
    <div class="metric-foot">
      <span class="up">↑ 12.8%</span> vs previous period
      <svg class="spark" viewBox="0 0 60 23"><path d="M1 20L10 16 18 18 27 8 36 12 46 4 53 8 59 2" fill="none" stroke="var(--cyan)" stroke-width="2"/></svg>
    </div>
  </article>

  <article class="panel metric" style="--iconcolor:var(--violet);--iconbg:#9c7cff20;--glow:#9c7cff1a">
    <div class="metric-top">Total orders <span class="metric-icon">▤</span></div>
    <div class="value" id="orders">2,846</div>
    <div class="metric-foot">
      <span class="up">↑ 8.2%</span> vs previous period
      <svg class="spark" viewBox="0 0 60 23"><path d="M1 20L10 14 18 17 27 11 36 14 46 7 53 8 59 2" fill="none" stroke="var(--violet)" stroke-width="2"/></svg>
    </div>
  </article>

  <article class="panel metric" style="--iconcolor:var(--green);--iconbg:#55e2ae1b;--glow:#55e2ae19">
    <div class="metric-top">Conversion rate <span class="metric-icon">⌁</span></div>
    <div class="value">3.62%</div>
    <div class="metric-foot">
      <span class="up">↑ 1.4%</span> vs previous period
      <svg class="spark" viewBox="0 0 60 23"><path d="M1 21L10 18 18 12 27 16 36 8 46 10 53 4 59 2" fill="none" stroke="var(--green)" stroke-width="2"/></svg>
    </div>
  </article>

  <article class="panel metric" style="--iconcolor:var(--pink);--iconbg:#ff80be1b;--glow:#ff80be18">
    <div class="metric-top">Active customers <span class="metric-icon">♙</span></div>
    <div class="value" id="customers">18,492</div>
    <div class="metric-foot">
      <span class="down">↓ 2.4%</span> vs previous period
      <svg class="spark" viewBox="0 0 60 23"><path d="M1 3L10 8 18 6 27 13 36 10 46 17 53 14 59 22" fill="none" stroke="var(--pink)" stroke-width="2"/></svg>
    </div>
  </article>
</section>

<section class="grid middle">
  <article class="panel">
    <div class="panel-head">
      <div>
        <div class="panel-title">Revenue overview</div>
        <div class="panel-sub">Revenue performance across your store</div>
        <div class="summary"><strong id="chartTotal">$48,294</strong><span>↗ 12.8%</span></div>
      </div>
      <div>
        <button class="range active" data-series="revenue">Revenue</button>
        <button class="range" data-series="orders">Orders</button>
      </div>
    </div>
    <div class="chart-wrap">
      <svg class="chart" id="chart" viewBox="0 0 640 230" role="img" aria-label="Revenue and orders trend">
        <defs>
          <linearGradient id="fill" x1="0" x2="0" y1="0" y2="1">
            <stop offset="0" stop-color="#58e2f5" stop-opacity=".25"/>
            <stop offset="1" stop-color="#58e2f5" stop-opacity="0"/>
          </linearGradient>
        </defs>
        <g id="grid"></g>
        <path id="area" fill="url(#fill)"></path>
        <path id="line" class="line"></path>
        <path id="line2" class="line2"></path>
        <g id="labels"></g>
      </svg>
      <div class="legend">
        <span><i></i><span id="legend1">Revenue</span></span>
        <span><i class="v"></i><span id="legend2">Orders</span></span>
      </div>
    </div>
  </article>

  <article class="panel">
    <div class="panel-head">
      <div><div class="panel-title">Traffic sources</div><div class="panel-sub">Where visitors come from</div></div>
      <button class="iconbtn" id="traffic" aria-label="Traffic information" style="width:30px;height:30px">···</button>
    </div>
    <div style="display:flex;justify-content:center;padding:10px 10px 0">
      <svg viewBox="0 0 200 155" style="width:200px;height:155px;max-width:100%" role="img" aria-label="Traffic sources donut chart">
        <circle cx="100" cy="78" r="57" fill="none" stroke="var(--line)" stroke-width="18"/>
        <circle cx="100" cy="78" r="57" fill="none" stroke="#58e2f5" stroke-width="18" stroke-dasharray="154 358" transform="rotate(-90 100 78)"/>
        <circle cx="100" cy="78" r="57" fill="none" stroke="#9c7cff" stroke-width="18" stroke-dasharray="93 358" stroke-dashoffset="-161" transform="rotate(-90 100 78)"/>
        <circle cx="100" cy="78" r="57" fill="none" stroke="#55e2ae" stroke-width="18" stroke-dasharray="65 358" stroke-dashoffset="-260" transform="rotate(-90 100 78)"/>
        <text x="100" y="75" text-anchor="middle" fill="var(--text)" font-size="22" font-weight="800">24.8k</text>
        <text x="100" y="94" text-anchor="middle" fill="var(--muted)" font-size="9">VISITORS</text>
      </svg>
    </div>
    <div class="channels">
      <div class="channel"><div class="channel-icon">↗</div><div><div class="channel-name">Organic search</div><div class="channel-meta">Search engines</div></div><div><div class="channel-val">43.2%</div><div class="channel-change">↑ 4.6%</div></div></div>
      <div class="channel"><div class="channel-icon">◎</div><div><div class="channel-name">Social media</div><div class="channel-meta">Social platforms</div></div><div><div class="channel-val">26.1%</div><div class="channel-change">↑ 2.1%</div></div></div>
      <div class="channel"><div class="channel-icon">✉</div><div><div class="channel-name">Email campaigns</div><div class="channel-meta">Newsletter traffic</div></div><div><div class="channel-val">18.4%</div><div class="channel-change">↑ 8.3%</div></div></div>
      <div class="channel"><div class="channel-icon">⌘</div><div><div class="channel-name">Direct traffic</div><div class="channel-meta">Direct visits</div></div><div><div class="channel-val">12.3%</div><div class="channel-change">↑ 0.9%</div></div></div>
    </div>
  </article>
</section>

<section class="grid lower">
  <article class="panel">
    <div class="panel-head">
      <div><div class="panel-title">Recent orders</div><div class="panel-sub">Track your latest transactions</div></div>
      <button class="btn" id="viewAll">View all ↗</button>
    </div>
    <div class="table-wrap">
      <table>
        <thead><tr><th>Customer</th><th>Order ID</th><th>Date</th><th>Amount</th><th>Status</th><th></th></tr></thead>
        <tbody id="ordersBody">
          <tr data-search="olivia martin nx 10482 paid"><td><div class="customer"><span class="mini">OM</span>Olivia Martin</div></td><td>#NX-10482</td><td>Oct 13, 2026</td><td><b>$284.00</b></td><td><span class="status paid">Paid</span></td><td><button class="view">View</button></td></tr>
          <tr data-search="ethan lee nx 10481 pending"><td><div class="customer"><span class="mini orange">EL</span>Ethan Lee</div></td><td>#NX-10481</td><td>Oct 13, 2026</td><td><b>$128.50</b></td><td><span class="status pending">Pending</span></td><td><button class="view">View</button></td></tr>
          <tr data-search="sophia chen nx 10480 paid"><td><div class="customer"><span class="mini green">SC</span>Sophia Chen</div></td><td>#NX-10480</td><td>Oct 12, 2026</td><td><b>$562.00</b></td><td><span class="status paid">Paid</span></td><td><button class="view">View</button></td></tr>
          <tr data-search="noah williams nx 10479 failed"><td><div class="customer"><span class="mini blue">NW</span>Noah Williams</div></td><td>#NX-10479</td><td>Oct 12, 2026</td><td><b>$74.99</b></td><td><span class="status failed">Failed</span></td><td><button class="view">View</button></td></tr>
          <tr data-search="ava patel nx 10478 paid"><td><div class="customer"><span class="mini orange">AP</span>Ava Patel</div></td><td>#NX-10478</td><td>Oct 11, 2026</td><td><b>$319.00</b></td><td><span class="status paid">Paid</span></td><td><button class="view">View</button></td></tr>
        </tbody>
      </table>
      <div class="empty" id="empty">No matching orders found.</div>
    </div>
  </article>

  <article class="panel">
    <div class="panel-head">
      <div><div class="panel-title">Activity feed</div><div class="panel-sub">Latest workspace updates</div></div>
      <button class="iconbtn" id="refresh" aria-label="Refresh activity" style="width:31px;height:31px">↻</button>
    </div>
    <div class="activity-list" id="activityList">
      <div class="activity"><div class="activity-icon">＋</div><div><p><b>New order received</b><br>Olivia Martin placed order #NX-10482.</p><time>2 minutes ago</time></div></div>
      <div class="activity"><div class="activity-icon">♙</div><div><p><b>New customer joined</b><br>Daniel Kim created an account.</p><time>18 minutes ago</time></div></div>
      <div class="activity"><div class="activity-icon">✓</div><div><p><b>Payment confirmed</b><br>Order #NX-10480 payment was received.</p><time>42 minutes ago</time></div></div>
      <div class="activity"><div class="activity-icon">↗</div><div><p><b>Weekly report is ready</b><br>Your performance summary is available.</p><time>1 hour ago</time></div></div>
    </div>
  </article>
</section>
</main>

<div class="toast" id="toast" role="status" aria-live="polite">✓ <span id="toastText">Done</span></div>

<div class="modal-bg" id="modalBg" role="dialog" aria-modal="true" aria-labelledby="modalTitle">
  <div class="modal">
    <div class="modal-head"><h2 id="modalTitle">Create report</h2><button class="close" id="close" aria-label="Close dialog">×</button></div>
    <form id="form">
      <div class="field"><label for="reportName">Report name</label><input id="reportName" required maxlength="60" placeholder="e.g. Monthly revenue"></div>
      <div class="field"><label for="reportType">Report type</label><select id="reportType"><option>Revenue overview</option><option>Orders summary</option><option>Customer acquisition</option><option>Traffic sources</option></select></div>
      <div class="field"><label for="reportPeriod">Time period</label><select id="reportPeriod"><option>Last 7 days</option><option selected>Last 30 days</option><option>Last 90 days</option></select></div>
      <div class="modal-actions"><button type="button" class="btn" id="cancel">Cancel</button><button type="submit" class="btn primary">Generate report ↗</button></div>
    </form>
  </div>
</div>

<script>
(() => {
  const $ = s => document.querySelector(s);
  const $$ = s => [...document.querySelectorAll(s)];
  let toastTimer;

  function toast(msg) {
    $('#toastText').textContent = msg;
    $('#toast').classList.add('show');
    clearTimeout(toastTimer);
    toastTimer = setTimeout(() => $('#toast').classList.remove('show'), 2700);
  }

  // Dark/light theme
  if (localStorage.getItem('nexusiq-theme') === 'light') {
    document.body.classList.add('light');
  }

  function syncTheme() {
    $('#theme').textContent =
      document.body.classList.contains('light') ? '☾' : '☼';
  }

  syncTheme();

  $('#theme').onclick = () => {
    document.body.classList.toggle('light');
    localStorage.setItem(
      'nexusiq-theme',
      document.body.classList.contains('light') ? 'light' : 'dark'
    );
    syncTheme();
    toast('Theme updated');
  };

  // Responsive mobile sidebar
  const sidebar = $('#sidebar');
  const overlay = $('#overlay');

  function closeSide() {
    sidebar.classList.remove('open');
    overlay.classList.remove('show');
  }

  $('#menu').onclick = () => {
    sidebar.classList.toggle('open');
    overlay.classList.toggle('show');
  };

  overlay.onclick = closeSide;

  // Sidebar navigation
  const copy = {
    Overview: ['Good afternoon, Alex ✦', "Here’s what’s happening with your store today."],
    Analytics: ['Analytics overview', 'Explore performance trends and discover what moves your business forward.'],
    Customers: ['Customer center', 'Understand your audience and keep every relationship moving.'],
    Orders: ['Order management', 'Review recent transactions and keep fulfillment on track.'],
    Products: ['Product insights', 'Track your catalog performance from one focused workspace.'],
    Reports: ['Reports library', 'Create a snapshot of the metrics that matter most.'],
    Integrations: ['Connected apps', 'Manage the tools and services powering your workspace.'],
    Settings: ['Workspace settings', 'Personalize your dashboard experience.']
  };

  $$('.nav button').forEach(button => {
    button.onclick = () => {
      $$('.nav button').forEach(item => item.classList.remove('active'));
      button.classList.add('active');

      const page = button.dataset.page;
      $('#crumb').textContent = page;
      $('#title').textContent = copy[page][0];
      $('#subtitle').textContent = copy[page][1];

      closeSide();

      if (page === 'Reports') openModal();
      else if (page === 'Settings') toast('Use the theme control to personalize your workspace');
      else if (page === 'Integrations') toast('Sample integrations are up to date');
      else if (page !== 'Overview') toast(page + ' selected · sample dashboard data shown');
    };
  });

  // Interactive SVG chart
  const series = {
    revenue: [24,31,28,38,35,44,41,51,47,59,53,65],
    orders: [18,22,20,29,26,31,34,38,36,43,40,49]
  };

  const labels = [
    'Sep 15','Sep 18','Sep 21','Sep 24','Sep 27','Sep 30',
    'Oct 3','Oct 6','Oct 9','Oct 11','Oct 12','Oct 13'
  ];

  let active = 'revenue';

  function chart(type = 'revenue') {
    active = type;

    const primary = series[type];
    const secondary = series[type === 'revenue' ? 'orders' : 'revenue'];
    const width = 640;
    const height = 230;
    const left = 38;
    const right = 14;
    const top = 15;
    const plotHeight = 188;
    const plotWidth = width - left - right;

    const points = primary.map((value, index) => [
      left + index * plotWidth / 11,
      top + (70 - value) / 70 * plotHeight
    ]);

    const points2 = secondary.map((value, index) => [
      left + index * plotWidth / 11,
      top + (70 - value) / 70 * plotHeight
    ]);

    const path = pointsArray =>
      pointsArray.map((point, index) =>
        (index ? 'L' : 'M') +
        point[0].toFixed(1) + ' ' +
        point[1].toFixed(1)
      ).join(' ');

    $('#grid').innerHTML = [0,20,40,60].map(value => {
      const y = top + (70 - value) / 70 * plotHeight;
      const prefix = type === 'revenue' ? '$' : '';
      const suffix = type === 'orders' ? '' : 'k';

      return `
        <line class="gridline" x1="${left}" y1="${y}"
          x2="${width-right}" y2="${y}"></line>
        <text x="${left-8}" y="${y+3}" text-anchor="end">
          ${prefix}${value}${suffix}
        </text>`;
    }).join('');

    $('#labels').innerHTML = labels.map((label, index) =>
      index % 2 === 0
        ? `<text x="${points[index][0]}" y="225" text-anchor="middle">${label}</text>`
        : ''
    ).join('');

    $('#line').setAttribute('d', path(points));
    $('#line2').setAttribute('d', path(points2));

    $('#area').setAttribute(
      'd',
      path(points) +
      ` L ${points[11][0]} ${top+plotHeight}` +
      ` L ${points[0][0]} ${top+plotHeight} Z`
    );

    $('#line').style.stroke =
      type === 'revenue' ? 'var(--cyan)' : 'var(--violet)';

    $('#line2').style.stroke =
      type === 'revenue' ? 'var(--violet)' : 'var(--cyan)';

    $('#legend1').textContent = type === 'revenue' ? 'Revenue' : 'Orders';
    $('#legend2').textContent = type === 'revenue' ? 'Orders' : 'Revenue';

    $('#chartTotal').textContent =
      type === 'revenue'
        ? $('#revenue').textContent
        : $('#orders').textContent + ' orders';

    $$('.range').forEach(button => {
      button.classList.toggle('active', button.dataset.series === type);
    });
  }

  chart();

  $$('.range').forEach(button => {
    button.onclick = () => chart(button.dataset.series);
  });

  // Reporting period selector
  $('#period').onchange = event => {
    const days = Number(event.target.value);
    const scale = days === 7 ? 0.38 : days === 90 ? 2.45 : 1;

    $('#revenue').textContent =
      '$' + Math.round(48294 * scale).toLocaleString('en-US');

    $('#orders').textContent =
      Math.round(2846 * scale).toLocaleString('en-US');

    $('#customers').textContent =
      Math.round(18492 * (days === 7 ? 0.52 : days === 90 ? 1.6 : 1))
        .toLocaleString('en-US');

    $('#chartTotal').textContent =
      active === 'revenue'
        ? $('#revenue').textContent
        : $('#orders').textContent + ' orders';

    toast('Showing last ' + days + ' days');
  };

  // Search and filter orders
  $('#search').oninput = event => {
    const query = event.target.value.toLowerCase().trim();
    let count = 0;

    $$('#ordersBody tr').forEach(row => {
      const matches = (
        row.dataset.search + ' ' + row.innerText.toLowerCase()
      ).includes(query);

      row.style.display = matches ? '' : 'none';
      if (matches) count++;
    });

    $('#empty').style.display = count ? 'none' : 'block';

    if (query) {
      $('#crumb').textContent = 'Search results';
      $('#subtitle').textContent =
        count + ' matching order' + (count === 1 ? '' : 's') +
        ' for “' + query + '”.';
    } else {
      const page = $('.nav button.active').dataset.page;
      $('#crumb').textContent = page;
      $('#subtitle').textContent = copy[page][1];
    }
  };

  // Create report modal
  const modal = $('#modalBg');

  function openModal() {
    modal.classList.add('open');
    setTimeout(() => $('#reportName').focus(), 40);
  }

  function closeModal() {
    modal.classList.remove('open');
  }

  $('#create').onclick = openModal;
  $('#close').onclick = closeModal;
  $('#cancel').onclick = closeModal;

  modal.onclick = event => {
    if (event.target === modal) closeModal();
  };

  document.onkeydown = event => {
    if (event.key === 'Escape') {
      closeModal();
      closeSide();
    }
  };

  function escapeHtml(value) {
    return value.replace(/[&<>"']/g, character => ({
      '&': '&amp;',
      '<': '&lt;',
      '>': '&gt;',
      '"': '&quot;',
      "'": '&#39;'
    })[character]);
  }

  $('#form').onsubmit = event => {
    event.preventDefault();

    const name = $('#reportName').value.trim();
    const type = $('#reportType').value;
    const period = $('#reportPeriod').value;

    if (!name) return;

    closeModal();
    toast('“' + name + '” report generated');

    const activity = document.createElement('div');
    activity.className = 'activity';

    activity.innerHTML = `
      <div class="activity-icon">▧</div>
      <div>
        <p><b>Report generated</b><br>
        ${escapeHtml(name)} · ${escapeHtml(type)}</p>
        <time>Just now · ${escapeHtml(period)}</time>
      </div>`;

    $('#activityList').prepend(activity);
    $('#reportName').value = '';
  };

  // Order detail buttons
  $$('.view').forEach(button => {
    button.onclick = () => {
      const row = button.closest('tr');

      toast(
        row.children[1].textContent + ' · ' +
        row.children[0].innerText + ' · ' +
        row.children[3].innerText + ' · ' +
        row.children[4].innerText
      );
    };
  });

  // View all orders
  $('#viewAll').onclick = () => {
    $('[data-page="Orders"]').click();
    $('#search').value = '';

    $$('#ordersBody tr').forEach(row => {
      row.style.display = '';
    });

    $('#empty').style.display = 'none';
    toast('Showing all sample orders');
  };

  // Notifications and other controls
  $('#notify').onclick = () =>
    toast('You’re all caught up — 2 updates reviewed');

  $('#traffic').onclick = () =>
    toast('Traffic distribution for the current sample period');

  $('#refresh').onclick = () => {
    $('#activityList').animate(
      [
        {opacity:.3, transform:'translateY(4px)'},
        {opacity:1, transform:'translateY(0)'}
      ],
      {duration:350}
    );

    toast('Activity feed refreshed');
  };

  $('#profile').onclick = () =>
    toast('Alex Morgan · Workspace admin');
})();
</script>
</body>
</html>
