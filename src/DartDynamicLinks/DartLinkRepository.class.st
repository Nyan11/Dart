Class {
	#name : 'DartLinkRepository',
	#superclass : 'Object',
	#instVars : [
		'dynamicLinks',
		'instrumentationIsStarted',
		'backendClass'
	],
	#category : 'DartDynamicLinks',
	#package : 'DartDynamicLinks'
}

{ #category : 'actions' }
DartLinkRepository >> addLinkToRequirement: aRequirementReference andBehavior: aBehaviour [

	^ self
		  addLinkToRequirement: aRequirementReference
		  andBehavior: aBehaviour
		  withConfiguration: self defaultConfiguration
]

{ #category : 'actions' }
DartLinkRepository >> addLinkToRequirement: aRequirementReference andBehavior: aBehaviour withConfiguration: aConfiguration [

	| link |
	link := DartDynamicLink new
		        backend: self backendClass new;
		        linkedRequirementReference: aRequirementReference;
		        linkedBehavior: aBehaviour;
		        configuration: aConfiguration;
		        yourself.
	self dynamicLinks add: link.
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

	^ DartDynamicLinkConfiguration new
]

{ #category : 'as yet unclassified' }
DartLinkRepository >> dynamicLinks [

	^ dynamicLinks
]

{ #category : 'initialization' }
DartLinkRepository >> initialize [

	super initialize.
	dynamicLinks := OrderedCollection new.
	instrumentationIsStarted := false
]

{ #category : 'accessing' }
DartLinkRepository >> instrumentationIsStarted [

	^ instrumentationIsStarted
]

{ #category : 'accessing' }
DartLinkRepository >> instrumentationIsStarted: anObject [

	instrumentationIsStarted := anObject
]

{ #category : 'accessing' }
DartLinkRepository >> results [

	^ self dynamicLinks flatCollect: [ :each | each results ]
]

{ #category : 'actions' }
DartLinkRepository >> startDynamicTracing [

	self instrumentationIsStarted: true.
	self dynamicLinks do: [ :l | l startDynamicTracing ]
]

{ #category : 'actions' }
DartLinkRepository >> stopDynamicTracing [

	self instrumentationIsStarted: false.
	self dynamicLinks do: [ :l | l stopDynamicTracing ]
]
