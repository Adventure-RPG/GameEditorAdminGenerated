//
// Project home: https://github.com/jaxio/celerio-angular-quickstart
// 
// Source code generated by Celerio, an Open Source code generator by Jaxio.
// Documentation: http://www.jaxio.com/documentation/celerio/
// Source code: https://github.com/jaxio/celerio/
// Follow us on twitter: @jaxiosoft
// This header can be customized in Celerio conf...
// Template pack-angular:web/src/app/entities/entity-detail.component.ts.e.vm
//
import {Component, OnInit, OnDestroy, Input, Output, EventEmitter} from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { SelectItem } from 'primeng/primeng';
import { MessageService} from '../../service/message.service';
import {Character} from './character';
import {CharacterService} from './character.service';
import {Characteristic} from '../characteristic/characteristic';
import {Race} from '../race/race';
import {Skill} from '../skill/skill';
import {SkillService} from '../skill/skill.service';

@Component({
    moduleId: module.id,
	templateUrl: 'character-detail.component.html',
	selector: 'character-detail',
})
export class CharacterDetailComponent implements OnInit, OnDestroy {
    character : Character;

    private params_subscription: any;

    sourceTheSkills : Skill[] = [];

    @Input() sub : boolean = false;
    @Input() // used to pass the parent when creating a new Character
    set charc(charc : Characteristic) {
        this.character = new Character();
        this.character.charc = charc;
    }

    @Input() // used to pass the parent when creating a new Character
    set race(race : Race) {
        this.character = new Character();
        this.character.race = race;
    }

    @Output() onSaveClicked = new EventEmitter<Character>();
    @Output() onCancelClicked = new EventEmitter();

    constructor(private route: ActivatedRoute, private router: Router, private messageService: MessageService, private characterService: CharacterService, private skillService : SkillService) {
        skillService.complete(null).
            subscribe(theSkills => this.sourceTheSkills = theSkills,
                        error =>  this.messageService.error('Constructor error', error));
    }

    ngOnInit() {
        if (this.sub) {
            return;
        }

        this.params_subscription = this.route.params.subscribe(params => {
            let id = params['id'];
            console.log('ngOnInit for character-detail ' + id);

            if (id === 'new') {
                this.character = new Character();
            } else {
                this.characterService.getCharacter(id)
                    .subscribe(character => {
                            this.character = character;
                            this.sourceTheSkills = this.sourceTheSkills.filter(item => this.character.theSkills.map((e) => e.id).indexOf(item.id) < 0);
                        },
                        error =>  this.messageService.error('ngOnInit error', error)
                    );
            }
        });
    }

    ngOnDestroy() {
        if (!this.sub) {
            this.params_subscription.unsubscribe();
        }
    }

    gotoCharc() {
        this.router.navigate(['/characteristic', this.character.charc.id]);
    }

    clearCharc() {
        this.character.charc = null;
    }

    gotoRace() {
        this.router.navigate(['/race', this.character.race.id]);
    }

    clearRace() {
        this.character.race = null;
    }

    onSave() {
        this.characterService.update(this.character).
            subscribe(
                character => {
                    this.character = character;
                    if (this.sub) {
                        this.onSaveClicked.emit(this.character);
                        this.messageService.info('Saved OK and msg emitted', 'Angular Rocks!')
                    } else {
                        this.messageService.info('Saved OK', 'Angular Rocks!')
                    }
                },
                error =>  this.messageService.error('Could not save', error)
            );
    }

    onCancel() {
        if (this.sub) {
            this.onCancelClicked.emit("cancel");
            this.messageService.info('Cancel clicked and msg emitted', 'Angular Rocks!')
        }
    }

}
