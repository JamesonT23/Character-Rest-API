<#macro page title>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="/">Character Gallery</a>
        <div class="navbar-nav">
            <a class="nav-link" href="/">Home</a>
            <a class="nav-link" href="/about">About</a>
            <a class="nav-link" href="/characters/new">Add Character</a>
        </div>
    </div>
</nav>

<main class="container py-4">
    <#nested>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
</#macro>
