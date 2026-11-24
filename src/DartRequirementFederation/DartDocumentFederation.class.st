Class {
	#name : 'DartDocumentFederation',
	#superclass : 'Object',
	#instVars : [
		'requirementReferences',
		'documentReferences',
		'nextDocumentNumber'
	],
	#category : 'DartRequirementFederation',
	#package : 'DartRequirementFederation'
}

{ #category : 'adding' }
DartDocumentFederation >> addAllRequirementReferences: aCollection [

	aCollection do: [ :each | self addRequirementReference: each ]
]

{ #category : 'adding' }
DartDocumentFederation >> addRequirementReference: aRequirementReference [

	requirementReferences add: aRequirementReference.
	(self documentReferences includes:
		 aRequirementReference documentReference) ifTrue: [ ^ self ].
	aRequirementReference documentReference documentNumber:
		self nextDocumentNumber.
	documentReferences add: aRequirementReference documentReference
]

{ #category : 'accessing' }
DartDocumentFederation >> documentReferences [

	^ documentReferences
]

{ #category : 'initialization' }
DartDocumentFederation >> initialize [

	super initialize.
	requirementReferences := OrderedCollection new.
	documentReferences := OrderedCollection new.
	nextDocumentNumber := 0.
]

{ #category : 'initialization' }
DartDocumentFederation >> nextDocumentNumber [

	^ nextDocumentNumber := nextDocumentNumber + 1
]

{ #category : 'accessing' }
DartDocumentFederation >> requirementReferences [

	^ requirementReferences
]
