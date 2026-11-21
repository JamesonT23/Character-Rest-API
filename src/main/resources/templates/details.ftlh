<#import "layout.ftlh" as layout>

<@layout.page title="${character.name} - Character Details">

<div class="row g-4">

    <div class="col-md-5">
        <#if character.imageUrl?? && character.imageUrl?has_content>
            <img
                src="${character.imageUrl}"
                class="img-fluid rounded shadow"
                alt="${character.name}">
        <#else>
            <img
                src="https://placehold.co/500x500?text=No+Image"
                class="img-fluid rounded shadow"
                alt="No image available">
        </#if>
    </div>

    <div class="col-md-7">

        <h1>${character.name}</h1>

        <#if successMessage??>
            <div class="alert alert-success" role="alert">
                ${successMessage}
            </div>
        </#if>

        <hr>

        <p><strong>Universe:</strong> ${(character.universe)!'Not specified'}</p>
        <p><strong>Role:</strong> ${(character.role)!'Not specified'}</p>
        <p><strong>Species:</strong> ${(character.species)!'Not specified'}</p>

        <h4 class="mt-4">Description / Backstory</h4>
        <p>${(character.description)!'No description available.'}</p>

        <div class="mt-4 d-flex flex-wrap gap-2">

            <a href="/characters/${character.characterId?c}/edit"
               class="btn btn-warning">
                Edit Character
            </a>

            <form method="POST"
                  action="/characters/${character.characterId?c}/delete"
                  onsubmit="return confirm('Are you sure you want to delete this character?');">

                <button type="submit" class="btn btn-danger">
                    Delete Character
                </button>

            </form>

            <a href="/" class="btn btn-secondary">
                Back to Gallery
            </a>

        </div>

    </div>

</div>

</@layout.page>