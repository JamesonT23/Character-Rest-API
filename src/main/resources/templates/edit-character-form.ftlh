<#import "layout.ftlh" as layout>

<@layout.page title="Edit Character">

<h1 class="mb-4">Edit Character</h1>

<#if errorMessage??>
    <div class="alert alert-danger">
        ${errorMessage}
    </div>
</#if>

<form action="/characters/${character.characterId?c}/edit" method="POST">

    <div class="mb-3">
        <label class="form-label">Character Name</label>
        <input type="text"
               name="name"
               class="form-control"
               value="${(character.name)!''}"
               required>
    </div>

    <div class="mb-3">
        <label class="form-label">Universe</label>
        <input type="text"
               name="universe"
               class="form-control"
               value="${(character.universe)!''}">
    </div>

    <div class="mb-3">
        <label class="form-label">Role</label>
        <input type="text"
               name="role"
               class="form-control"
               value="${(character.role)!''}">
    </div>

    <div class="mb-3">
        <label class="form-label">Species</label>
        <input type="text"
               name="species"
               class="form-control"
               value="${(character.species)!''}">
    </div>

    <div class="mb-3">
        <label class="form-label">Image URL</label>
        <input type="text"
               name="imageUrl"
               class="form-control"
               value="${(character.imageUrl)!''}">
    </div>

    <div class="mb-3">
        <label class="form-label">Description / Backstory</label>
        <textarea name="description"
                  class="form-control"
                  rows="5"
                  required>${(character.description)!''}</textarea>
    </div>

    <button type="submit" class="btn btn-primary">
        Save Changes
    </button>

    <a href="/characters/${character.characterId?c}"
       class="btn btn-secondary">
        Cancel
    </a>

</form>

</@layout.page>
