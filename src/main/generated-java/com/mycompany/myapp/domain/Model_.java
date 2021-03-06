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

@StaticMetamodel(Model.class)
public abstract class Model_ {

    // Raw attributes
    public static volatile SingularAttribute<Model, Integer> id;
    public static volatile SingularAttribute<Model, String> name;
    public static volatile SingularAttribute<Model, String> fileName;
    public static volatile SingularAttribute<Model, String> color;
    public static volatile SingularAttribute<Model, Instant> creationDate;
    public static volatile SingularAttribute<Model, String> creationAuthor;
    public static volatile SingularAttribute<Model, Instant> lastModificationDate;
    public static volatile SingularAttribute<Model, String> lastModificationAuthor;
    public static volatile SingularAttribute<Model, Integer> version;

    // Many to one
    public static volatile SingularAttribute<Model, CategoryType> cat;

    // Many to many
    public static volatile ListAttribute<Model, RaceOption> theGenders;
}