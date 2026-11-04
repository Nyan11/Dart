Class {
	#name : 'DartDynamicLinkConfiguration',
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
DartDynamicLinkConfiguration >> afterAssertion [

	^ afterAssertion
]

{ #category : 'accessing' }
DartDynamicLinkConfiguration >> afterAssertion: anObject [

	afterAssertion := anObject
]

{ #category : 'accessing' }
DartDynamicLinkConfiguration >> afterCodeExecution [

	^ afterCodeExecution
]

{ #category : 'accessing' }
DartDynamicLinkConfiguration >> afterCodeExecution: anObject [

	afterCodeExecution := anObject
]

{ #category : 'accessing' }
DartDynamicLinkConfiguration >> beforeAssertion [

	^ beforeAssertion
]

{ #category : 'accessing' }
DartDynamicLinkConfiguration >> beforeAssertion: anObject [

	beforeAssertion := anObject
]

{ #category : 'accessing' }
DartDynamicLinkConfiguration >> beforeCodeExecution [

	^ beforeCodeExecution
]

{ #category : 'accessing' }
DartDynamicLinkConfiguration >> beforeCodeExecution: anObject [

	beforeCodeExecution := anObject
]

{ #category : 'initialization' }
DartDynamicLinkConfiguration >> initialize [

	super initialize.
	beforeAssertion := [ true ].
	afterAssertion := [ true ].
	beforeCodeExecution := [ ].
	afterCodeExecution := [ ].
	tracingReceiver := true
]

{ #category : 'as yet unclassified' }
DartDynamicLinkConfiguration >> isTracingReceiver [

	^ tracingReceiver
]

{ #category : 'as yet unclassified' }
DartDynamicLinkConfiguration >> isTracingReturnValue [

	^ tracingReceiver not
]

{ #category : 'as yet unclassified' }
DartDynamicLinkConfiguration >> traceBehaviorReceiver [

	tracingReceiver := true
]

{ #category : 'as yet unclassified' }
DartDynamicLinkConfiguration >> traceBehaviorReturnValue [

	tracingReceiver := false
]
