/*
 * Project home: https://github.com/jaxio/celerio-angular-quickstart
 * 
 * Source code generated by Celerio, an Open Source code generator by Jaxio.
 * Documentation: http://www.jaxio.com/documentation/celerio/
 * Source code: https://github.com/jaxio/celerio/
 * Follow us on twitter: @jaxiosoft
 * This header can be customized in Celerio conf...
 * Template pack-angular:src/main/java/dto/EntityDTO.java.e.vm
 */
package com.mycompany.myapp.dto;

import java.time.Instant;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * Simple DTO for Character.
 */
public class CharacterDTO {
    public Integer id;
    public String username;
    public Instant creationDate;
    public String creationAuthor;
    public Instant lastModificationDate;
    public String lastModificationAuthor;
    public Integer version;
    public CharacteristicDTO charc;
    public RaceDTO race;;
    public List<SkillDTO> theSkills;

    @JsonIgnore
    public boolean isIdSet() {
        return id != null;
    }
}