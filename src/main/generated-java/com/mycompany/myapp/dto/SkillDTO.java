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
 * Simple DTO for Skill.
 */
public class SkillDTO {
    public Integer id;
    public String name;
    public Boolean position;
    public Boolean onInit;
    public Instant creationDate;
    public String creationAuthor;
    public Instant lastModificationDate;
    public String lastModificationAuthor;
    public Integer version;
    public SkillDTO skill2;
    public ScriptDTO script;;
    public List<CharacterDTO> theChars;

    @JsonIgnore
    public boolean isIdSet() {
        return id != null;
    }
}