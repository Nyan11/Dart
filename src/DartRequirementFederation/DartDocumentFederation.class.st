Class {
	#name : 'DartDocumentFederation',
	#superclass : 'Object',
	#instVars : [
		'documentReferences',
		'currentDocumentNumber'
	],
	#category : 'DartRequirementFederation',
	#package : 'DartRequirementFederation'
}

{ #category : 'adding' }
DartDocumentFederation >> addDocumentReference: aDartDocumentReference [

	aDartDocumentReference  documentNumber: self nextDocumentNumber.
	^ self documentReferences add: aDartDocumentReference
]

{ #category : 'accessing' }
DartDocumentFederation >> documentReferences [

	^ documentReferences
]

{ #category : 'initialization' }
DartDocumentFederation >> initialize [

	super initialize.
	documentReferences := OrderedCollection new.
	currentDocumentNumber := 0
]

{ #category : 'adding' }
DartDocumentFederation >> nextDocumentNumber [

	^ currentDocumentNumber := currentDocumentNumber + 1
]

{ #category : 'accessing' }
DartDocumentFederation >> requirementReferences [

	^ self documentReferences flatCollect: [ :doc |
		  doc requirementReferences ]
]
