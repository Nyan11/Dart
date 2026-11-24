Class {
	#name : 'DartLinkRepository',
	#superclass : 'Object',
	#instVars : [
		'instrumentationIsStarted',
		'backendClass',
		'links',
		'dynamicLinkExecutionResults'
	],
	#category : 'DartDynamicLinks',
	#package : 'DartDynamicLinks'
}

{ #category : 'adding' }
DartLinkRepository >> addDynamicLinkExecutionResult: aDynamicLinkExecutionResult [

	self dynamicLinkExecutionResults add: aDynamicLinkExecutionResult
]

{ #category : 'actions' }
DartLinkRepository >> addLinkToRequirement: aRequirementReference andBehavior: aBehaviour [

	^ self
		  addLinkToRequirement: aRequirementReference
		  andBehavior: aBehaviour
		  withConfiguration: self defaultConfiguration
]

{ #category : 'actions' }
DartLinkRepository >> addLinkToRequirement: aRequirementReference andBehavior: aBehavior withConfiguration: aConfiguration [

	| link backend |
	backend := self backendClass new
		           linkRepository: self;
		           yourself.
	link := DartLink new
		        backend: backend;
		        linkedRequirementReference: aRequirementReference;
		        linkedBehavior: aBehavior;
		        configuration: aConfiguration.

	self links add: link.
	self instrumentationIsStarted ifTrue: [ link startInstrumentation ].
	^ link
]

{ #category : 'accessing' }
DartLinkRepository >> backendClass [

	^ backendClass
]

{ #category : 'accessing' }
DartLinkRepository >> backendClass: anObject [

	backendClass := anObject
]

{ #category : 'actions' }
DartLinkRepository >> defaultConfiguration [

	^ DartLinkConfiguration new
]

{ #category : 'initialization' }
DartLinkRepository >> dynamicLinkExecutionResults [

	^ dynamicLinkExecutionResults
]

{ #category : 'initialization' }
DartLinkRepository >> initialize [

	super initialize.
	instrumentationIsStarted := false.
	links := OrderedCollection new.
	dynamicLinkExecutionResults := OrderedCollection new
]

{ #category : 'accessing' }
DartLinkRepository >> instrumentationIsStarted [

	^ instrumentationIsStarted
]

{ #category : 'accessing' }
DartLinkRepository >> instrumentationIsStarted: anObject [

	instrumentationIsStarted := anObject
]

{ #category : 'as yet unclassified' }
DartLinkRepository >> links [

	^ links
]

{ #category : 'actions' }
DartLinkRepository >> startDynamicTracing [

	self instrumentationIsStarted: true.
	self links do: [ :link | link startDynamicTracing ]
]

{ #category : 'actions' }
DartLinkRepository >> stopDynamicTracing [

	self instrumentationIsStarted: false.
	self links do: [ :link | link stopDynamicTracing ]
]
