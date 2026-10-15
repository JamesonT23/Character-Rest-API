package com.example.characterapi.repository;

import com.example.characterapi.entity.TvCharacter;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TvCharacterRepository extends JpaRepository<TvCharacter, Long> {

}