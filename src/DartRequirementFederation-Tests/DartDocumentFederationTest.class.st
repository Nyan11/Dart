Class {
	#name : 'DartDocumentFederationTest',
	#superclass : 'TestCase',
	#instVars : [
		'fs',
		'requirementFile',
		'cls'
	],
	#category : 'DartRequirementFederation-Tests',
	#package : 'DartRequirementFederation-Tests'
}

{ #category : 'accessing' }
DartDocumentFederationTest >> dummyclass [

	^ cls
]

{ #category : 'instance creation' }
DartDocumentFederationTest >> newDummyClass [

	^ self class classInstaller make: [ :aBuilder |
			  aBuilder
				  name: #DummyClassForDartDocumentFederation;
				  package: 'DummyPackage' ]
]

{ #category : 'running' }
DartDocumentFederationTest >> requirementFile [

	^ requirementFile
]

{ #category : 'instance creation' }
DartDocumentFederationTest >> requirementFileContents [

	^ 'requirement 1 - This is the first requirement.
	item1
	item2

requirement 2 - This is the second requirement.
	item1
	item2

requirement 3 - This is the last Requirement.
'
]

{ #category : 'running' }
DartDocumentFederationTest >> setUp [

	super setUp.
	
	cls := self newDummyClass.
	
	fs := FileSystem memory.
	requirementFile := (fs workingDirectory
	                    /
		                    '_DartDocumentFederationTest_requirementFile.txt')
		                   writeStreamDo: [ :stream |
			                   stream nextPutAll: self requirementFileContents ];
		                   yourself
]

{ #category : 'running' }
DartDocumentFederationTest >> tearDown [

	requirementFile ensureDelete.
	
	cls ifNotNil: [ cls isObsolete ifFalse: [ cls removeFromSystem ] ].
	
	super tearDown
]

{ #category : 'tests' }
DartDocumentFederationTest >> testRequirementReferences [

	| doc requirements federation storedRepository |
	SystemVersion current major = 14 ifTrue: [ self skip ].

	doc := DartDocumentReference new
		       file: self requirementFile;
		       yourself.
	requirements := doc collectRequirements:
		                (DartSplitDocumentCollector new splitOn: '<r><r>').
	self assert: requirements size equals: 3.

	federation := DartDocumentFederation new
		              addAllRequirementReferences: requirements;
		              yourself.
	self assert: federation requirementReferences size equals: 3.
	self assert: federation documentReferences size equals: 1.

	federation storeIn: self dummyclass.
	storedRepository := self dummyclass federation.

	self assert: storedRepository requirementReferences size equals: 3.
	self assert: federation documentReferences size equals: 1
]
