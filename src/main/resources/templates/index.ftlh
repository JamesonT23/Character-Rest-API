<#import "layout.ftlh" as layout>

<@layout.page title="Character Gallery">

<h1 class="mb-4">Character Gallery</h1>

<#if successMessage??>
    <div class="alert alert-success" role="alert">
        ${successMessage}
    </div>
</#if>

<!-- Search and Filter -->
<form method="GET" action="/" class="row g-3 mb-4">

    <div class="col-md-5">
        <label for="name" class="form-label">Character Name</label>
        <input
            type="text"
            class="form-control"
            id="name"
            name="name"
            value="${(name)!''}"
            placeholder="Search by name">
    </div>

    <div class="col-md-5">
        <label for="universe" class="form-label">Universe</label>
        <select class="form-select" id="universe" name="universe">
            <option value="">All Universes</option>

            <#list universes as item>
                <option value="${item}"
                    <#if universe?? && universe == item>selected</#if>>
                    ${item}
                </option>
            </#list>
        </select>
    </div>

    <div class="col-md-2 d-flex align-items-end">
        <button type="submit" class="btn btn-primary w-100">
            Search
        </button>
    </div>

</form>

<!-- Character Cards -->
<div class="row g-4">

    <#list characters as character>
        <div class="col-md-4">
            <div class="card h-100 shadow-sm">

                <#if character.imageUrl?? && character.imageUrl?has_content>
                    <img
                        src="${character.imageUrl}"
                        class="card-img-top"
                        alt="${character.name}"
                        style="height: 250px; object-fit: cover;">
                <#else>
                    <img
                        src="https://placehold.co/400x250?text=No+Image"
                        class="card-img-top"
                        alt="No image available"
                        style="height: 250px; object-fit: cover;">
                </#if>

                <div class="card-body">
                    <h5 class="card-title">${character.name}</h5>

                    <p class="card-text">
                        <strong>Universe:</strong> ${(character.universe)!'Not specified'}<br>
                        <strong>Role:</strong> ${(character.role)!'Not specified'}<br>
                        <strong>Species:</strong> ${(character.species)!'Not specified'}
                    </p>

                    <p class="card-text">
                        ${(character.description)!''}
                    </p>

                    <a href="/characters/${character.characterId?c}"
                       class="btn btn-primary">
                        View Details
                    </a>
                </div>

            </div>
        </div>

    <#else>
        <div class="col-12">
            <div class="alert alert-info">
                No characters found. Try changing your search or filter.
            </div>
        </div>
    </#list>

</div>

</@layout.page>