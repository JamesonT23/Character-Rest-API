package com.example.characterapi.service;

import com.example.characterapi.entity.TvCharacter;
import com.example.characterapi.repository.TvCharacterRepository;
import jakarta.annotation.PostConstruct;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
public class TvCharacterService {

    private final TvCharacterRepository repository;

    public TvCharacterService(TvCharacterRepository repository) {
        this.repository = repository;
    }

    @PostConstruct
    public void assignDefaultImages() {
        List<TvCharacter> characters = repository.findAll();

        for (TvCharacter character : characters) {
            if (character.getImageUrl() == null || character.getImageUrl().isBlank()) {

                switch (character.getName().toLowerCase()) {
                    case "batman":
                        character.setImageUrl("/images/Batman.jpg");
                        break;
                    case "raphael":
                        character.setImageUrl("/images/Raph.jpg");
                        break;
                    case "winston":
                        character.setImageUrl("/images/winton.jpg");
                        break;
                    case "darth vader":
                        character.setImageUrl("/images/Vader.jpg");
                        break;
                    case "spider-man":
                        character.setImageUrl("/images/SpidermanIndex.jpg");
                        break;
                }
            }
        }

        repository.saveAll(characters);
    }

    public List<TvCharacter> search(String name, String universe) {
        return repository.findAll().stream()
                .filter(character -> name == null || name.isBlank()
                        || character.getName().toLowerCase()
                                .contains(name.toLowerCase()))
                .filter(character -> universe == null || universe.isBlank()
                        || (character.getUniverse() != null
                                && character.getUniverse()
                                        .equalsIgnoreCase(universe)))
                .toList();
    }

    public TvCharacter findById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.NOT_FOUND, "Character not found"));
    }

    public TvCharacter create(TvCharacter character) {
        return repository.save(character);
    }

    public TvCharacter update(Long id, TvCharacter updatedCharacter) {
        TvCharacter character = findById(id);

        character.setName(updatedCharacter.getName());
        character.setDescription(updatedCharacter.getDescription());
        character.setUniverse(updatedCharacter.getUniverse());
        character.setRole(updatedCharacter.getRole());
        character.setSpecies(updatedCharacter.getSpecies());
        character.setImageUrl(updatedCharacter.getImageUrl());

        return repository.save(character);
    }

    public void delete(Long id) {
        TvCharacter character = findById(id);
        repository.delete(character);
    }
}
