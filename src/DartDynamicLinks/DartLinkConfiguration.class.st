Class {
	#name : 'DartLinkConfiguration',
	#superclass : 'Object',
	#instVars : [
		'beforeCodeExecution',
		'afterCodeExecution',
		'beforeAssertion',
		'afterAssertion',
		'tracingReceiver'
	],
	#category : 'DartDynamicLinks',
	#package : 'DartDynamicLinks'
}

{ #category : 'accessing' }
DartLinkConfiguration >> afterAssertion [

	^ afterAssertion
]

{ #category : 'accessing' }
DartLinkConfiguration >> afterAssertion: anObject [

	afterAssertion := anObject
]

{ #category : 'accessing' }
DartLinkConfiguration >> afterCodeExecution [

	^ afterCodeExecution
]

{ #category : 'accessing' }
DartLinkConfiguration >> afterCodeExecution: anObject [

	afterCodeExecution := anObject
]

{ #category : 'accessing' }
DartLinkConfiguration >> beforeAssertion [

	^ beforeAssertion
]

{ #category : 'accessing' }
DartLinkConfiguration >> beforeAssertion: anObject [

	beforeAssertion := anObject
]

{ #category : 'accessing' }
DartLinkConfiguration >> beforeCodeExecution [

	^ beforeCodeExecution
]

{ #category : 'accessing' }
DartLinkConfiguration >> beforeCodeExecution: anObject [

	beforeCodeExecution := anObject
]

{ #category : 'initialization' }
DartLinkConfiguration >> initialize [

	super initialize.
	beforeAssertion := [ true ].
	afterAssertion := [ true ].
	beforeCodeExecution := [ ].
	afterCodeExecution := [ ].
	tracingReceiver := true
]

{ #category : 'as yet unclassified' }
DartLinkConfiguration >> isTracingReceiver [

	^ tracingReceiver
]

{ #category : 'as yet unclassified' }
DartLinkConfiguration >> isTracingReturnValue [

	^ tracingReceiver not
]

{ #category : 'as yet unclassified' }
DartLinkConfiguration >> traceBehaviorReceiver [

	tracingReceiver := true
]

{ #category : 'as yet unclassified' }
DartLinkConfiguration >> traceBehaviorReturnValue [

	tracingReceiver := false
]
