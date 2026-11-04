Class {
	#name : 'DartDynamicLinkMpHandler',
	#superclass : 'MpHandler',
	#instVars : [
		'dynamicLink',
		'pendingResults'
	],
	#category : 'DartDynamicLinks-MethodProxies',
	#package : 'DartDynamicLinks-MethodProxies'
}

{ #category : 'evaluating' }
DartDynamicLinkMpHandler >> afterExecutionWithReceiver: receiver arguments: args returnValue: value [

	| result |
	result := self pendingResults at: receiver.
	result metadata at: #afterExecutionTime put: DateAndTime now.
	result metadata
		at: #afterExecutionAssertion
		put: (self dynamicLink configuration afterAssertion
				 valueWithEnoughArguments: {
						 result metadata.
						 receiver.
						 args.
						 value }).
	self dynamicLink configuration afterCodeExecution
		valueWithEnoughArguments: {
				result metadata.
				receiver.
				args.
				value }.
	self dynamicLink configuration isTracingReceiver
		ifTrue: [ result object: receiver ]
		ifFalse: [ result object: value ].
	self dynamicLink addResult: result.
	self pendingResults removeKey: receiver.
	^ value
]

{ #category : 'evaluating' }
DartDynamicLinkMpHandler >> beforeExecutionWithReceiver: receiver arguments: args [

	| result |
	result := DartDynamicLinkExecutionResult new
		          dynamicLink: self dynamicLink;
		          yourself.
	self pendingResults at: receiver put: result.
	result metadata
		at: #beforeExecutionTime put: DateAndTime now;
		at: #beforeExecutionAssertion
		put: (self dynamicLink configuration beforeAssertion
				 valueWithEnoughArguments: {
						 result metadata.
						 receiver.
						 args }).
	self dynamicLink configuration beforeCodeExecution
		valueWithEnoughArguments: {
				result metadata.
				receiver.
				args }
]

{ #category : 'accessing' }
DartDynamicLinkMpHandler >> dynamicLink [

	^ dynamicLink
]

{ #category : 'accessing' }
DartDynamicLinkMpHandler >> dynamicLink: anObject [

	dynamicLink := anObject
]

{ #category : 'initialization' }
DartDynamicLinkMpHandler >> initialize [

	super initialize.
	pendingResults := IdentityDictionary new
]

{ #category : 'accessing' }
DartDynamicLinkMpHandler >> pendingResults [

	^ pendingResults
]
