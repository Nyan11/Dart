Class {
	#name : 'DartDynamicLinkExecutionResult',
	#superclass : 'Object',
	#instVars : [
		'metadata',
		'object',
		'dynamicLink'
	],
	#category : 'DartDynamicLinks',
	#package : 'DartDynamicLinks'
}

{ #category : 'accessing' }
DartDynamicLinkExecutionResult >> dynamicLink [

	^ dynamicLink
]

{ #category : 'accessing' }
DartDynamicLinkExecutionResult >> dynamicLink: anObject [

	dynamicLink := anObject
]

{ #category : 'as yet unclassified' }
DartDynamicLinkExecutionResult >> dynamicLinkConfiguration [

	^ self dynamicLink configuration
]

{ #category : 'initialization' }
DartDynamicLinkExecutionResult >> initialize [

	super initialize.
	metadata := Dictionary new
]

{ #category : 'initialization' }
DartDynamicLinkExecutionResult >> metadata [

	^ metadata
]

{ #category : 'accessing' }
DartDynamicLinkExecutionResult >> object [

	^ object
]

{ #category : 'accessing' }
DartDynamicLinkExecutionResult >> object: anObject [

	object := anObject
]

{ #category : 'as yet unclassified' }
DartDynamicLinkExecutionResult >> requirementReference [

	^ self dynamicLink linkedRequirementReference
]
