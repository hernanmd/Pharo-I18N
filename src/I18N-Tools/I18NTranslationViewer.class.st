"
Provides a translation table UI based in Spec 2.

Open with:

```language=Pharo
I18NTranslationViewer open
```

"
Class {
	#name : #I18NTranslationViewer,
	#superclass : #SpPresenter,
	#instVars : [
		'translations'
	],
	#category : #'I18N-Tools-Translations'
}

{ #category : #'world menu' }
I18NTranslationViewer class >> menuCommandOn: aBuilder [
	<worldMenu>
	
	(aBuilder item: #'I18N Translations')
		action: [ self open  ]; 
		icon: (Smalltalk ui iconNamed: #scriptManagerIcon);
		order: 5.
		
	aBuilder withSeparatorAfter
]

{ #category : #'instance creation' }
I18NTranslationViewer class >> open [
	<script>

	^ self new open
]

{ #category : #layout }
I18NTranslationViewer >> defaultLayout [
    
    ^ self layout: (SpBoxLayout newTopToBottom
        add: #translations;
        yourself)
]

{ #category : #initialization }
I18NTranslationViewer >> initializePresenters [

	super initializePresenters.
	translations := self newTreeTable.
	self initializeTranslations
]

{ #category : #'private initializations' }
I18NTranslationViewer >> initializeTranslations [

	translations
		beResizable;
		roots: self translator defaultTranslator translationKeys sorted;
		children: [ :item | item asString ];
		addColumn: (SpStringTableColumn
				title: 'Key'
				evaluated: [ :node | node content asString ]).
	self translator translators valuesDo: [ :translator | 
		translations addColumn: (SpStringTableColumn
					title: translator getLanguage
				 evaluated: [ :node | 
					 (self translator forLanguage: translator getLanguage) 
						 translationFor: node content ]) ]
]

{ #category : #accessing }
I18NTranslationViewer >> title [

    ^ 'Translations'
]

{ #category : #'private initializations' }
I18NTranslationViewer >> translator [
	^ I18NTranslator
]
