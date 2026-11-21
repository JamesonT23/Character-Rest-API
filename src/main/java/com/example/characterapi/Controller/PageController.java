package com.example.characterapi.controller;

import com.example.characterapi.entity.TvCharacter;
import com.example.characterapi.service.TvCharacterService;

import jakarta.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class PageController {

    private final TvCharacterService service;

    public PageController(TvCharacterService service) {
        this.service = service;
    }

    // Home page and character search
    @GetMapping("/")
    public String home(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String universe,
            Model model) {

        List<TvCharacter> allCharacters = service.search(null, null);

        List<String> universes = allCharacters.stream()
                .map(TvCharacter::getUniverse)
                .filter(item -> item != null && !item.isBlank())
                .distinct()
                .sorted()
                .toList();

        model.addAttribute("characters", service.search(name, universe));
        model.addAttribute("name", name);
        model.addAttribute("universe", universe);
        model.addAttribute("universes", universes);

        return "index";
    }

    // About page
    @GetMapping("/about")
    public String about() {
        return "about";
    }

    // Character details page
    @GetMapping("/characters/{id}")
    public String details(
            @PathVariable Long id,
            Model model) {

        try {
            model.addAttribute("character", service.findById(id));
            return "details";
        } catch (ResponseStatusException e) {
            return "not-found";
        }
    }

    // Display add character form
    @GetMapping("/characters/new")
    public String newCharacterForm(Model model) {

        model.addAttribute("character", new TvCharacter());

        return "new-character-form";
    }

    // Save a new character
    @PostMapping("/characters")
    public String addCharacter(
            @Valid @ModelAttribute("character") TvCharacter character,
            BindingResult result,
            Model model,
            RedirectAttributes redirectAttributes) {

        if (result.hasErrors()) {
            model.addAttribute("errorMessage",
                    "Please complete the required fields.");
            return "new-character-form";
        }

        service.create(character);

        redirectAttributes.addFlashAttribute(
                "successMessage",
                character.getName() + " was added!");

        return "redirect:/";
    }

    // Display edit character form
    @GetMapping("/characters/{id}/edit")
    public String editCharacterForm(
            @PathVariable Long id,
            Model model) {

        try {
            model.addAttribute("character", service.findById(id));
            return "edit-character-form";
        } catch (ResponseStatusException e) {
            return "not-found";
        }
    }

    // Update an existing character
    @PostMapping("/characters/{id}/edit")
    public String updateCharacter(
            @PathVariable Long id,
            @Valid @ModelAttribute("character") TvCharacter character,
            BindingResult result,
            Model model,
            RedirectAttributes redirectAttributes) {

        try {
            service.findById(id);
        } catch (ResponseStatusException e) {
            return "not-found";
        }

        if (result.hasErrors()) {
            model.addAttribute("errorMessage",
                    "Please complete the required fields.");
            return "edit-character-form";
        }

        TvCharacter updated = service.update(id, character);

        redirectAttributes.addFlashAttribute(
                "successMessage",
                updated.getName() + " was updated!");

        return "redirect:/characters/" + id;
    }

    // Delete a character
    @PostMapping("/characters/{id}/delete")
    public String deleteCharacter(
            @PathVariable Long id,
            RedirectAttributes redirectAttributes) {

        try {
            TvCharacter character = service.findById(id);

            String characterName = character.getName();

            service.delete(id);

            redirectAttributes.addFlashAttribute(
                    "successMessage",
                    characterName + " was removed!");

            return "redirect:/";

        } catch (ResponseStatusException e) {
            return "not-found";
        }
    }
}
