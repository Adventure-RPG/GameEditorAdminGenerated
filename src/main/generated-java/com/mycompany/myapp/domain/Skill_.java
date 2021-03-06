/*
 * Project home: https://github.com/jaxio/celerio-angular-quickstart
 * 
 * Source code generated by Celerio, an Open Source code generator by Jaxio.
 * Documentation: http://www.jaxio.com/documentation/celerio/
 * Source code: https://github.com/jaxio/celerio/
 * Follow us on twitter: @jaxiosoft
 * This header can be customized in Celerio conf...
 * Template pack-angular:src/main/java/domain/EntityMeta_.java.e.vm
 */
package com.mycompany.myapp.domain;

import java.time.Instant;

import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@StaticMetamodel(Skill.class)
public abstract class Skill_ {

    // Raw attributes
    public static volatile SingularAttribute<Skill, Integer> id;
    public static volatile SingularAttribute<Skill, String> name;
    public static volatile SingularAttribute<Skill, Boolean> position;
    public static volatile SingularAttribute<Skill, Boolean> onInit;
    public static volatile SingularAttribute<Skill, Instant> creationDate;
    public static volatile SingularAttribute<Skill, String> creationAuthor;
    public static volatile SingularAttribute<Skill, Instant> lastModificationDate;
    public static volatile SingularAttribute<Skill, String> lastModificationAuthor;
    public static volatile SingularAttribute<Skill, Integer> version;

    // Many to one
    public static volatile SingularAttribute<Skill, Skill> skill2;
    public static volatile SingularAttribute<Skill, Script> script;

    // Many to many
    public static volatile ListAttribute<Skill, Character> theChars;
}