package com.example.characterapi.controller;

import com.example.characterapi.entity.TvCharacter;
import com.example.characterapi.service.TvCharacterService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class PageController {

    private final TvCharacterService service;

    public PageController(TvCharacterService service) {
        this.service = service;
    }

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
}
