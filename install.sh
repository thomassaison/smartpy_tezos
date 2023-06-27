<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link rel="icon" href="/favicon.ico" />
    <meta
      id="viewport-meta"
      name="viewport"
      content="width=512, user-scalable=no"
    />
    <meta name="theme-color" content="#000000" />
    <meta
      name="description"
      content="SmartPy is an intuitive and powerful smart contract development platform for Tezos."
    />
    <link rel="apple-touch-icon" href="/logo192.png" />
    <!--
      manifest.json provides metadata used when your web app is installed on a
      user's mobile device or desktop. See https://developers.google.com/web/fundamentals/web-app-manifest/
  -->
    <link rel="manifest" href="/manifest.json" />

    <title>SmartPy</title>

    <!-- Google tag (gtag.js) -->
    <script
      async
      src="https://www.googletagmanager.com/gtag/js?id=G-XJ3XJ5MRRR"
    ></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag() {
        dataLayer.push(arguments);
      }
      gtag('js', new Date());

      gtag('config', 'G-XJ3XJ5MRRR');
    </script>

    <!-- Material UI Fonts -->
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
    />

    <!-- resolves global is undefined -->
    <script>
      var global = global || window;
    </script>

    <!-- @TODO[low]: Rodrigo Quelhas - Find a way to disable babel transformation of big int exponentiation (**) to Math.pow -->
    <script src="/vendor/bls12-wrapper.min.js"></script>

    
    <script src="https://cdn.jsdelivr.net/pyodide/v0.22.1/full/pyodide.js"></script>
    <script type="module" crossorigin src="/assets/index-49d424de.js"></script>
    <link rel="stylesheet" href="/assets/index-b750a458.css">
  </head>

  <body>
    <noscript
      >You need to enable JavaScript to run this app.</noscript
    >
    <div id="root"></div>
  </body>
</html>
