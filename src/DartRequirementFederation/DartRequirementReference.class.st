Class {
	#name : 'DartRequirementReference',
	#superclass : 'Object',
	#instVars : [
		'contents',
		'format',
		'document',
		'requirementNumber',
		'storeMethod'
	],
	#category : 'DartRequirementFederation',
	#package : 'DartRequirementFederation'
}

{ #category : 'accessing' }
DartRequirementReference >> contents [

	^ contents
]

{ #category : 'accessing' }
DartRequirementReference >> contents: anObject [

	contents := anObject
]

{ #category : 'accessing' }
DartRequirementReference >> document [

	^ document
]

{ #category : 'accessing' }
DartRequirementReference >> document: anObject [

	document := anObject
]

{ #category : 'accessing' }
DartRequirementReference >> format [

	^ format
]

{ #category : 'accessing' }
DartRequirementReference >> format: anObject [

	format := anObject
]

{ #category : 'initialization' }
DartRequirementReference >> initialize [

	| possibleStoreMethod |
	super initialize.
	possibleStoreMethod := thisContext sender sender method.
	(possibleStoreMethod hasPragmaNamed: #DartRequirement) ifTrue: [
		self storeMethod: possibleStoreMethod ]
]

{ #category : 'accessing' }
DartRequirementReference >> requirementNumber [

	^ requirementNumber
]

{ #category : 'accessing' }
DartRequirementReference >> requirementNumber: anObject [

	requirementNumber := anObject
]

{ #category : 'accessing' }
DartRequirementReference >> storeMethod [

	^ storeMethod
]

{ #category : 'accessing' }
DartRequirementReference >> storeMethod: anObject [

	storeMethod := anObject
]
