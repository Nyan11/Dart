Class {
	#name : 'DartDynamicLink',
	#superclass : 'Object',
	#instVars : [
		'linkedRequirementReference',
		'linkedBehavior',
		'configuration',
		'backend',
		'results'
	],
	#category : 'DartDynamicLinks',
	#package : 'DartDynamicLinks'
}

{ #category : 'adding' }
DartDynamicLink >> addResult: aDartLinkExecutionResult [ 

	self results add: aDartLinkExecutionResult
]

{ #category : 'accessing' }
DartDynamicLink >> backend [

	^ backend
]

{ #category : 'accessing' }
DartDynamicLink >> backend: aDynmicLinkBackend [

	backend := aDynmicLinkBackend.
	aDynmicLinkBackend dynamicLink: self
]

{ #category : 'accessing' }
DartDynamicLink >> configuration [

	^ configuration
]

{ #category : 'accessing' }
DartDynamicLink >> configuration: anObject [

	configuration := anObject
]

{ #category : 'initialization' }
DartDynamicLink >> initialize [

	super initialize.
	results := OrderedCollection new
]

{ #category : 'accessing' }
DartDynamicLink >> linkedBehavior [

	^ linkedBehavior
]

{ #category : 'accessing' }
DartDynamicLink >> linkedBehavior: anObject [

	linkedBehavior := anObject
]

{ #category : 'accessing' }
DartDynamicLink >> linkedRequirementReference [

	^ linkedRequirementReference
]

{ #category : 'accessing' }
DartDynamicLink >> linkedRequirementReference: anObject [

	linkedRequirementReference := anObject
]

{ #category : 'initialization' }
DartDynamicLink >> results [

	^ results
]

{ #category : 'instrumentation' }
DartDynamicLink >> startDynamicTracing [

	self backend startInstrumentation
]

{ #category : 'instrumentation' }
DartDynamicLink >> stopDynamicTracing [

	self backend stopInstrumentation
]
