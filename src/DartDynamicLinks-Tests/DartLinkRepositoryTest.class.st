Class {
	#name : 'DartLinkRepositoryTest',
	#superclass : 'TestCase',
	#instVars : [
		'repository',
		'requirement'
	],
	#category : 'DartDynamicLinks-Tests',
	#package : 'DartDynamicLinks-Tests'
}

{ #category : 'as yet unclassified' }
DartLinkRepositoryTest >> repository [

	^ repository
]

{ #category : 'as yet unclassified' }
DartLinkRepositoryTest >> requirement [

	^ requirement
]

{ #category : 'as yet unclassified' }
DartLinkRepositoryTest >> setUp [

	super setUp.
	repository := DartLinkRepository new
		              backendClass: DartDynamicLinkMpBackend;
		              yourself.
	requirement := 'This is a requirement.'
]

{ #category : 'as yet unclassified' }
DartLinkRepositoryTest >> tearDown [

	repository stopDynamicTracing.
	super tearDown
]

{ #category : 'as yet unclassified' }
DartLinkRepositoryTest >> testAddLinkToBehaviourWithRequirement [

	| link |
	link := self repository
		        addLinkToBehaviour: DartMockUpObject >> #testMethod
		        withRequirement: self requirement.
	self assert: link linkedRequirementReference equals: self requirement.
	self assert: link linkedBehavior equals: DartMockUpObject >> #testMethod.
	self assert: link results isEmpty.
	self assert: link configuration beforeCodeExecution isConstant.
	self assert: link configuration afterCodeExecution isConstant.
	self assert: link configuration beforeAssertion value.
	self assert: link configuration afterAssertion value.
	self assert: link configuration isTracingReceiver.
	self deny: link configuration isTracingReturnValue.
]

{ #category : 'as yet unclassified' }
DartLinkRepositoryTest >> testAddLinkToBehaviourWithRequirementWithConfiguration [

	| link configuration result |
	configuration := DartDynamicLinkConfiguration new
		                 beforeCodeExecution: [ :metadata :receiver :arguments |
			                 metadata at: #a put: true ];
		                 afterCodeExecution: [
			                 :metadata
			                 :receiver
			                 :arguments
			                 :returnValue | metadata at: #b put: true ];
		                 beforeAssertion: [ :metadata :receiver :arguments |
			                 metadata at: #c put: true ];
		                 afterAssertion: [
			                 :metadata
			                 :receiver
			                 :arguments
			                 :returnValue | metadata at: #d put: true ];
		                 traceBehaviorReturnValue;
		                 yourself.
	link := self repository
		        addLinkToBehaviour: DartMockUpObject >> #testMethod
		        withRequirement: self requirement
		        withConfiguration: configuration.
	self repository startDynamicTracing.
	DartMockUpObject new testMethod.
	self assert: link results size equals: 1.
	result := link results first.
	self assert: result object equals: 42.
	self assert: (result metadata at: #a).
	self assert: (result metadata at: #b).
	self assert: (result metadata at: #c).
	self assert: (result metadata at: #d)
]

{ #category : 'as yet unclassified' }
DartLinkRepositoryTest >> testInstrumentationIsStarted [

	self deny: self repository instrumentationIsStarted.
	self repository startDynamicTracing.
	self assert: self repository instrumentationIsStarted.
	self repository stopDynamicTracing.
	self deny: self repository instrumentationIsStarted
]

{ #category : 'as yet unclassified' }
DartLinkRepositoryTest >> testResults [

	| object |
	
	self repository
		addLinkToBehaviour: DartMockUpObject >> #testMethod
		withRequirement: requirement.

	self repository startDynamicTracing.
	
	self assert: self repository results isEmpty.
	object := DartMockUpObject new.
	object testMethod.
	self assert: self repository results size equals: 1.
	self assert: self repository results first object equals: object.
	self
		assert: self repository results first requirementReference
		equals: self requirement.
	object testMethod; testMethod; testMethod; testMethod.
	self assert: self repository results size equals: 5
]
