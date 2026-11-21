<#import "layout.ftlh" as layout>

<@layout.page title="About Character Gallery">

<h1 class="mb-4">About Character Gallery</h1>

<div class="row align-items-center g-4">

    <div class="col-md-5">
        <img src="/images/Batman.jpg"
             class="img-fluid rounded shadow"
             alt="Batman">
    </div>

    <div class="col-md-7">
        <h3>About This Project</h3>

        <p>
            Character Gallery is a website where users can explore
            and manage information about different fictional characters.
            Users can view character details, search by name, filter
            by universe, and add, edit, or delete characters.
        </p>

        <p>
            Each character can include a name, universe, role,
            species, image, and description.
        </p>
    </div>

</div>

<hr class="my-5">

<h3>How the Website Works</h3>

<p>
    This project uses a layered architecture. Each part of the
    application has a different responsibility.
</p>

<div class="mb-4">
    <h5>1. Front End (View Layer)</h5>
    <p>
        The front end uses HTML, FreeMarker, and Bootstrap to display
        the website. Users interact with pages to search for characters,
        view details, and submit forms.
    </p>
</div>

<div class="mb-4">
    <h5>2. Controller Layer</h5>
    <p>
        The controllers receive requests from the user's browser.
        They determine what action needs to happen and communicate
        with the service layer.
    </p>
</div>

<div class="mb-4">
    <h5>3. Service Layer</h5>
    <p>
        The service layer handles the application's main operations,
        such as finding, adding, updating, searching for, and deleting
        characters.
    </p>
</div>

<div class="mb-4">
    <h5>4. Repository Layer</h5>
    <p>
        The repository layer communicates with the database.
        It retrieves and saves character information.
    </p>
</div>

<div class="mb-4">
    <h5>5. Database</h5>
    <p>
        PostgreSQL stores the character information so that it
        remains available when users return to the website.
    </p>
</div>

<hr class="my-4">

<h3>Technologies Used</h3>

<ul>
    <li>Java</li>
    <li>Spring Boot</li>
    <li>FreeMarker</li>
    <li>HTML and Bootstrap</li>
    <li>PostgreSQL</li>
    <li>Spring Data JPA</li>
</ul>

<p>
    The front end communicates with the back end through HTTP requests.
    The back end processes those requests, works with the database,
    and returns the information needed to display the updated pages.
</p>

<a href="/" class="btn btn-primary mt-3">Back to Gallery</a>

</@layout.page>
