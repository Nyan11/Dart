Class {
	#name : 'DartDocumentReference',
	#superclass : 'Object',
	#instVars : [
		'file',
		'documentNumber'
	],
	#category : 'DartRequirementFederation',
	#package : 'DartRequirementFederation'
}

{ #category : 'comparing' }
DartDocumentReference >> = arg1 [

	self == arg1 ifTrue: [ ^ true ].
	nil.
	self class = arg1 class ifFalse: [ ^ false ].
	^ documentNumber = arg1 documentNumber
]

{ #category : 'requirements' }
DartDocumentReference >> collectRequirements: aDartRequirementsCollector [

	self file exists ifFalse: [ self error: 'File does not exists' ].
	^ aDartRequirementsCollector
		  documentReference: self;
		  collectRequirements
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
DartDocumentReference >> file: arg1 [

	file := arg1
]

{ #category : 'comparing' }
DartDocumentReference >> hash [

	^ documentNumber hash
]

{ #category : 'testing' }
DartDocumentReference >> isDocumentReference [

	^ true
]

{ #category : 'testing' }
DartDocumentReference >> isRequirementReference [

	^ false
]
