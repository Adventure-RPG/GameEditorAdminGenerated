/*
 * Project home: https://github.com/jaxio/celerio-angular-quickstart
 * 
 * Source code generated by Celerio, an Open Source code generator by Jaxio.
 * Documentation: http://www.jaxio.com/documentation/celerio/
 * Source code: https://github.com/jaxio/celerio/
 * Follow us on twitter: @jaxiosoft
 * This header can be customized in Celerio conf...
 * Template pack-angular:src/main/java/domain/Entity.java.e.vm
 */
package com.mycompany.myapp.domain;

import static javax.persistence.GenerationType.IDENTITY;

import java.io.Serializable;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.Version;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Size;

import com.google.common.base.MoreObjects;
import com.google.common.base.Objects;
import com.mycompany.myapp.audit.AuditContextHolder;

@Entity
@Table(name = "gender")
public class Gender implements Identifiable<Integer>, Serializable {
    private static final long serialVersionUID = 1L;
    private static final Logger log = Logger.getLogger(Gender.class.getName());

    // Raw attributes
    private Integer id;
    private String name;
    private Integer strengthmin;
    private Integer strengthmax;
    private Integer agilitymin;
    private Integer agilitymax;
    private Integer endurancemin;
    private Integer endurancemax;
    private Integer intelligencemin;
    private Integer intelligencemax;
    private Integer charismamin;
    private Integer charismamax;
    private Integer perceptionmin;
    private Integer perceptionmax;
    private Integer luckmin;
    private Integer luckmax;
    private Integer heightmin;
    private Integer heightmax;
    private Integer weightmin;
    private Integer weightmax;
    private Instant creationDate;
    private String creationAuthor;
    private Instant lastModificationDate;
    private String lastModificationAuthor;
    private Integer version;

    // Many to many
    private List<RaceOption> theRacesOptions = new ArrayList<RaceOption>();

    @Override
    public String entityClassName() {
        return Gender.class.getSimpleName();
    }

    // -- [id] ------------------------

