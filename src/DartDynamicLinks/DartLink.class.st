Class {
	#name : 'DartLink',
	#superclass : 'Object',
	#instVars : [
		'linkedRequirementReference',
		'linkedBehavior',
		'configuration',
		'backend'
	],
	#category : 'DartDynamicLinks',
	#package : 'DartDynamicLinks'
}

{ #category : 'accessing' }
DartLink >> backend [

	^ backend
]

{ #category : 'accessing' }
DartLink >> backend: aDynmicLinkBackend [

	backend := aDynmicLinkBackend.
	aDynmicLinkBackend link: self
]

{ #category : 'accessing' }
DartLink >> configuration [

	^ configuration
]

{ #category : 'accessing' }
DartLink >> configuration: anObject [

	configuration := anObject
]

{ #category : 'accessing' }
DartLink >> linkedBehavior [

	^ linkedBehavior
]

{ #category : 'accessing' }
DartLink >> linkedBehavior: anObject [

	linkedBehavior := anObject
]

{ #category : 'accessing' }
DartLink >> linkedRequirementReference [

	^ linkedRequirementReference
]

{ #category : 'accessing' }
DartLink >> linkedRequirementReference: anObject [

	linkedRequirementReference := anObject
]

{ #category : 'instrumentation' }
DartLink >> startDynamicTracing [

	self backend startInstrumentation
]

{ #category : 'instrumentation' }
DartLink >> stopDynamicTracing [

	self backend stopInstrumentation
]
