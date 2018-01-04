/*
 * Project home: https://github.com/jaxio/celerio-angular-quickstart
 * 
 * Source code generated by Celerio, an Open Source code generator by Jaxio.
 * Documentation: http://www.jaxio.com/documentation/celerio/
 * Source code: https://github.com/jaxio/celerio/
 * Follow us on twitter: @jaxiosoft
 * This header can be customized in Celerio conf...
 * Template pack-angular:src/main/java/rest/EntityResource.java.e.vm
 */
package com.mycompany.myapp.rest;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.web.bind.annotation.RequestMethod.DELETE;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import static org.springframework.web.bind.annotation.RequestMethod.PUT;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Optional;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestBody;

import com.mycompany.myapp.domain.Characteristic;
import com.mycompany.myapp.dto.CharacteristicDTO;
import com.mycompany.myapp.dto.CharacteristicDTOService;
import com.mycompany.myapp.dto.support.PageRequestByExample;
import com.mycompany.myapp.dto.support.PageResponse;
import com.mycompany.myapp.repository.CharacteristicRepository;
import com.mycompany.myapp.rest.support.AutoCompleteQuery;

@RestController
@RequestMapping("/api/characteristics")
public class CharacteristicResource {

    private final Logger log = LoggerFactory.getLogger(CharacteristicResource.class);

    @Inject
    private CharacteristicRepository characteristicRepository;
    @Inject
    private CharacteristicDTOService characteristicDTOService;

    /**
     * Create a new Characteristic.
     */
    @RequestMapping(value = "/", method = POST, produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<CharacteristicDTO> create(@RequestBody CharacteristicDTO characteristicDTO) throws URISyntaxException {

        log.debug("Create CharacteristicDTO : {}", characteristicDTO);

        if (characteristicDTO.isIdSet()) {
            return ResponseEntity.badRequest().header("Failure", "Cannot create Characteristic with existing ID").body(null);
        }

        CharacteristicDTO result = characteristicDTOService.save(characteristicDTO);

        return ResponseEntity.created(new URI("/api/characteristics/" + result.id)).body(result);
    }

    /**
    * Find by id Characteristic.
    */
    @RequestMapping(value = "/{id}", method = GET, produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<CharacteristicDTO> findById(@PathVariable Integer id) throws URISyntaxException {

        log.debug("Find by id Characteristic : {}", id);

        return Optional.ofNullable(characteristicDTOService.findOne(id)).map(characteristicDTO -> new ResponseEntity<>(characteristicDTO, HttpStatus.OK))
                .orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    /**
     * Update Characteristic.
     */
    @RequestMapping(value = "/", method = PUT, produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<CharacteristicDTO> update(@RequestBody CharacteristicDTO characteristicDTO) throws URISyntaxException {

        log.debug("Update CharacteristicDTO : {}", characteristicDTO);

        if (!characteristicDTO.isIdSet()) {
            return create(characteristicDTO);
        }

        CharacteristicDTO result = characteristicDTOService.save(characteristicDTO);

        return ResponseEntity.ok().body(result);
    }

    /**
     * Find a Page of Characteristic using query by example.
     */
    @RequestMapping(value = "/page", method = POST, produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<PageResponse<CharacteristicDTO>> findAll(@RequestBody PageRequestByExample<CharacteristicDTO> prbe) throws URISyntaxException {
        PageResponse<CharacteristicDTO> pageResponse = characteristicDTOService.findAll(prbe);
        return new ResponseEntity<>(pageResponse, new HttpHeaders(), HttpStatus.OK);
    }

    /**
    * Auto complete support.
    */
    @RequestMapping(value = "/complete", method = POST, produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<List<CharacteristicDTO>> complete(@RequestBody AutoCompleteQuery acq) throws URISyntaxException {

        List<CharacteristicDTO> results = characteristicDTOService.complete(acq.query, acq.maxResults);

        return new ResponseEntity<>(results, new HttpHeaders(), HttpStatus.OK);
    }

    /**
     * Delete by id Characteristic.
     */
    @RequestMapping(value = "/{id}", method = DELETE, produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<Void> delete(@PathVariable Integer id) throws URISyntaxException {

        log.debug("Delete by id Characteristic : {}", id);

        try {
            characteristicRepository.delete(id);
            return ResponseEntity.ok().build();
        } catch (Exception x) {
            // todo: dig exception, most likely org.hibernate.exception.ConstraintViolationException
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
    }
}