    @Override
    @Column(name = "id", precision = 10)
    @GeneratedValue(strategy = IDENTITY)
    @Id
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Integer id) {
        this.id = id;
    }

    public Gender id(Integer id) {
        setId(id);
        return this;
    }

    @Override
    @Transient
    public boolean isIdSet() {
        return id != null;
    }
    // -- [name] ------------------------

    @Size(max = 200)
    @Column(name = "name", unique = true, length = 200)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Gender name(String name) {
        setName(name);
        return this;
    }
    // -- [strengthmin] ------------------------

    @Digits(integer = 10, fraction = 0)
    @Column(name = "strengthmin", precision = 10)
    public Integer getStrengthmin() {
        return strengthmin;
    }

    public void setStrengthmin(Integer strengthmin) {
        this.strengthmin = strengthmin;
    }

    public Gender strengthmin(Integer strengthmin) {
        setStrengthmin(strengthmin);
        return this;
    }
    // -- [strengthmax] ------------------------

    @Digits(integer = 10, fraction = 0)
    @Column(name = "strengthmax", precision = 10)
    public Integer getStrengthmax() {
        return strengthmax;
    }

    public void setStrengthmax(Integer strengthmax) {
        this.strengthmax = strengthmax;
    }

    public Gender strengthmax(Integer strengthmax) {
        setStrengthmax(strengthmax);
        return this;
    }
    // -- [agilitymin] ------------------------

    @Digits(integer = 10, fraction = 0)
    @Column(name = "agilitymin", precision = 10)
    public Integer getAgilitymin() {
        return agilitymin;
    }

    public void setAgilitymin(Integer agilitymin) {
        this.agilitymin = agilitymin;
    }

    public Gender agilitymin(Integer agilitymin) {
        setAgilitymin(agilitymin);
        return this;
    }
    // -- [agilitymax] ------------------------

    @Digits(integer = 10, fraction = 0)
    @Column(name = "agilitymax", precision = 10)
    public Integer getAgilitymax() {
        return agilitymax;
    }

    public void setAgilitymax(Integer agilitymax) {
        this.agilitymax = agilitymax;
    }

    public Gender agilitymax(Integer agilitymax) {
        setAgilitymax(agilitymax);
        return this;
    }
    // -- [endurancemin] ------------------------

    @Digits(integer = 10, fraction = 0)
    @Column(name = "endurancemin", precision = 10)
    public Integer getEndurancemin() {
        return endurancemin;
    }

    public void setEndurancemin(Integer endurancemin) {
        this.endurancemin = endurancemin;
    }

    public Gender endurancemin(Integer endurancemin) {
        setEndurancemin(endurancemin);
        return this;
    }
    // -- [endurancemax] ------------------------

    @Digits(integer = 10, fraction = 0)
    @Column(name = "endurancemax", precision = 10)
    public Integer getEndurancemax() {
        return endurancemax;
    }

    public void setEndurancemax(Integer endurancemax) {
        this.endurancemax = endurancemax;
    }

    public Gender endurancemax(Integer endurancemax) {
        setEndurancemax(endurancemax);
        return this;
    }
    // -- [intelligencemin] ------------------------

    @Digits(integer = 10, fraction = 0)
    @Column(name = "intelligencemin", precision = 10)
    public Integer getIntelligencemin() {
        return intelligencemin;
    }

    public void setIntelligencemin(Integer intelligencemin) {
        this.intelligencemin = intelligencemin;
    }

    public Gender intelligencemin(Integer intelligencemin) {
        setIntelligencemin(intelligencemin);
        return this;
    }
    // -- [intelligencemax] ------------------------

    @Digits(integer = 10, fraction = 0)
    @Column(name = "intelligencemax", precision = 10)
    public Integer getIntelligencemax() {
        return intelligencemax;
    }

    public void setIntelligencemax(Integer intelligencemax) {
        this.intelligencemax = intelligencemax;
    }

    public Gender intelligencemax(Integer intelligencemax) {
        setIntelligencemax(intelligencemax);
        return this;
    }
    // -- [charismamin] ------------------------

    @Digits(integer = 10, fraction = 0)
    @Column(name = "charismamin", precision = 10)
    public Integer getCharismamin() {
        return charismamin;
    }

    public void setCharismamin(Integer charismamin) {
        this.charismamin = charismamin;
    }

    public Gender charismamin(Integer charismamin) {
        setCharismamin(charismamin);
        return this;
    }
    // -- [charismamax] ------------------------

    @Digits(integer = 10, fraction = 0)
    @Column(name = "charismamax", precision = 10)
    public Integer getCharismamax() {
        return charismamax;
    }

    public void setCharismamax(Integer charismamax) {
        this.charismamax = charismamax;
    }

    public Gender charismamax(Integer charismamax) {
        setCharismamax(charismamax);
        return this;
    }
    // -- [perceptionmin] ------------------------

    @Digits(integer = 10, fraction = 0)
    @Column(name = "perceptionmin", precision = 10)
    public Integer getPerceptionmin() {
        return perceptionmin;
    }

    public void setPerceptionmin(Integer perceptionmin) {
        this.perceptionmin = perceptionmin;
    }

    public Gender perceptionmin(Integer perceptionmin) {
        setPerceptionmin(perceptionmin);
        return this;
    }
    // -- [perceptionmax] ------------------------

    @Digits(integer = 10, fraction = 0)
    @Column(name = "perceptionmax", precision = 10)
    public Integer getPerceptionmax() {
        return perceptionmax;
    }

    public void setPerceptionmax(Integer perceptionmax) {
        this.perceptionmax = perceptionmax;
    }

    public Gender perceptionmax(Integer perceptionmax) {
        setPerceptionmax(perceptionmax);
        return this;
    }
    // -- [luckmin] ------------------------

    @Digits(integer = 10, fraction = 0)
    @Column(name = "luckmin", precision = 10)
    public Integer getLuckmin() {
        return luckmin;
    }

    public void setLuckmin(Integer luckmin) {
        this.luckmin = luckmin;
    }

    public Gender luckmin(Integer luckmin) {
        setLuckmin(luckmin);
        return this;
    }
    // -- [luckmax] ------------------------

    @Digits(integer = 10, fraction = 0)
    @Column(name = "luckmax", precision = 10)
    public Integer getLuckmax() {
        return luckmax;
    }

    public void setLuckmax(Integer luckmax) {
        this.luckmax = luckmax;
    }

    public Gender luckmax(Integer luckmax) {
        setLuckmax(luckmax);
        return this;
    }
    // -- [heightmin] ------------------------

    @Digits(integer = 10, fraction = 0)
    @Column(name = "heightmin", precision = 10)
    public Integer getHeightmin() {
        return heightmin;
    }

    public void setHeightmin(Integer heightmin) {
        this.heightmin = heightmin;
    }

    public Gender heightmin(Integer heightmin) {
        setHeightmin(heightmin);
        return this;
    }
    // -- [heightmax] ------------------------

    @Digits(integer = 10, fraction = 0)
    @Column(name = "heightmax", precision = 10)
    public Integer getHeightmax() {
        return heightmax;
    }

    public void setHeightmax(Integer heightmax) {
        this.heightmax = heightmax;
    }

    public Gender heightmax(Integer heightmax) {
        setHeightmax(heightmax);
        return this;
    }
    // -- [weightmin] ------------------------

    @Digits(integer = 10, fraction = 0)
    @Column(name = "weightmin", precision = 10)
    public Integer getWeightmin() {
        return weightmin;
    }

    public void setWeightmin(Integer weightmin) {
        this.weightmin = weightmin;
    }

    public Gender weightmin(Integer weightmin) {
        setWeightmin(weightmin);
        return this;
    }
    // -- [weightmax] ------------------------

    @Digits(integer = 10, fraction = 0)
    @Column(name = "weightmax", precision = 10)
    public Integer getWeightmax() {
        return weightmax;
    }

    public void setWeightmax(Integer weightmax) {
        this.weightmax = weightmax;
    }

    public Gender weightmax(Integer weightmax) {
        setWeightmax(weightmax);
        return this;
    }
    // -- [creationDate] ------------------------

    @Column(name = "creation_date", length = 29)
    public Instant getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Instant creationDate) {
        this.creationDate = creationDate;
    }

    public Gender creationDate(Instant creationDate) {
        setCreationDate(creationDate);
        return this;
    }
    // -- [creationAuthor] ------------------------

    @Column(name = "creation_author", length = 200)
    public String getCreationAuthor() {
        return creationAuthor;
    }

    public void setCreationAuthor(String creationAuthor) {
        this.creationAuthor = creationAuthor;
    }

    public Gender creationAuthor(String creationAuthor) {
        setCreationAuthor(creationAuthor);
        return this;
    }
    // -- [lastModificationDate] ------------------------

    @Column(name = "last_modification_date", length = 29)
    public Instant getLastModificationDate() {
        return lastModificationDate;
    }

    public void setLastModificationDate(Instant lastModificationDate) {
        this.lastModificationDate = lastModificationDate;
    }

    public Gender lastModificationDate(Instant lastModificationDate) {
        setLastModificationDate(lastModificationDate);
        return this;
    }
    // -- [lastModificationAuthor] ------------------------

    @Column(name = "last_modification_author", length = 200)
    public String getLastModificationAuthor() {
        return lastModificationAuthor;
    }

    public void setLastModificationAuthor(String lastModificationAuthor) {
        this.lastModificationAuthor = lastModificationAuthor;
    }

    public Gender lastModificationAuthor(String lastModificationAuthor) {
        setLastModificationAuthor(lastModificationAuthor);
        return this;
    }
    // -- [version] ------------------------

    @Column(name = "version", precision = 10)
    @Version
    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public Gender version(Integer version) {
        setVersion(version);
        return this;
    }

    // -----------------------------------------------------------------
    // Many to Many
    // -----------------------------------------------------------------

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    // many-to-many: gender ==> theRacesOptions
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

    /**
     * Returns the {@link #theRacesOptions} list.
     */
    @ManyToMany(mappedBy = "theGenders")
    public List<RaceOption> getTheRacesOptions() {
        return theRacesOptions;
    }

    /**
     * Set the {@link #theRacesOptions} list.
     *
     * @param theRacesOptions the list of RaceOption
     */
    public void setTheRacesOptions(List<RaceOption> theRacesOptions) {
        this.theRacesOptions = theRacesOptions;
    }

    /**
     * Helper method to add the passed {@link RaceOption} to the {@link #theRacesOptions} list.
     */
    public boolean addAnRaceOption(RaceOption anRaceOption) {
        return getTheRacesOptions().add(anRaceOption);
    }

    /**
     * Helper method to remove the passed {@link RaceOption} from the {@link #theRacesOptions} list.
     */
    public boolean removeAnRaceOption(RaceOption anRaceOption) {
        return getTheRacesOptions().remove(anRaceOption);
    }

    /**
     * Helper method to determine if the passed {@link RaceOption} is present in the {@link #theRacesOptions} list.
     */
    public boolean containsAnRaceOption(RaceOption anRaceOption) {
        return getTheRacesOptions() != null && getTheRacesOptions().contains(anRaceOption);
    }

    /**
     * Apply the default values.
     */
    public Gender withDefaults() {
        return this;
    }

    /**
     * Equals implementation using a business key.
     */
    @Override
    public boolean equals(Object other) {
        return this == other || (other instanceof Gender && hashCode() == other.hashCode());
    }

    private IdentifiableHashBuilder identifiableHashBuilder = new IdentifiableHashBuilder();

    @Override
    public int hashCode() {
        return identifiableHashBuilder.hash(log, this);
    }

    /**
     * Construct a readable string representation for this Gender instance.
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return MoreObjects.toStringHelper(this) //
                .add("id", getId()) //
                .add("name", getName()) //
                .add("strengthmin", getStrengthmin()) //
                .add("strengthmax", getStrengthmax()) //
                .add("agilitymin", getAgilitymin()) //
                .add("agilitymax", getAgilitymax()) //
                .add("endurancemin", getEndurancemin()) //
                .add("endurancemax", getEndurancemax()) //
                .add("intelligencemin", getIntelligencemin()) //
                .add("intelligencemax", getIntelligencemax()) //
                .add("charismamin", getCharismamin()) //
                .add("charismamax", getCharismamax()) //
                .add("perceptionmin", getPerceptionmin()) //
                .add("perceptionmax", getPerceptionmax()) //
                .add("luckmin", getLuckmin()) //
                .add("luckmax", getLuckmax()) //
                .add("heightmin", getHeightmin()) //
                .add("heightmax", getHeightmax()) //
                .add("weightmin", getWeightmin()) //
                .add("weightmax", getWeightmax()) //
                .add("creationDate", getCreationDate()) //
                .add("creationAuthor", getCreationAuthor()) //
                .add("lastModificationDate", getLastModificationDate()) //
                .add("lastModificationAuthor", getLastModificationAuthor()) //
                .add("version", getVersion()) //
                .toString();
    }

    @PrePersist
    protected void prePersist() {
        if (AuditContextHolder.audit()) {
            setCreationAuthor(AuditContextHolder.username());
            setCreationDate(Instant.now());

        }
    }

    @PreUpdate
    protected void preUpdate() {
        if (AuditContextHolder.audit()) {
            setLastModificationAuthor(AuditContextHolder.username());
            setLastModificationDate(Instant.now());
        }
    }
}