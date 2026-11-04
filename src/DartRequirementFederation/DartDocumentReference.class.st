Class {
	#name : 'DartDocumentReference',
	#superclass : 'Object',
	#instVars : [
		'requirementReferences',
		'file',
		'format',
		'currentRequirementNumber',
		'documentNumber'
	],
	#category : 'DartRequirementFederation',
	#package : 'DartRequirementFederation'
}

{ #category : 'adding' }
DartDocumentReference >> addRequirementReference: aRequirementReference [

	requirementReferences := requirementReferences
	                         , { aRequirementReference }.
	aRequirementReference
		document: self;
		format: self format;
		requirementNumber: self nextRequirementNumber
]

{ #category : 'as yet unclassified' }
DartDocumentReference >> defineFormat: aDartDocumentFormat [

	format := aDartDocumentFormat.
	self requirementReferences:
		(aDartDocumentFormat findRequirementsFor: self)
]

{ #category : 'accessing' }
DartDocumentReference >> documentNumber [

	^ documentNumber
]

{ #category : 'accessing' }
DartDocumentReference >> documentNumber: anObject [

	documentNumber := anObject
]

{ #category : 'accessing' }
DartDocumentReference >> file [

	^ file
]

{ #category : 'accessing' }
DartDocumentReference >> file: anObject [

	file := anObject asFileReference
]

{ #category : 'accessing' }
DartDocumentReference >> format [

	^ format
]

{ #category : 'accessing' }
DartDocumentReference >> format: anObject [

	format := anObject
]

{ #category : 'initialization' }
DartDocumentReference >> initialize [

	super initialize.
	requirementReferences := {  }.
	currentRequirementNumber := 0
]

{ #category : 'accessing' }
DartDocumentReference >> nextRequirementNumber [

	^ currentRequirementNumber := currentRequirementNumber + 1
]

{ #category : 'accessing' }
DartDocumentReference >> requirementReferences [

	^ requirementReferences
]

{ #category : 'accessing' }
DartDocumentReference >> requirementReferences: aCollectionOfRequirementReferences [

	aCollectionOfRequirementReferences do: [ :each | each requirementNumber: self nextRequirementNumber ].
	requirementReferences := aCollectionOfRequirementReferences
]
