Class {
	#name : 'DartRequirementsCollector',
	#superclass : 'Object',
	#instVars : [
		'documentReference'
	],
	#category : 'DartRequirementFederation',
	#package : 'DartRequirementFederation'
}

{ #category : 'requirements' }
DartRequirementsCollector >> collectRequirements [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
DartRequirementsCollector >> documentReference [

	^ documentReference
]

{ #category : 'accessing' }
DartRequirementsCollector >> documentReference: anObject [

	documentReference := anObject
]
