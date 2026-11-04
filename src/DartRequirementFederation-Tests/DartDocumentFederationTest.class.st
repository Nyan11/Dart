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

	| doc repository storedRepository |
	doc := requirementFile asDocumentReference.
	doc defineFormat: (DartDocumentFormat block: [ :contents |
				 ('' join: {
						  Character cr.
						  Character cr }) split: contents ]).
	repository := DartDocumentFederation new
		              addDocumentReference: doc;
		              yourself.
	repository storeIn: self dummyclass.
	storedRepository := self dummyclass federation.

	self assert: repository requirementReferences size equals: 3.
	self assert: storedRepository requirementReferences size equals: 3
]
