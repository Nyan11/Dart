Class {
	#name : 'DartRequirementReference',
	#superclass : 'Object',
	#instVars : [
		'contents',
		'requirementCollector',
		'documentReference',
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
DartRequirementReference >> documentReference [

	^ documentReference
]

{ #category : 'accessing' }
DartRequirementReference >> documentReference: anObject [

	documentReference := anObject
]

{ #category : 'initialization' }
DartRequirementReference >> initialize [

	| possibleStoreMethod |
	super initialize.
	possibleStoreMethod := thisContext sender sender method.
	(possibleStoreMethod hasPragmaNamed: #DartRequirement) ifTrue: [
		self storeMethod: possibleStoreMethod ]
]

{ #category : 'testing' }
DartRequirementReference >> isDocumentReference [

	^ false
]

{ #category : 'testing' }
DartRequirementReference >> isRequirementReference [

	^ true
]

{ #category : 'accessing' }
DartRequirementReference >> requirementCollector [

	^ requirementCollector
]

{ #category : 'accessing' }
DartRequirementReference >> requirementCollector: anObject [

	requirementCollector := anObject
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
